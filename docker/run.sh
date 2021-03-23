#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
cd "${SCRIPT_DIR}" || exit

echo "On first run do:
terraform init
gcloud auth login
"

echo "On every other run, run terraform commands as usual"

if [ "$#" -eq 0 ]; then
  my_args=(  bash )
else
  my_args=( $@ )
fi

docker-compose run tf $*
