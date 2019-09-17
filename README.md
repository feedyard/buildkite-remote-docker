# feedyard/buildkite-remote-docker [![CircleCI](https://circleci.com/gh/feedyard/buildkite-remote-docker.svg?style=shield)](https://circleci.com/gh/feedyard/buildkite-remote-docker) [![Docker Repository on Quay](https://quay.io/repository/feedyard/buildkite-remote-docker/status "Docker Repository on Quay")](https://quay.io/repository/feedyard/buildkite-remote-docker) [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/feedyard/buildkite-remote-docker/master/LICENSE) [![Base Image](https://img.shields.io/badge/FROM-alpine-blue.svg)](https://alpinelinux.org)

Based on Alpine linux, a Docker image including the minimum required packages for use as a buildkite agent.

required        |
----------------|
bash            |
git             |
openssh         |
curl            |
tar             |
gzip            |
ca-certificates |
buildkite-agent |

Use as starting point for CircleCI executors that can support Alpine, adding necessary packages and frameworks to enable
specific pipelines.

See CHANGELOG for detailed list of installed packages/versions per versioned build
