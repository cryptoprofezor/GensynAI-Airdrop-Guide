#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
BOLD='\033[1m'
NC='\033[0m'

print_message()   { echo -e "${BLUE}[INFO]${NC} $1"; }
print_success()   { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
print_warning()   { echo -e "${YELLOW}[WARNING]${NC} $1"; }
print_error()     { echo -e "${RED}[ERROR]${NC} $1"; }

# Check location
if [[ $(basename "$PWD") == "rl-swarm" ]]; then
    RL_SWARM_DIR="$PWD"
elif [[ -d "$HOME/rl-swarm" ]]; then
    RL_SWARM_DIR="$HOME/rl-swarm"
else
    print_error "❌ rl-swarm not found. Run this script from or after creating rl-swarm."
    exit 1
fi

cd "$RL_SWARM_DIR" || exit 1

# Check and install dependencies
print_message "Installing dependencies: nc, lsof, cloudflared..."
sudo apt-get update > /dev/null
sudo apt-get install -y netcat lsof > /dev/null

if ! command -v cloudflared &> /dev/null; then
    print_message "Installing cloudflared..."
    ARCH=$(uname -m)
    CLOUDFLARED_ARCH="amd64"
    [[ "$ARCH" == "aarch64" || "$ARCH" == "arm64" ]] && CLOUDFLARED_ARCH="arm64"
    curl -L "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-${CLOUDFLARED_ARCH}" -o cloudflared
    chmod +x cloudflared && sudo mv cloudflared /usr/local/bin/
fi

# Start server
PORT=8000
while lsof -i:$PORT &> /dev/null; do PORT=$((PORT+1)); done
python3 -m http.server $PORT > /dev/null 2>&1 &
HTTP_PID=$!
sleep 2

# Start tunnel
cloudflared tunnel --url http://localhost:$PORT > /tmp/cloud.log 2>&1 &
sleep 10
TUNNEL_URL=$(grep -o 'https://[^ ]*\.trycloudflare\.com' /tmp/cloud.log | head -n1)

if [[ -z "$TUNNEL_URL" ]]; then
    print_error "❌ Failed to establish cloudflared tunnel."
    kill $HTTP_PID 2>/dev/null
    exit 1
fi

# Show backup links
echo
echo -e "${GREEN}${BOLD}📦 Backup Links (TEMPORARY, DO NOT SHARE):${NC}"
echo
echo -e "${BOLD}1. swarm.pem${NC}\n   ${BLUE}${TUNNEL_URL}/swarm.pem${NC}"
echo -e "${BOLD}2. userData.json${NC}\n   ${BLUE}${TUNNEL_URL}/modal-login/temp-data/userData.json${NC}"
echo -e "${BOLD}3. userApiKey.json${NC}\n   ${BLUE}${TUNNEL_URL}/modal-login/temp-data/userApiKey.json${NC}"
echo
echo -e "${YELLOW}${BOLD}⚠️  DO NOT share this public URL with anyone. Anyone can steal your node identity if they access it!${NC}"
echo
echo -e "${GREEN}${BOLD}⬇️ To download from another server (use these wget commands):${NC}"
echo -e "${YELLOW}wget -O swarm.pem ${TUNNEL_URL}/swarm.pem"
echo -e "wget -O userData.json ${TUNNEL_URL}/modal-login/temp-data/userData.json"
echo -e "wget -O userApiKey.json ${TUNNEL_URL}/modal-login/temp-data/userApiKey.json${NC}"
echo
echo -e "${BLUE}${BOLD}Press Ctrl+C when done to stop the server.${NC}"

trap 'kill $HTTP_PID; pkill -f "cloudflared tunnel"; echo -e "${GREEN}Backup server closed.${NC}"' INT
wait
