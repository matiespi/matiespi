#!/bin/bash

nom_ape=$1
departamento=$2
temporalPassword=$3

var_minus="${nom_ape,,}"
var_guion="${var_minus// /_}"

sudo groupadd ${departamento}

sudo useradd -m -c "${nom_ape}, ${departamento}" "${var_guion}"

echo "${var_guion}:${temporalPassword}" | sudo chpasswd

sudo usermod -aG ${departamento} ${var_guion} 

echo "${var_guion}"

