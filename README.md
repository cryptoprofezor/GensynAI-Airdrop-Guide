<div align="center">

# 🚀 Gensyn AI Airdrop Node Setup Guide (Mac/Linux/VPS)

</div>


# System Requirements 🖥️

![image](https://github.com/user-attachments/assets/594d0847-362b-4ea6-9e61-8590105421c8)

**⚠️ Warning: This node won’t run properly on low-spec devices. Use a VPS or high-performance machine to avoid crashes or lag**

# Pre-Requirements 🛠

# 1️⃣ Install Dependencies
🔧 Python & Essential Tools

* For **Linux/Wsl**

```
sudo apt update && sudo apt install -y python3 python3-venv python3-pip curl wget screen git lsof

```

* **For Mac**

```
brew install python
```

Check Version

```
python3 --version
```


# ⚙️ Install Node.js, npm, and Yarn

* For **Linux/Wsl**

```
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - && sudo apt update && sudo apt install -y nodejs
```

* Install Yarn (linux)

```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
```

```
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list > /dev/null
```

```
sudo apt update && sudo apt install -y yarn
```


* For **Mac**

```
brew install node && corepack enable && npm install -g yarn
```

* Check version **(Linux/Mac)**

```
node -v
```
```
npm -v
```

```
yarn -v
```


<div align="center">

# 👨🏻‍💻 Launch Gensyn Node (Linux/Mac) 

</div>


* 🧬 Clone RL-Swarm

```
git clone https://github.com/gensyn-ai/rl-swarm.git
```

* 🧩 Navigate to rl-swarm

```
cd rl-swarm
```

* 🔐 Setup Virtual Environment

```
python3 -m venv .venv
source .venv/bin/activate
```

* 📦 Install Frontend Dependencies

```
cd modal-login
```

```
yarn install
```

```
yarn upgrade &&  yarn add next@latest &&  yarn add viem@latest
```

* 🚀 Start the Node

```
cd ..
```

```
./run_rl_swarm.sh
```

- When prompted `connect to the Testnet? [Y/n]` Enter `Y`

- Open browser `http://localhost:3000/` 

- Login using your email, verify OTP 


![image](https://github.com/user-attachments/assets/1fed4b08-4ec4-44de-868c-b2d314cd2a02)


- Save your `ORG_ID` shown in terminal

* When asked about HuggingFace push `Would you like to push models? [y/N]` Type `N`

![image](https://github.com/user-attachments/assets/b63da75d-389a-4ded-9c4e-cd23804d94ef)



![image](https://github.com/user-attachments/assets/35321942-1aa3-47f1-92a3-dae9881b64cd)

Here we go🚀

Its Done ✅

It will Generate Logs Soon 🙌


<div align="center">

#  🛠️ Troubleshooting

</div>


# ⚠️ How to get the Node Name?

* Check the image below to get your Node id!

![image](https://github.com/user-attachments/assets/728c6401-75c8-43b4-973c-e9d515c4b453)


# 🔁 Restarting Your Node (Next Day)

*
 ```
  cd rl-swarm
 ```

*
 ```
  python3 -m venv .venv
```

*
```
source .venv/bin/activate
```

*
```
./run_rl_swarm.sh
```


# ⚠️ Node Stuck & getting errors like this? lets solve it! 

![image](https://github.com/user-attachments/assets/956c0691-b2da-40f1-825e-cd634c147d49)

* This error is coming for who's running on personal Device.

* Cause of error is old GPU or Low ram!

1) Stop your node with ctrl+c

2) Run `cd`

3) Open and Add this line at the end of the file (use up-down keys to move)

```
nano ~/.bashrc
```

```
export PYTORCH_MPS_HIGH_WATERMARK_RATIO=0.0
```

4) Reload with-

```
source ~/.bashrc
```

5) Open The Config file

For wsl/linux

```
nano ~/rl-swarm/hivemind_exp/configs/gpu/grpo-qwen-2.5-0.5b-deepseek-r1.yaml
```

For Mac

```
nano ~/rl-swarm/hivemind_exp/configs/mac/grpo-qwen-2.5-0.5b-deepseek-r1.yaml
```

🔺 Now Change- `vllm_gpu_memory_utilization: 0.2` to `0.4`  (check ss)

![image](https://github.com/user-attachments/assets/2d40c0dc-0438-4d80-85e4-c9fcfbbc58fc)


save with `cltr+x` , `Y` + `Enter`

6) Cut the Wsl or terminal and restart it!

7) Now start the node ( Check FAQ 5)

* It can be solve your issue, i think not for low GPU users!

📚 For additional errors or in-depth debugging, visit the 

https://github.com/gensyn-ai/rl-swarm/tree/brian-address-cpu-only-crashes?tab=readme-ov-file#troubleshooting

📢 Join TG for more Updates: https://telegram.me/Mrcrypto_Tamilan

If U have any issue then open a issue on this repo or Dm me on TG~

Thank U!

