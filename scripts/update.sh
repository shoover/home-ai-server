#!/bin/bash

# Restarts containers with updated docker images.

docker compose up --detach --pull always --build
