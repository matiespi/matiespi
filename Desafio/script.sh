#!/bin/bash

cod=$1
nom_ape=$2
departamento=$3

groupadd departamento

temporalPassword=$(openssl rand -base64 12 | tr -d '\n')

useradd -m -c "$nom_ape, $departamento" $cod

echo "$cod:$temporalPassword" | sudo chpasswd

usermod -aG $departamento $cod 