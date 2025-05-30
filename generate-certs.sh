#!/bin/bash

# Generate SSL certificates for MinIO and pgAdmin

echo "Creating certificate directories..."
mkdir -p certs/pgadmin

echo "Generating MinIO SSL certificates..."
openssl req -x509 -newkey rsa:4096 -keyout certs/private.key -out certs/public.crt -days 365 -nodes -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost"

echo "Generating pgAdmin SSL certificates..."
openssl req -x509 -newkey rsa:4096 -keyout certs/pgadmin/server.key -out certs/pgadmin/server.cert -days 365 -nodes -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost"

echo "Setting proper permissions..."
chmod 644 certs/private.key certs/pgadmin/server.key
chmod 644 certs/public.crt certs/pgadmin/server.cert
chmod 755 certs/pgadmin

echo "SSL certificates generated successfully!"
echo "MinIO will be available at: https://localhost:9001"
echo "pgAdmin will be available at: https://localhost:8443"
echo "Note: You may need to accept the self-signed certificate warnings in your browser."
