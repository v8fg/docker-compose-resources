#!/usr/bin/env python3
import os
import sys
import json
import subprocess
import time
import argparse
from datetime import datetime

# =================================================================
# GLOBAL CONFIGURATION & LOGGING SETUP
# =================================================================
BASEDIR = os.path.abspath(os.path.dirname(__file__))
TODAY = datetime.now().strftime('%Y-%m-%d')
LOG_FILE = os.path.join(BASEDIR, f"images-log-{TODAY}.log")

def log_to_file(*args):
    """
    Streams log messages with timestamps to both console and the log file.
    """
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    message = f"[{timestamp}] {' '.join(map(str, args))}"
    print(message)
    try:
        with open(LOG_FILE, 'a', encoding='utf-8') as f:
            f.write(message + '\n')
    except Exception:
        pass

def get_existing_table_data(readme_path):
    """
    Extracts historical push data from existing README tables to maintain continuity.
    """
    history = {}
    if not os.path.exists(readme_path):
        return history
    try:
        with open(readme_path, 'r', encoding='utf-8') as f:
            for line in f:
                if line.startswith('|') and 'Service' not in line and '---' not in line:
                    parts = [p.strip() for p in line.split('|')]
                    if len(parts) >= 5:
                        img_key = parts[2].replace('`', '')
                        history[img_key] = {"status": parts[3], "last_push": parts[4]}
    except Exception as e:
        log_to_file(f"Error parsing README: {e}")
    return history

def generate_markdown_content(title, tasks, newly_updated_images, existing_history, finish_time, elapsed_time, service_summary=None, only_show_updates=False):
    """
    Generates structured Markdown content for reports.
    """
    total = len(tasks)
    pushed_list = [t for t in tasks if t['my_image'] in [img['name'] for img in newly_updated_images]]
    pushed_count = len(pushed_list)
    skipped = total - pushed_count

    content = f"# {title}\n\n"
    content += "### 📊 Execution Metrics\n"
    content += f"- **📅 Sync Time:** {finish_time}\n"
    if elapsed_time > 0:
        content += f"- **⏱️ Total Duration:** {elapsed_time}s\n"
    content += f"- **📦 Total Images Scanned:** {total}\n"
    content += f"- **✅ Newly Processed:** {pushed_count}\n"
    content += f"- **⏩ Skipped:** {skipped}\n\n"

    if service_summary:
        content += "### 📂 Service Status Overview\n"
        content += "| Directory | Service Name | Status | New Pushes |\n"
        content += "| :--- | :--- | :---: | :---: |\n"
        for s in service_summary:
            content += f"| {s['dir']} | {s['name']} | {s['status']} | {s['new_pushed']} |\n"
        content += "\n"

    content += "### 🛠 Image Details\n"
    newly_updated_names = [img['name'] for img in newly_updated_images]
    display_tasks = pushed_list if only_show_updates else tasks

    if not display_tasks and only_show_updates:
        content += "_No images were updated in this run._\n"
    else:
        content += "| Service | Image | Status | Last Push | Update Result |\n"
        content += "| :--- | :--- | :---: | :--- | :--- |\n"
        for task in display_tasks:
            img = task['my_image']
            if img in newly_updated_names:
                status, last_push, res = "✅ Done", finish_time, "Update ✨"
            elif img in existing_history:
                h = existing_history[img]
                status, last_push, res = h['status'], h['last_push'], "No Change"
            else:
                status = "✅ Done" if str(task.get('status', '')).strip().lower() == 'done' else "⏳ Pending"
                last_push, res = task.get('current_update') or "Never", "No Change"
            
            content += f"| {task['service']} | `{img}` | {status} | {last_push} | {res} |\n"
    
    return content

