#!/bin/bash

cod=$1
nom_ape=$2
departamento=$3

sudo groupadd departamento

temporalPassword=$(openssl rand -base64 12 | tr -d '\n')

echo '$temporalPassword'

sudo useradd -m -c "$nom_ape, $departamento" $cod

sudo echo "$cod:$temporalPassword" | sudo chpasswd

sudo usermod -aG $departamento $cod 