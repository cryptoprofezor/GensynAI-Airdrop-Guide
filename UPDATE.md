# 📢 Gensyn Node Updated – April 24 2025

This is the **official updated setup guide** for the Gensyn testnet node by [@cryptoprofezor](https://github.com/cryptoprofezor).

## ⚠️ What's New?

- Updated with latest Gensyn node logic (April 2025)
- Uses pure **localhost:3000** for API activation
- No cloudflare / ngrok needed
- Full auto-setup using `gensyn.sh`

---

## 🧽 Step 1: Clean Old Setup

If you used the **old repo** (`GensynAI-Airdrop-Guide`), run this:

```bash
cd ~
rm -rf GensynAI-Airdrop-Guide rl-swarm
```

## 📥 Step 2: Install New Setup (ONE-TIME ONLY)

```bash
git clone https://github.com/cryptoprofezor/GensynAI-Airdrop-Guide.git
cd GensynAI-Airdrop-Guide
chmod +x gensyn.sh
./gensyn.sh
```

## 🚀 Step 3: Run Node Next Day

```bash
cd GensynAI-Airdrop-Guide
chmod +x gensyn.sh
./gensyn.sh
```

## 🔄 Backup Your Node

```bash
chmod +x backup.sh
./backup.sh
```

This gives you a public download link for:

- swarm.pem

- userData.json

- userApiKey.json

⚠️⚠️ Use carefully! Do NOT share the link with anyone


