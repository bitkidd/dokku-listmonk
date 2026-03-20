#!/bin/sh
set -e

./listmonk --install --idempotent --yes --config ''
./listmonk --upgrade --yes --config ''
./listmonk --config ''
