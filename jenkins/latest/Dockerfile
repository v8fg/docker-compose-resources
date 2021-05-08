FROM jenkins/jenkins:latest

LABEL maintainer="278810732@qq.com" github="https://github.com/xwi88" group="https://github.com/v8fg"

ENV TZ=Asia/Shanghai

# if we want to install via apt
USER root

# ENV JENKINS_UC https://updates.jenkins-zh.cn
# ENV JENKINS_UC_DOWNLOAD https://mirrors.tuna.tsinghua.edu.cn/jenkins
# ENV JENKINS_OPTS="-Dhudson.model.UpdateCenter.updateCenterUrl=https://updates.jenkins-zh.cn/update-center.json"
# ENV JENKINS_OPTS="-Djenkins.install.runSetupWizard=false"

# COPY init.groovy /usr/share/jenkins/ref/init.groovy.d/init.groovy
# COPY hudson.model.UpdateCenter.xml /usr/share/jenkins/ref/hudson.model.UpdateCenter.xml
# COPY mirror-adapter.crt /usr/share/jenkins/ref/mirror-adapter.crt

COPY ./sources/sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y gcc build-essential libssl-dev make upx apt-utils
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN wget https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.14.4.linux-amd64.tar.gz
ENV GOPROXY=https://goproxy.cn,https://goproxy.io/,https://mirrors.aliyun.com/goproxy/,https://proxy.golang.org,direct
ENV GOROOT="/usr/local/go" PATH=$GOROOT/bin:$PATH

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

# USER jenkins 
# drop back to the regular jenkins user - good practice
