# Install script for the argus configuration for the Stratosphere Project
# https://stratosphereips.org

# If there is a previous argus conf, backup it
if [ -f /etc/argus.conf ]; then
    mv /etc/argus.conf /etc/argus.$RANDOM.conf.bak
    cp ./argus-to-sda.conf /etc/argus.conf
fi

#argus-to-sda.conf
#argus-to-sda.sh
#install.sh
#run
