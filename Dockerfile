FROM ubuntu:18.04

# Prepare apt for bazel
RUN apt update && \
    apt install -y curl gnupg && \
    curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > /etc/apt/trusted.gpg.d/bazel.gpg && \
    echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" > etc/apt/sources.list.d/bazel.list

# Install build dependencies
RUN apt install -y git python openjdk-11-jdk zip

ADD entrypoint.sh /

ENTRYPOINT /entrypoint.sh
