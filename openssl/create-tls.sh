#!/bin/bash

# 秘密鍵を作成
openssl genrsa -out out/wildcard.my-cluster.com.key 2048

# CSR を作成
openssl req -new -key out/wildcard.my-cluster.com.key -out out/wildcard.my-cluster.com.csr -config openssl-san.cnf

# 自己署名証明書を作成
openssl x509 -req -days 365 -in out/wildcard.my-cluster.com.csr -signkey out/wildcard.my-cluster.com.key -out out/wildcard.my-cluster.com.crt 

kubectl create secret tls wildcard-cert -n traefik \
  --cert=out/wildcard.my-cluster.com.crt \
  --key=out/wildcard.my-cluster.com.key

# sudo cp out/wildcard.my-cluster.com.crt /usr/local/share/ca-certificates/wildcard.my-cluster.com.crt
# sudo update-ca-certificates
