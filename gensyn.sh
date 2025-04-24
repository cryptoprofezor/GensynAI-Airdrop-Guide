#!/bin/bash

BOLD="\e[1m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
NC="\e[0m"

SWARM_DIR="$HOME/rl-swarm"
TEMP_DATA_PATH="$SWARM_DIR/modal-login/temp-data"
HOME_DIR="$HOME"

cd $HOME

if [ -f "$SWARM_DIR/swarm.pem" ]; then
    echo -e "${BOLD}${YELLOW}You already have an existing ${GREEN}swarm.pem${YELLOW} file.${NC}\n"
    echo -e "${BOLD}${YELLOW}Do you want to:${NC}"
    echo -e "${BOLD}1) Use the existing swarm.pem (safe update)${NC}"
    echo -e "${BOLD}${RED}2) Delete existing rl-swarm and start fresh${NC}"

    while true; do
        read -p $'\e[1mEnter your choice (1 or 2): \e[0m' choice
        if [ "$choice" == "1" ]; then
            echo -e "\n${BOLD}${YELLOW}[✓] Using existing swarm.pem...${NC}"

            echo -e "${BOLD}${YELLOW}[✓] Backing up important files...${NC}"
            mkdir -p "$HOME/gensyn-backup"
            cp "$SWARM_DIR/swarm.pem" "$HOME/gensyn-backup/"
            cp "$TEMP_DATA_PATH/userData.json" "$HOME/gensyn-backup/" 2>/dev/null
            cp "$TEMP_DATA_PATH/userApiKey.json" "$HOME/gensyn-backup/" 2>/dev/null

            echo -e "${BOLD}${YELLOW}[✓] Pulling latest updates from repo...${NC}"
            cd "$SWARM_DIR"
            git pull origin main > /dev/null 2>&1

            break
        elif [ "$choice" == "2" ]; then
            echo -e "${BOLD}${YELLOW}[✓] Deleting rl-swarm and starting fresh...${NC}"
            rm -rf "$SWARM_DIR"
            cd $HOME && git clone https://github.com/zunxbt/rl-swarm.git > /dev/null 2>&1
            break
        else
            echo -e "\n${BOLD}${RED}[✗] Invalid choice. Please enter 1 or 2.${NC}"
        fi
    done
else
    echo -e "${BOLD}${YELLOW}[✓] No existing swarm.pem found. Cloning repository...${NC}"
    cd $HOME && [ -d rl-swarm ] && rm -rf rl-swarm; git clone https://github.com/zunxbt/rl-swarm.git > /dev/null 2>&1
fi

cd rl-swarm || { echo -e "${BOLD}${RED}[✗] Failed to enter rl-swarm directory. Exiting.${NC}"; exit 1; }

if [ -n "$VIRTUAL_ENV" ]; then
    echo -e "${BOLD}${YELLOW}[✓] Deactivating existing virtual environment...${NC}"
    deactivate
fi

echo -e "${BOLD}${YELLOW}[✓] Setting up Python virtual environment...${NC}"
python3 -m venv .venv
. .venv/bin/activate

echo -e "${BOLD}${YELLOW}[✓] Installing dependencies...${NC}"
pip install -r requirements.txt

echo -e "${BOLD}${GREEN}🚀 Ready! Open your browser and activate the API using localhost:3000${NC}"
echo -e "${BOLD}${YELLOW}Once API is activated, the node will start.${NC}"

read -p $'\e[1mPress ENTER after activating the API from localhost:3000...\e[0m'

echo -e "${BOLD}${YELLOW}[✓] Running Gensyn node trainer...${NC}"
python3 trainer/gensyn/testnet_grpo_trainer.py
