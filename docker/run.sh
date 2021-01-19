#!/usr/bin/env bash

echo "On first run do:
terraform init
"

echo "On every other run, run terraform commands as usual"

docker-compose run tf bash
