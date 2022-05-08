#!/usr/bin/bash

wrk_dir="$HOME/docker_volumes/wireboundhole/"
mkdir -p "$wrk_dir/etc-dnsmasq.d/"
mkdir -p "$wrk_dir/etc-pihole/"
mkdir -p "$wrk_dir/wireguard_config/"
mkdir -p "$wrk_dir/unbound/"
cp ./unbound/unbound.conf $wrk_dir/unbound/unbound.conf
docker compose up