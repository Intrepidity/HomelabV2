#!/usr/bin/env bash
set -euo pipefail

docker network create traefik
docker network create media