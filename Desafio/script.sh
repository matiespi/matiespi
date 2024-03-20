#!/bin/bash

nom_ape=$1
departamento=$2

var_minus="${nom_ape,,}"
var_guion="${var_minus// /_}"

sudo groupadd ${departamento}

temporalPassword=$(openssl rand -base64 12 | tr -d '\n')

echo "${temporalPassword}"

sudo useradd -m -c "${nom_ape}, ${departamento}" "${var_guion}"

sudo echo "${var_guion}:${temporalPassword}" | sudo chpasswd

sudo usermod -aG ${departamento} ${var_guion} 