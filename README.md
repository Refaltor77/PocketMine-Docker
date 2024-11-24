# Docker PocketMine Server

This project uses **Docker** to deploy a **PocketMine-MP** server (Minecraft Bedrock server) with a configured environment including **MariaDB** for persistent data management.

## Features
- Ready-to-use **PocketMine-MP** server.
- **MariaDB** database support for plugins or advanced management.
- Persistent data for worlds, players, and database.
- Easy setup and execution with Docker Compose.

---

## Prerequisites

Make sure your system has the following tools installed:
- [Docker](https://www.docker.com/) (version 20+ recommended).
- [Docker Compose](https://docs.docker.com/compose/) (version 2.5+ recommended).

---

## Installation

1. Clone this repository to your local machine:
````bash
git clone https://github.com/username/docker-pocketmine.git
cd docker-pocketmine 
````

2. Configure your local volumes (optional but recommended):
    - Worlds will be saved in ./data/worlds.
    - Player data will be stored in ./data/players.
    - MariaDB data will be stored in ./data/db.

3. Start the Docker services with the following command:
````bash
docker-compose up -d
````

---

## Server Configuration

### Access Configuration Files
- The PocketMine server files are located in the mounted ./data directory.
- You can modify the following files:
    - server.properties: Configure server settings (port, motd, etc.).
    - config.yml: General PocketMine configuration.

### Connect to the Minecraft Server
1. Open Minecraft Bedrock.
2. Add a new server with the following details:
    - **IP Address**: 127.0.0.1 (or your host machine’s IP address).
    - **Port**: 19132.

3. Join your server and have fun! 🎮

---

## MariaDB Usage

The **MariaDB** service is configured to work with PocketMine or your MySQL-compatible plugins.

### Default Database Details:
- **Host**: db
- **Port**: 3306
- **Username**: pocketmine
- **Password**: pocketmine_password
- **Database**: pocketmine_database

### Access the Database
You can use any MySQL client like [DBeaver](https://dbeaver.io/) or the command line to interact with the database:
mysql -h 127.0.0.1 -P 3306 -u pocketmine -p

---

## Directory Structure

Here is the directory structure for this project:

project/
├── docker-compose.yml    # Docker Compose file
├── data/
│   ├── worlds/           # Minecraft worlds (persistent)
│   ├── players/          # Player data
│   └── db/               # MariaDB data
└── server/
├── plugins/          # PocketMine plugins
├── start.sh          # Start script
├── PocketMine-MP.phar
└── config.yml        # General configuration