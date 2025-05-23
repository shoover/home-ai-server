#!/bin/bash

# Restarts containers with updated docker images. Targets all
# services by default, or only those specified as arguments.

docker compose up --detach --pull always --build "$@"
