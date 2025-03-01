# Ref: https://www.digitalocean.com/community/tutorials/how-to-enable-remote-desktop-protocol-using-xrdp-on-ubuntu-22-04
# How To Enable Remote Desktop Protocol Using xrdp on Ubuntu 
sudo apt update

#You will be prompted to choose a display manager, which is a program that manages graphical login mechanisms and user sessions. You can select any option from the list of available display managers, but this tutorial will use gdm3.
sudo apt install xfce4 xfce4-goodies -y

sudo apt install xrdp -y
sudo systemctl status xrdp

# xrdp.ini is the default configuration file to set up RDP connections to the xrdp server. The configuration file can be modified and customized to meet the RDP connection requirements.
# In the configuration file, navigate to the Session types section. You will find multiple supported session types and their parameters listed:
sudo nano /etc/xrdp/xrdp.ini

# Now move to your user’s home directory if you are not there already:
cd ~

#create a .xsession file under home folder and add the xfce4-session as the session manager to use upon login:
echo "xfce4-session" | tee .xsession

sudo systemctl restart xrdp

# allow access to the RDP port 3389 on your remote server,
sudo ufw allow from your_local_ip/32 to any port 3389
sudo ufw status
