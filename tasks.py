from invoke import task

@task
def stdagent(ctx):
    ctx.run('docker run -d -t --name buildkite-agent buildkite/agent:3 start --token $BUILDKITE_TOKEN')
