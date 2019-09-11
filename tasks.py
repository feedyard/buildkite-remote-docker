from invoke import task

@task
def buildlocal(ctx):
    ctx.run('docker build -t local/buildkite-remote-docker:latest .')

# export BUILDKITE_AGENT_TOKEN= value from Buildkite
@task
def runlocalagent(ctx):
    LAUNCH = "docker run -v \"/var/run/docker.sock:/var/run/docker.sock\" " \
             "-e NITE " \
             "-e NITETIME " \
             "-d -t local/buildkite-infra:latest start " \
             "--token $BUILDKITE_AGENT_TOKEN " \
             "--tags \"queue=bootstrap\" "

    ctx.run('source local.env')
    ctx.run(LAUNCH)
