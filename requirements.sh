# update package sources and install deps
sudo apt-get update
sudo apt-get install -y autoconf automake avahi-daemon build-essential git libasound2-dev libavahi-client-dev libconfig-dev libdaemon-dev libpopt-dev libssl-dev libtool xmltoman

# install shairport-sync:
git clone https://github.com/mikebrady/shairport-sync.git
cd shairport-sync
autoreconf -i -f
./configure --with-alsa --with-avahi --with-ssl=openssl --with-systemd --with-metadata

# build and install!
make
sudo make install

# start every boot
sudo systemctl enable shairport-sync

# prevent wifi dropouts
sudo echo "# Disable wifi power management (power control/sleeping of wifi)
wireless-power off" >> /etc/network/interfaces

# let the firewall handle this (mark 1 firewall)
sudo ufw allow from 192.168.1.1/31 to any port 3689 proto tcp
sudo ufw allow from 192.168.1.1/31 to any port 5353
sudo ufw allow from 192.168.1.1/31 to any port 5000:5005 proto tcp
sudo ufw allow from 192.168.1.1/31 to any port 6000:6005 proto udp
sudo ufw allow from 192.168.1.1/31 to any port 35000:65535 proto udp

#All done: after telling the user, we need to reboot!