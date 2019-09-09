FROM alpine:3.10

LABEL maintainer=<nic.cheneweth@thoughtworks.com>

ENV BUILDKITE_AGENT_VERSION="3.13.2"

RUN apk add --no-cache \
        bash=5.0.0-r0 \
        git=2.22.0-r0 \
        openssh=8.0_p1-r0 \
        curl=7.65.1-r0 \
        tar=1.32-r0 \
        gzip=1.10-r0 \
        ca-certificates=20190108-r0

RUN curl -SLO https://github.com/buildkite/agent/releases/download/v${BUILDKITE_AGENT_VERSION}/buildkite-agent-linux-amd64-${BUILDKITE_AGENT_VERSION}.tar.gz && \
    tar xvzf buildkite-agent-linux-amd64-${BUILDKITE_AGENT_VERSION}.tar.gz && \
    mv ./buildkite-agent /usr/local/bin/buildkite-agent

RUN mkdir -p /buildkite/builds /buildkite/hooks /buildkite/plugins
COPY ./buildkite-agent.cfg /buildkite/buildkite-agent.cfg
# pending dynamic watch service
# COPY ssh-env-config.sh /usr/local/bin/ssh-env-config.sh
# RUN chmod +x /usr/local/bin/ssh-env-config.sh

ENV BUILDKITE_AGENT_CONFIG=/buildkite/buildkite-agent.cfg
VOLUME /buildkite
WORKDIR /buildkite
ENTRYPOINT ["buildkite-agent"]
CMD ["start"]