def render_template(template_path, output_path, variables):
    """
    Renders template files by replacing ${key} placeholders with variable values.
    """
    if not template_path or not os.path.exists(template_path):
        return False
    try:
        with open(template_path, 'r', encoding='utf-8') as f:
            content = f.read()
        for key, value in variables.items():
            content = content.replace(f"${{{key}}}", str(value))
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(content)
        return True
    except Exception:
        return False

def run_command(command, cwd, log_file):
    """
    Executes a shell command and logs output. Returns boolean success status.
    """
    try:
        with open(log_file, 'a') as lf:
            subprocess.run(command, check=True, stdout=lf, stderr=lf, text=True, cwd=cwd)
        return True
    except subprocess.CalledProcessError:
        return False

def find_image_configs(root_dir, target_services=None):
    """
    Locates images.json config files in the project structure.
    """
    configs = []
    if target_services:
        for service in target_services:
            json_path = os.path.join(root_dir, service, "images.json")
            if os.path.isfile(json_path):
                configs.append(json_path)
            else:
                log_to_file(f"⚠️  Warning: Config missing for service: '{service}'")
    else:
        for entry in os.scandir(root_dir):
            if entry.is_dir() and not entry.name.startswith('.'):
                json_path = os.path.join(entry.path, "images.json")
                if os.path.isfile(json_path):
                    configs.append(json_path)
    return configs

