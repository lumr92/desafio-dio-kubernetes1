#!/bin/bash

docker build -t lumr/desafio-dio-backend:1.0 backend/.
docker build -t lumr/desafio-dio-database:1.0 database/.

echo "Subindo imagens.."

docker push lumr/desafio-dio-backend:1.0
docker push lumr/desafio-dio-database:1.0

echo "Criando serviços..."

kubectl apply -f ./services.yml

echo "Criando os deploys.."

kubectl apply -f ./deployment.yml