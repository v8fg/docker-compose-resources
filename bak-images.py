#!/usr/bin/env python3
import os
import sys
import json
import subprocess
import time
import argparse
from datetime import datetime

# --- Global Configurations ---
# BASEDIR: The absolute path where this script is located
BASEDIR = os.path.abspath(os.path.dirname(__file__))
TODAY = datetime.now().strftime('%Y-%m-%d')
# LOG_FILE: Central log file for all pipeline operations
LOG_FILE = os.path.join(BASEDIR, f"images-log-{TODAY}.log")

def log_to_file(*args):
    """
    Logs messages with timestamps to both the standard output (console) 
    and the central log file.
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
    Parses the current README.md file to extract historical push data.
    This ensures that images not updated in the current run still appear 
    with their 'Last Push' date in the generated reports.
    """
    history = {}
    if not os.path.exists(readme_path):
        return history
    try:
        with open(readme_path, 'r', encoding='utf-8') as f:
            for line in f:
                # Target lines starting with '|' that are not headers or separators
                if line.startswith('|') and 'Service' not in line and '---' not in line:
                    parts = [p.strip() for p in line.split('|')]
                    if len(parts) >= 5:
                        img_key = parts[2].replace('`', '')
                        history[img_key] = {"status": parts[3], "last_push": parts[4]}
    except Exception as e:
        log_to_file(f"Error parsing README at {readme_path}: {e}")
    return history

