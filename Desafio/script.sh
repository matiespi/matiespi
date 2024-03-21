#!/bin/bash

#Se reciben variables y se guardan para usarse
nom_ape=$1
departamento=$2
temporalPassword=$3

#Convierte texto a minuscula
var_minus="${nom_ape,,}"
#Se separa palabra con _
var_guion="${var_minus// /_}"

sudo groupadd ${departamento}

sudo useradd -m -c "${nom_ape}, ${departamento}" "${var_guion}"

echo "${var_guion}:${temporalPassword}" | sudo chpasswd

#Se estable vencimiento de clave temporal para en 30 dias
sudo chage -d 30 $1

sudo usermod -aG ${departamento} ${var_guion} 

echo "${var_guion}"

