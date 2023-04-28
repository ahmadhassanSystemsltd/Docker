#!/bin/bash
sudo mkdir -p /registry && cd "$_"
sudo mkdir certs && cd "$_"
yum -y update
openssl genrsa -out ca.key 2048
openssl req -new -x509 -days 365 -key ca.key -subj "/C=lh/ST=pb/L=as/O=sys/CN=dockerregistry.com" -out ca.crt
openssl req -newkey rsa:2048 -nodes -keyout server.key -subj "/C=lh/ST=pb/L=as/O=sys/CN=*.dockerregistry.com" -out server.csr
openssl x509 -req -extfile <(printf "subjectAltName=DNS:dockerregistry.com,DNS:dockerregistry.com") -days 365 -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt

