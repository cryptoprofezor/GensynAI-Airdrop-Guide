<div align="center">

# 🚀 Gensyn AI Airdrop Node Setup Guide (Mac/Linux/VPS)

</div>


# System Requirements 🖥️

. Minimum 16 GB RAM VPS or PC
. (Optional) NVIDIA GPU (3090/4090)
. Ubuntu 20.04 or 22.04

**⚠️ Warning: This node won’t run properly on low-spec devices. Use a VPS or high-performance machine to avoid crashes or lag**

# 🚀 Step-by-Step Setup
🔧 1. Update & Install Dependencies

```bash 
apt update && apt install -y sudo
```

```bash 
sudo apt update && sudo apt install -y python3 python3-venv python3-pip curl wget screen git lsof && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && sudo apt update && sudo apt install -y yarn
```

# 📥 2. Download Node Script

```bash
curl -sSL https://raw.githubusercontent.com/ABHIEBA/Gensyn/main/node.sh | bash
```

```bash 
cd $HOME && [ -d rl-swarm ] && rm -rf rl-swarm; git clone https://github.com/ABHIEBA/rl-swarm.git && cd rl-swarm
```

# 🎯 Step 4: Launch Dedicated Node Screen (Runs in Background)

```bash
screen -S gensyn
```

🔌 USE This To Detach from Screen 

 `Ctrl + A, then D`

# 🐍⚙️ Step 5: Create Python Virtual Environment & Run Node

```bash 
python3 -m venv .venv && . .venv/bin/activate && ./run_rl_swarm.sh
```

📊 Node Dashboard
Track your performance here 👉 https://dashboard.gensyn.ai

If U have any issue then open a issue on this repo or Dm me on TG~

Join:- https://t.me/MrCrypto_Tamilan

Thank U!

