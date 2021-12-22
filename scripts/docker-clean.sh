#!/usr/bin/env bash

fore=$1

if [[ "${force}" -eq "force" ]]; then
    docker images | grep none | awk '{print $3}' | xargs -n 1 docker rmi -f
else
    docker images | grep none | awk '{print $3}' | xargs -n 1 docker rmi
fi
