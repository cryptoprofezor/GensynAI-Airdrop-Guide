<div align="center">

# 🚀 Gensyn AI Airdrop Node Setup Guide By MCT

</div>


## 🖥️ System Requirements

- Minimum 16 GB RAM VPS or PC
- (Optional) NVIDIA GPU (3090/4090)
- Ubuntu 20.04 or 22.04

**⚠️ Warning: This node won’t run properly on low-spec devices. Use a VPS or high-performance machine to avoid crashes or lag**

# 🚀 Step-by-Step Guide
🔧 1. Update & Install Dependencies

```bash 
apt update && apt install -y sudo
```

```bash 
sudo apt update && sudo apt install -y python3 python3-venv python3-pip curl wget screen git lsof && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && sudo apt update && sudo apt install -y yarn
```

# 📥 2. Download Node Script

```bash
curl -sSL https://raw.githubusercontent.com/Cryptoprofezor/Gensyn-Installer/main/node.sh | bash
```

```bash 
cd $HOME && rm -rf GensynAI-Airdrop-Guide && git clone https://github.com/cryptoprofezor/GensynAI-Airdrop-Guide.git && cd GensynAI-Airdrop-Guide && chmod +x gensyn.sh && ./gensyn.sh
```

# 🎯 Step 4: Launch Dedicated Node Screen (Runs in Background)

```bash
screen -S gensyn
```

🔌 USE This To Detach from Screen 

 `Ctrl + A, then D`

# 🐍⚙️ Step 5: Create Python Virtual Environment & Run Node

```bash 
cd ~
chmod +x gensyn-testnet/gensyn.sh
./gensyn-testnet/gensyn.sh
```



## ⚠️ **Troubleshooting Errors**

🛠️ If You See This Error API Key is to be Activated Then Use This 3 Commands

```bash 
sudo npm install --unsafe-perm -g ngrok
```
```bash
ngrok authtoken
```
```bash
ngrok http 3000
```

`Ctrl + c` Then Retry With The Start Command Now it will work 

Make Sure to Save Your ORG_ID Node Name, Peer ID Etc

## 🔒 VPS USERS Export Your Swarm.Pem File

VPS Users Must Export Your `Swarm.pem` File From Your VPS Server to Your Local PC Use The Command Below And Extract

```bash
scp root@YourIP:/root/rl-swarm/swarm.pem .
```

📊 Node Dashboard
Track your performance here 👉 https://dashboard.gensyn.ai

If U have any issue then open a issue on this repo or Dm me on TG~

Join:- https://t.me/MrCrypto_Tamilan

Thank U!

