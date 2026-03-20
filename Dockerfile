FROM listmonk/listmonk:v6.0.0

# Install Bash for the entrypoints (apk is "apt" for Alpine)
RUN apk add --no-cache bash

# copy our own entrypoints because Dokku doesn't support '&&' in the Procfile
COPY entrypoints/* entrypoints/

# Default web command for Dokku/docker-local when Procfile is not detected.
CMD ["./entrypoints/web.sh"]
