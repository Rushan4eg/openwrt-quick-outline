# OpenWRT Quick Outline Installer

OpenWRT /bin/sh script to quickly install Outline (Shadowsocks) with [xjasonlyu/tun2socks](https://github.com/xjasonlyu/tun2socks)

## 🚀 Quick Installation (Recommended)

**Ultra-simple one-liner** - downloads and runs automatically:
```bash
sh -c "$(wget -qO- https://raw.githubusercontent.com/Rushan4eg/openwrt-quick-outline/main/install_outline.sh)"
```

**Or download first, then run:**
```bash
wget -q https://raw.githubusercontent.com/Rushan4eg/openwrt-quick-outline/main/install_outline.sh -O ./install_outline.sh && chmod +x ./install_outline.sh && echo "Ready! Run with: ./install_outline.sh"
./install_outline.sh
```

## 📋 Requirements

- Any OpenWRT version (tested on 19.07, 21.02, 22.03, 23.05+)
- At least **9 MiB** of free space on `/` (for permanent installation)
- Router with minimum **128 MB RAM** recommended
- Required packages (script will check for these):
  ```bash
  opkg update
  opkg install kmod-tun ip-full
  ```

## ⚙️ Configuration Options

### Automated Mode (No User Input)
Edit the script and set your Outline config at the top:
```bash
PRESET_OUTLINE_CONFIG="ss://your_base64_config@your.server.com:8080/?outline=1"
```
When set, the script runs completely unattended.

### Interactive Mode  
Leave `PRESET_OUTLINE_CONFIG` empty and the script will prompt for:
- **Outline (Shadowsocks) config** in `ss://base64coded@HOST:PORT/?outline=1` format
- **Default gateway choice** - whether to route all traffic through Outline (y/n)

*Note: Server IP is automatically extracted from the ss:// config - no need to enter it separately!*

## 🔧 What the Script Does

1. **Checks dependencies** (kmod-tun, ip-full)
2. **Downloads tun2socks binary** for your router architecture
3. **Configures network interface** (`tun1` with IP 172.16.10.1/30)
4. **Sets up firewall rules** (creates 'proxy' zone and forwarding)
5. **Creates system service** (`/etc/init.d/tun2socks`) with auto-start
6. **Intelligently restarts network** only when needed (fixes SSH disconnection issues)
7. **Starts Outline service** and optionally sets as default gateway

## 🛠️ Advanced Options

### RAM Installation (Low Storage Devices)
For devices with less than 9 MB free space but 40+ MB RAM:
```bash
wget https://raw.githubusercontent.com/1andrevich/outline-install-wrt/main/install_outline_ram.sh -O install_outline_ram.sh
chmod +x install_outline_ram.sh
./install_outline_ram.sh
```

### Manual Service Control
```bash
# Start/stop service
/etc/init.d/tun2socks start
/etc/init.d/tun2socks stop

# Enable/disable auto-start
/etc/init.d/tun2socks enable
/etc/init.d/tun2socks disable

# Check status
/etc/init.d/tun2socks status
```

## 🐛 Troubleshooting

### SSH Connection Drops During Installation
This version **fixes the SSH disconnection issue** that occurred on subsequent script runs. The script now:
- Only restarts network when actual changes are made
- Adds stabilization delays
- Prevents unnecessary configuration reloads

### Running in Screen/Tmux (Extra Safety)
For maximum reliability during network changes:
```bash
opkg install screen
screen -S outline
# Run installer here
# Press Ctrl+A, then D to detach if needed
# Reconnect with: screen -r outline
```

### Mirror Access
If you have problems accessing raw.githubusercontent.com, try the mirror:
[SourceForge Project](https://sourceforge.net/projects/outline-install-wrt/)

## 📝 Configuration Format

Get your Outline config from the Outline client:
- **Format:** `ss://base64coded@HOST:PORT/?outline=1`
- **Example:** `ss://Y2hhY2hhMjAtaWV0Zi1wb2x5MTMwsadfasdfsafdSDNWYW9AMTkyLjI0MS4xNTQuMTc6ODA4Mw/?outline=1`

The script automatically extracts the server IP from this config, so you only need to provide the ss:// URL.

## 📄 License
