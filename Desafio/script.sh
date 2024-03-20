#!/bin/bash

nom_ape=$1
departamento=$2

var_minus="${nom_ape,,}"
var_guion="${var_minus// /_}"

sudo groupadd ${departamento}

temporalPassword="1234"

echo "${temporalPassword}"

sudo useradd -m -c "${nom_ape}, ${departamento}" -p $(openssl passwd -1 "$temporalPassword") -e $(date -d "+1 day" +"%Y-%m-%d") "${var_guion}"

sudo echo "${var_guion}:${temporalPassword}" | sudo chpasswd

sudo usermod -aG ${departamento} ${var_guion} 