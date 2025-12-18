# =================================================================
# PHASE 1: Base Environment Initialization
# Description: Dynamically defines the upstream base image using 
#              the 'v_base_image' variable provided by the build 
#              pipeline configuration.
# =================================================================
FROM kubesphere/etcd:3.6.4-0

# =================================================================
# PHASE 2: Image Metadata & Ownership
# Description: Establishes organizational labels for traceability.
#              Includes maintainer contact, source repository links,
#              and organizational group attribution.
# =================================================================
LABEL maintainer="278810732@qq.com" \
      github="https://github.com/xwi88" \
      group="https://github.com/v8fg" \
      service_identity="kubesphere-etcd-3.6.4-0"

# =================================================================
# PHASE 3: Runtime Environment Configuration
# Description: Configures the container's system-wide timezone.
#              The 'TZ' environment variable ensures time-sensitive 
#              logs and operations align with regional requirements.
# =================================================================
ENV TZ=Asia/Shanghai

# =================================================================
# PHASE 4: Dependency Provisioning (Optional)
# Description: Placeholder for system-level package installation 
#              (e.g., apk add or apt-get install) and binary copying.
# =================================================================
# RUN apk add --no-cache tzdata
