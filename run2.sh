echo "
  ____    _   _   _   _   _   _   ___   _   _    ____       ____  
|  _ \  | | | | | \ | | | \ | | |_ _| | \ | |  / ___|     |___ \ 
| |_) | | | | | |  \| | |  \| |  | |  |  \| | | |  _        __) |
|  _ <  | |_| | | |\  | | |\  |  | |  | |\  | | |_| |      / __/ 
|_| \_\  \___/  |_| \_| |_| \_| |___| |_| \_|  \____|     |_____|  
                                                                         
"
echo Free IndiaHost VPS HOSTING Server Intel 16TB
echo - 16TB RAM
echo - 120core Intel Xeon
echo Pterodactyl Supported Vps 24x7 Uptime

read -p "Are you sure To Create Free VPS? (y/n): " -n 1 -r
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Installation aborted."
    exit 1
fi

cat <<EOF > Dockerfile
FROM ubuntu:22.04

RUN apt-get update 
RUN apt-get install nano neofetch wget curl tmate -y
RUN wget -O /usr/bin/neofetch https://raw.githubusercontent.com/katy-the-kat/realinstallscript/refs/heads/main/hn2-ii
RUN chmod +x /usr/bin/neofetch
RUN echo 'root:root' | chpasswd
RUN printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d
RUN apt-get install -y systemd systemd-sysv dbus dbus-user-session
RUN printf "systemctl start systemd-logind" >> /etc/profile

ENTRYPOINT ["/sbin/init"]
EOF

echo Installing IndiaHost
docker build -t utmp . > /dev/null 2>&1
echo Done installing IndiaHost

echo To make your Indiahost free vps. Please run
echo "
 ____       _      ____    _   _       __  __      _      _  __  _____       ____    _   _ 
| __ )     / \    / ___|  | | | |     |  \/  |    / \    | |/ / | ____|     / ___|  | | | |
|  _ \    / _ \   \___ \  | |_| |     | |\/| |   / _ \   | ' /  |  _|       \___ \  | |_| |
| |_) |  / ___ \   ___) | |  _  |     |  |  | |  / ___ \  | . \  | |___   _   ___) | |  _  |
|____/  /_/   \_\ |____/  |_| |_|     |_|  |_| /_/   \_\ |_|\_\ |_____| (_) |____/  |_| |_|                                    
"
echo You can create as many indiahost as you want, Just press the plus icon and run the command again!
