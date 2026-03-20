# Dokku-Listmonk

Install [Listmonk][] on [Dokku][].

[Listmonk]: https://listmonk.app
[Dokku]: https://dokku.com

## Setup

### Server Setup

```bash
# Set these:
dokku apps:create "$APP_NAME"
dokku domains:set "$APP_NAME" "$DOMAIN"

# Postgres
dokku postgres:create "$APP_NAME"-db
dokku postgres:link "$APP_NAME"-db "$APP_NAME" --no-restart

# Config: review these
dokku config:set --no-restart "$APP_NAME" \
    LISTMONK_app__address="https://listmonk.example.com" \
    LISTMONK_db__host="db" \
    LISTMONK_db__port="5432" \
    LISTMONK_db__user="postgres" \
    LISTMONK_db__password="some_password" \
    LISTMONK_db__database="postgres" \ 
    LISTMONK_db__ssl_mode="disable"
```

Then push your app (see [below](#app-setup)). Once it's deployed, set the HTTPS config up:

```bash
dokku proxy:ports-clear $APP_NAME
dokku proxy:ports-add $APP_NAME http:80:3000
dokku letsencrypt:enable $APP_NAME
dokku letsencrypt:cron-job --add $APP_NAME
```

## Upgrade

Upgrade the version in the `Dockerfile` and push to your remote.
