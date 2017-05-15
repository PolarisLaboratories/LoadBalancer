#!/bin/bash

openssl genrsa -out ca.key 4096
openssl req -new -x509 -days 365 -key ca.key -subj "/C=US/ST=TX/O=Polaris Laboratories/CN=localhost" -out ca.crt -sha256

openssl req -newkey rsa:4096 -nodes -keyout server.key -subj "/C=US/ST=TX/O=Polaris Laboratories/CN=localhost" -out server.csr -sha256
openssl x509 -req -extfile <(printf "subjectAltName=IP:127.0.0.1,DNS:localhost") -days 365 -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -sha256