def generate_markdown_content(title, tasks, newly_updated_images, existing_history, finish_time, elapsed_time, service_summary=None, only_show_updates=False):
    """
    Constructs the Markdown string for documentation.
    Includes execution metrics, service overview, and detailed image status.
    """
    total = len(tasks)
    pushed_list = [t for t in tasks if t['my_image'] in [img['name'] for img in newly_updated_images]]
    pushed_count = len(pushed_list)
    skipped = total - pushed_count

    content = f"# {title}\n\n"
    content += "### 📊 Execution Metrics\n"
    content += f"- **📅 Sync Time:** {finish_time}\n"
    # Only show duration if it's the global summary (elapsed_time > 0)
    if elapsed_time > 0:
        content += f"- **⏱️ Total Duration:** {elapsed_time}s\n"
    content += f"- **📦 Total Images Scanned:** {total}\n"
    content += f"- **✅ Newly Pushed:** {pushed_count}\n"
    content += f"- **⏩ Skipped:** {skipped}\n\n"

    # Directory/Service Overview Table
    if service_summary:
        content += "### 📂 Service Status Overview\n"
        content += "| Directory | Service Name | Status | New Pushes |\n"
        content += "| :--- | :--- | :---: | :---: |\n"
        for s in service_summary:
            content += f"| {s['dir']} | {s['name']} | {s['status']} | {s['new_pushed']} |\n"
        content += "\n"

    # Image Details Table
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
    Reads a template file, replaces placeholders like ${v_var}, 
    and writes the result to a target file.
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
    Executes shell commands (Docker build/push) and captures output in the log file.
    """
    try:
        with open(log_file, 'a') as lf:
            subprocess.run(command, check=True, stdout=lf, stderr=lf, text=True, cwd=cwd)
        return True
    except subprocess.CalledProcessError:
        return False

def find_image_configs(root_dir, target_services=None):
    """
    Locates images.json in service directories. 
    Supports specific service filtering via command line arguments.
    """
    configs = []
    if target_services:
        for service in target_services:
            json_path = os.path.join(root_dir, service, "images.json")
            if os.path.isfile(json_path):
                configs.append(json_path)
            else:
                log_to_file(f"⚠️  Warning: Service folder or images.json missing for: '{service}'")
    else:
        # Scan all subdirectories if no specific services are provided
        for entry in os.scandir(root_dir):
            if entry.is_dir() and not entry.name.startswith('.'):
                json_path = os.path.join(entry.path, "images.json")
                if os.path.isfile(json_path):
                    configs.append(json_path)
    return configs

def main():
    parser = argparse.ArgumentParser(description="Docker Build Pipeline with Deduplication")
    parser.add_argument('services', nargs='*', help='Service directories to scan')
    # New argument to support only updating deployment files without building
    parser.add_argument('--dry-run', '-d', action='store_true', help='Update deployment files but do not build/push images')
    args = parser.parse_args()

    start_sec = int(time.time())
    newly_updated_images = []
    all_tasks_global = [] 
    service_summary_list = []
    any_global_update = False
    
    # Locate configuration files
    config_files = find_image_configs(BASEDIR, args.services if args.services else None)
    
    if not config_files:
        log_to_file("Fatal Error: No valid service configurations found.")
        return

    # Pipeline Start Header
    log_to_file(f"--- Pipeline Start: Detected {len(config_files)} services ---")
    if args.dry_run:
        log_to_file("⚠️ DRY-RUN MODE: Deployment files will be updated, but Docker build/push will be skipped.")
    
    service_names = [os.path.basename(os.path.dirname(p)) for p in config_files]
    log_to_file(f"📦 Services to process: {', '.join(service_names)}")

    for config_path in config_files:
        service_dir = os.path.dirname(config_path)
        actual_dir_name = os.path.basename(service_dir)
        service_tasks = []
        service_updated = False
        new_push_count = 0
        
        with open(config_path, 'r') as f:
            raw_tasks = json.load(f)
        if not raw_tasks: continue

        # --- Deduplication Logic ---
        # Checks for duplicate 'my_image' tags and keeps only the first entry.
        # This prevents redundant builds and keeps the config file clean.
        seen_images = set()
        unique_tasks = []
        duplicates_removed = []
        for t in raw_tasks:
            img = t.get('my_image')
            if img not in seen_images:
                seen_images.add(img)
                unique_tasks.append(t)
            else:
                duplicates_removed.append(img)
        
        # If duplicates were found, log them and flag the JSON for rewrite
        if duplicates_removed:
            log_to_file(f"  ⚠️  Cleaning duplicates in {actual_dir_name}: Removed {len(duplicates_removed)} entries ({', '.join(duplicates_removed)})")
            service_updated = True 
        
        tasks = unique_tasks
        json_service_name = tasks[0].get('service', 'N/A')
        
        # Safety check: Ensure the folder name matches the 'service' field in JSON
        if json_service_name != actual_dir_name:
            log_to_file(f"⚠️  Mismatch: Dir '{actual_dir_name}' != Service '{json_service_name}'. Skipping.")
            service_summary_list.append({"dir": actual_dir_name, "name": json_service_name, "status": "❌ Mismatch", "new_pushed": 0})
            continue

        log_to_file(f"📂 Processing: [{json_service_name}]")

        for index, item in enumerate(tasks):
            image_name = item.get('my_image', 'N/A')
            container_name = item.get('container', json_service_name)
            progress = f"({index+1}/{len(tasks)})"
            
            # Process image if status is not 'done'
            if str(item.get('status', '')).strip().lower() != "done":
                log_to_file(f"  {progress} Target Image: {image_name}")
                deploy_dir = os.path.join(service_dir, "deployments", container_name)
                os.makedirs(deploy_dir, exist_ok=True)
                
                t_vars = {"v_base_image": item.get('base_image'), "v_tz": item.get('tz', 'Asia/Shanghai'),
                          "v_container": container_name, "v_my_image": image_name}
                
                # --- Template Path Lookup Rules ---
                # 1. Try Dockerfile Template
                spec_df = item.get('dockerfile_tpl')
                df_default = "Dockerfile.template"
                if spec_df:
                    df_path = os.path.join(service_dir, spec_df)
                    if os.path.exists(df_path):
                        log_to_file(f"    - Dockerfile Template: Using '{spec_df}'")
                        df_tpl = df_path
                    else:
                        log_to_file(f"    - Dockerfile Template: ⚠️ '{spec_df}' NOT FOUND. Fallback to '{df_default}'")
                        df_tpl = os.path.join(service_dir, df_default)
                else:
                    log_to_file(f"    - Dockerfile Template: Using default '{df_default}'")
                    df_tpl = os.path.join(service_dir, df_default)

                # 2. Try Compose Template
                spec_cp = item.get('compose_tpl')
                cp_default = "docker-compose.template"
                if spec_cp:
                    cp_path = os.path.join(service_dir, spec_cp)
                    if os.path.exists(cp_path):
                        log_to_file(f"    - Compose Template   : Using '{spec_cp}'")
                        cp_tpl = cp_path
                    else:
                        log_to_file(f"    - Compose Template   : ⚠️ '{spec_cp}' NOT FOUND. Fallback to '{cp_default}'")
                        cp_tpl = os.path.join(service_dir, cp_default)
                else:
                    log_to_file(f"    - Compose Template   : Using default '{cp_default}'")
                    cp_tpl = os.path.join(service_dir, cp_default)

                # Template Rendering 
                df_ok = render_template(df_tpl, os.path.join(deploy_dir, "Dockerfile"), t_vars)
                cp_ok = render_template(cp_tpl, os.path.join(deploy_dir, "docker-compose.yaml"), t_vars)

                if df_ok and cp_ok:
                    log_to_file(f"    ✅ Deployment files updated in: {deploy_dir}")
                    
                    # If dry-run, skip Docker build and push
                    if args.dry_run:
                        log_to_file(f"    ⏩ Dry-run: Skipping build/push for {image_name}")
                    else:
                        # Build/Push Command execution
                        if run_command(["docker", "build", "-t", image_name, "."], deploy_dir, LOG_FILE):
                            if run_command(["docker", "push", image_name], deploy_dir, LOG_FILE):
                                tasks[index]['status'] = 'done'
                                tasks[index]['current_update'] = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                                newly_updated_images.append({"name": image_name})
                                service_updated = True
                                any_global_update = True
                                new_push_count += 1
                                log_to_file(f"  {progress} ✅ Success: {image_name}")
                            else:
                                log_to_file(f"  {progress} ❌ Error: Push failed")
                        else:
                            log_to_file(f"  {progress} ❌ Error: Build failed")
                else:
                    missing = []
                    if not os.path.exists(df_tpl): missing.append(f"Dockerfile: {df_tpl}")
                    if not os.path.exists(cp_tpl): missing.append(f"Compose: {cp_tpl}")
                    log_to_file(f"  {progress} ❌ Error: Missing templates ({' | '.join(missing)})")
            else:
                # If image is already marked as 'done' in JSON, skip it
                log_to_file(f"  {progress} ⏩ Skipped: {image_name}")

            service_tasks.append({"service": json_service_name, "my_image": image_name, "status": tasks[index].get('status'), "current_update": tasks[index].get('current_update')})

        # --- Local Service README Update ---
        # Logic: Update if new images were pushed OR if the file does not exist.
        service_readme_path = os.path.join(service_dir, "README.md")
        if new_push_count > 0 or not os.path.exists(service_readme_path):
            s_history = get_existing_table_data(service_readme_path)
            s_content = generate_markdown_content(f"Service Summary: {json_service_name}", service_tasks, newly_updated_images, s_history, datetime.now().strftime("%Y-%m-%d %H:%M:%S"), 0)
            with open(service_readme_path, 'w', encoding='utf-8') as f:
                f.write(s_content)
            log_to_file(f"  📝 Local README updated/created for {json_service_name}")

        # Track results for the final summary
        all_tasks_global.extend(service_tasks)
        service_summary_list.append({"dir": actual_dir_name, "name": json_service_name, "status": "✅ Updated" if new_push_count > 0 else "⏩ No Change", "new_pushed": new_push_count})
        
        # Save cleaned or updated tasks back to the images.json file
        if service_updated:
            with open(config_path, 'w') as f:
                json.dump(tasks, f, indent=4)

    # --- Execution Summary with Alignment ---
    elapsed_time = int(time.time()) - start_sec
    log_to_file("--- Execution Summary ---")
    log_to_file(f"Total Time: {elapsed_time}s")
    log_to_file(f"Images Updated: {len(newly_updated_images)}")
    
    if service_summary_list:
        # Dynamic alignment based on the longest service name
        max_name_len = max(len(s['name']) for s in service_summary_list)
        for s in service_summary_list:
            log_to_file(f"- Service: {s['name']:{max_name_len}} | Status: {s['status']} | Pushed: {s['new_pushed']}")
    
    # Update global README.md documentation if any changes occurred
    if any_global_update:
        global_readme_path = os.path.join(BASEDIR, "README.md")
        global_history = get_existing_table_data(global_readme_path)
        global_content = generate_markdown_content("Global Deployment Summary", all_tasks_global, newly_updated_images, global_history, datetime.now().strftime("%Y-%m-%d %H:%M:%S"), elapsed_time, service_summary=service_summary_list, only_show_updates=True)
        with open(global_readme_path, 'w', encoding='utf-8') as f:
            f.write(global_content)

    log_to_file(f"--- Pipeline Finished ({elapsed_time}s) ---")

if __name__ == "__main__":
    main()
