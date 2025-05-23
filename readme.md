# Postgres FTP Service

This project sets up a PostgreSQL database and an FTP server using Docker Compose.

## Prerequisites

- Docker
- Docker Compose

## Setup

1.  **Clone the repository (if you haven't already):**
    ```bash
    git clone https://github.com/adilonam/postgres-ftp.git
    cd postgres-ftp
    ```

2.  **Create and customize your environment file:**
    Copy the example environment file to a new `.env` file:
    ```bash
    cp .env.example .env
    ```
    Open `.env` in a text editor and customize the following variables:
    ```env
    POSTGRES_USER=your_postgres_user
    POSTGRES_PASSWORD=your_postgres_password
    POSTGRES_DB=your_postgres_database_name
    PUBLICHOST=your_public_host_or_ip # e.g., localhost or your server's IP
    FTP_USER_NAME=your_ftp_username
    FTP_USER_PASS=your_ftp_password
    FTP_USER_HOME=/home/ftpusers/your_ftp_username # Ensure this matches FTP_USER_NAME
    ```

3.  **Start the services:**
    Run the following command to build and start the containers in detached mode:
    ```bash
    docker-compose up -d
    ```

## Services

-   **PostgreSQL:**
    -   Host: `localhost` (or your Docker host IP)
    -   Port: `5432`
    -   Credentials: As defined in your `.env` file.
-   **FTP Server:**
    -   Host: `localhost` (or your Docker host IP, or `PUBLICHOST` value from `.env`)
    -   Port: `21`
    -   Passive Ports: `30000-30009`
    -   Credentials: As defined in your `.env` file.

## Volumes

-   `pgdata`: Persists PostgreSQL data.
-   `ftpdata`: Persists FTP user data.

## Stopping the services

To stop the running containers:
```bash
docker-compose down
```

## Cleaning up

To stop the containers and remove the volumes (this will delete your data):
```bash
docker-compose down -v
```
