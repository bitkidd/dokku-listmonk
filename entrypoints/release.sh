#! /bin/bash
sh -c ./listmonk --install --idempotent --yes --config '' && ./listmonk --upgrade --yes --config ''
