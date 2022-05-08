#!/usr/bin/bash

wrk_dir="$HOME/docker_volumes/filebrowser"
mkdir -p $wrk_dir
touch "$wrk_dir/filebrowser.db"
docker compose up -d
