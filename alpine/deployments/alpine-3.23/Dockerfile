# =================================================================
# PHASE 1: Base Environment Initialization
# Description: Dynamically defines the base image using the 
#              'v_base_image' variable from images.json.
# =================================================================
FROM alpine:3.23

# =================================================================
# PHASE 2: Metadata & Ownership
# Description: Defines organizational metadata, maintainer details, 
#              and source control links for image traceability.
# =================================================================
LABEL maintainer="278810732@qq.com" \
      github="https://github.com/xwi88" \
      group="https://github.com/v8fg" \
      service_identity="alpine-3.23"

# =================================================================
# PHASE 3: System Dependencies
# Description: Installs essential runtime tools:
#              - tzdata: Required for system clock synchronization.
#              - bash: Essential for complex script execution.
# =================================================================
RUN apk add --no-cache tzdata bash

# =================================================================
# PHASE 4: Application Context (Optional)
# Description: Placeholder for injecting application source code 
#              from the local deployments context.
# =================================================================
# COPY . /app/

# =================================================================
# PHASE 5: Runtime Configuration
# Description: Sets the container's operational timezone.
#              Defaults to Asia/Shanghai provided by the pipeline.
# =================================================================
ENV TZ=Asia/Shanghai