def main():
    parser = argparse.ArgumentParser(description="Multi-service Docker Pipeline")
    parser.add_argument('services', nargs='*', help='Service directories to process')
    # --dry-run: Logic modified to force file generation but block build/push/README
    parser.add_argument('--dry-run', '-d', action='store_true', help='Force regenerate manifests; skip build/push/README')
    args = parser.parse_args()

    start_sec = int(time.time())
    newly_updated_images = []
    all_tasks_global = [] 
    service_summary_list = []
    any_global_update = False
    
    config_files = find_image_configs(BASEDIR, args.services if args.services else None)
    
    if not config_files:
        log_to_file("Fatal Error: No configurations found.")
        return

    log_to_file(f"--- Pipeline Start: {len(config_files)} services detected ---")
    if args.dry_run:
        log_to_file("⚠️ DRY-RUN MODE: Manifests will be FORCE UPDATED. Docker actions and README updates are DISABLED.")

    for config_path in config_files:
        service_dir = os.path.dirname(config_path)
        actual_dir_name = os.path.basename(service_dir)
        service_tasks = []
        service_updated = False
        new_push_count = 0
        
        with open(config_path, 'r') as f:
            raw_tasks = json.load(f)
        if not raw_tasks: continue

        # --- Data Sanitization: Deduplication ---
        seen_images = set()
        unique_tasks = []
        for t in raw_tasks:
            img = t.get('my_image')
            if img not in seen_images:
                seen_images.add(img)
                unique_tasks.append(t)
        
        tasks = unique_tasks
        json_service_name = tasks[0].get('service', 'N/A')
        
        if json_service_name != actual_dir_name:
            log_to_file(f"⚠️  Path Mismatch: {actual_dir_name} vs {json_service_name}. Skipping.")
            continue

        log_to_file(f"📂 Service: [{json_service_name}]")

        for index, item in enumerate(tasks):
            image_name = item.get('my_image', 'N/A')
            container_name = item.get('container', json_service_name)
            progress = f"({index+1}/{len(tasks)})"
            
            # LOGIC: If dry-run is set, bypass the "done" check to force updates
            is_done = str(item.get('status', '')).strip().lower() == "done"
            
            if not is_done or args.dry_run:
                log_to_file(f"  {progress} {'[FORCE] ' if args.dry_run else ''}Processing Manifests: {image_name}")
                deploy_dir = os.path.join(service_dir, "deployments", container_name)
                os.makedirs(deploy_dir, exist_ok=True)
                
                t_vars = {"v_base_image": item.get('base_image'), "v_tz": item.get('tz', 'Asia/Shanghai'),
                          "v_container": container_name, "v_my_image": image_name}
                
                # Resolve templates
                spec_df = item.get('dockerfile_tpl')
                df_tpl = os.path.join(service_dir, spec_df) if spec_df and os.path.exists(os.path.join(service_dir, spec_df)) else os.path.join(service_dir, "Dockerfile.template")
                spec_cp = item.get('compose_tpl')
                cp_tpl = os.path.join(service_dir, spec_cp) if spec_cp and os.path.exists(os.path.join(service_dir, spec_cp)) else os.path.join(service_dir, "docker-compose.template")

                # REGENERATE FILES
                if render_template(df_tpl, os.path.join(deploy_dir, "Dockerfile"), t_vars) and \
                   render_template(cp_tpl, os.path.join(deploy_dir, "docker-compose.yaml"), t_vars):
                    log_to_file(f"    ✅ Manifests updated in: {deploy_dir}")
                    
                    if args.dry_run:
                        log_to_file(f"    ⏩ Dry-run: Build/Push lifecycle skipped.")
                    else:
                        # PROD MODE: Build and Push
                        if run_command(["docker", "build", "-t", image_name, "."], deploy_dir, LOG_FILE):
                            if run_command(["docker", "push", image_name], deploy_dir, LOG_FILE):
                                tasks[index]['status'] = 'done'
                                tasks[index]['current_update'] = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                                newly_updated_images.append({"name": image_name})
                                service_updated = True
                                any_global_update = True
                                new_push_count += 1
                                log_to_file(f"    ✅ Success: {image_name}")
                            else:
                                tasks[index]['status'] = 'failed'
                                log_to_file(f"    ❌ Push failed")
                        else:
                            tasks[index]['status'] = 'failed'
                            log_to_file(f"    ❌ Build failed")
                else:
                    log_to_file(f"    ❌ Manifest generation failed")
            else:
                log_to_file(f"  {progress} ⏩ Skipped (Already Done): {image_name}")

            service_tasks.append({"service": json_service_name, "my_image": image_name, "status": tasks[index].get('status'), "current_update": tasks[index].get('current_update')})

        # --- Post-Build Updates (Disabled in Dry-Run) ---
        if not args.dry_run:
            service_readme_path = os.path.join(service_dir, "README.md")
            if new_push_count > 0 or not os.path.exists(service_readme_path):
                s_history = get_existing_table_data(service_readme_path)
                s_content = generate_markdown_content(f"Service Summary: {json_service_name}", service_tasks, newly_updated_images, s_history, datetime.now().strftime("%Y-%m-%d %H:%M:%S"), 0)
                with open(service_readme_path, 'w', encoding='utf-8') as f:
                    f.write(s_content)
                log_to_file(f"  📝 Local README updated")

            if service_updated:
                with open(config_path, 'w') as f:
                    json.dump(tasks, f, indent=4)
        else:
            log_to_file(f"  ℹ️  Dry-run: images.json and README.md were NOT modified.")

        all_tasks_global.extend(service_tasks)
        service_summary_list.append({"dir": actual_dir_name, "name": json_service_name, "status": "✅ Done" if new_push_count > 0 else "⏩ No Change", "new_pushed": new_push_count})
        
    # --- Global Report (Disabled in Dry-Run) ---
    elapsed_time = int(time.time()) - start_sec
    if any_global_update and not args.dry_run:
        global_readme_path = os.path.join(BASEDIR, "README.md")
        global_history = get_existing_table_data(global_readme_path)
        global_content = generate_markdown_content("Global Deployment Summary", all_tasks_global, newly_updated_images, global_history, datetime.now().strftime("%Y-%m-%d %H:%M:%S"), elapsed_time, service_summary=service_summary_list, only_show_updates=True)
        with open(global_readme_path, 'w', encoding='utf-8') as f:
            f.write(global_content)

    log_to_file(f"--- Pipeline Finished ({elapsed_time}s) ---")

if __name__ == "__main__":
    main()
