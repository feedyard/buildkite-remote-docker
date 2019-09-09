from invoke import task

@task
def localbuild(ctx):
    ctx.run('docker build -t local/buildkite-remote-docker:latest .')
    #ctx.run('docker run -d -t --name buildkite-agent buildkite/agent:3 start --token $BUILDKITE_TOKEN')
