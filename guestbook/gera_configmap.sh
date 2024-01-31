#!/bin/bash

# Abre o arquivo
arquivo=$1

# Lê as linhas do arquivo
while read -r linha; do

  # Adiciona o "--from-literal=" antes da linha
  nova_linha="--from-literal=${linha}"

  # Adiciona a linha ao comando
  comando+=" ${nova_linha}"
done < "${arquivo}"

# Executa o comando
kubectl create configmap my-configmap ${comando} --dry-run=client -o yaml > ConfigMap.yaml
