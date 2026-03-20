FROM listmonk/listmonk:v6.0.0

# Install Bash for the entrypoints (apk is "apt" for Alpine)
RUN apk add --no-cache bash

# copy our own entrypoints because Dokku doesn't support '&&' in the Procfile
COPY entrypoints/* entrypoints/
COPY Procfile .

# Override the upstream entrypoint so Dokku can execute Procfile commands
# as shell scripts for release/web processes.
ENTRYPOINT ["/bin/sh"]
