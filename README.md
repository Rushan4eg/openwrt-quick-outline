# outline-install-wrt
OpenWRT /bin/sh script to install Outline (Shadowsocks) with [xjasonlyu/tun2socks](https://github.com/xjasonlyu/tun2socks)

## How to use:

First, get the script and make it executable:

    cd /tmp
    wget https://raw.githubusercontent.com/Rushan4eg/openwrt-quick-outline/main/install_outline.sh -O install_outline.sh
    chmod +x install_outline.sh

**Then run the script:**
You'll need at least **9 MiB of free space** on /

    ./install_outline.sh

You'll be asked for:

 - Outline (Shadowsocks) config in "ss://base64coded@HOST:PORT" format
 - Buffer size. Default 4mb. For devices with low ram less 64mb, recommended to choose less.
 - If you want to use Outline (shadowsocks) as your default gateway (y/n)

**If you don't have enough free space** on / , you can install executable to RAM (You'll need **up to** **40 MiB** of RAM):

    cd /tmp
    wget https://raw.githubusercontent.com/1andrevich/outline-install-wrt/main/install_outline_ram.sh -O install_outline_ram.sh
    chmod +x install_outline_ram.sh
    ./install_outline_ram.sh


If you have problems with raw.githubusercontent.com access, try mirror of this project **(https://sourceforge.net/projects/outline-install-wrt/)**
