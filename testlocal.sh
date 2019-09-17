#!/usr/bin/env bash
set -euo pipefail

CID="$(docker run -it -d --entrypoint ash local/buildkite-remote-docker:latest)"
inspec exec --no-distinct-exit profiles/cis-docker
inspec exec profiles/buildkite-remote-docker/ -t docker://$CID
docker rm -f $CID
