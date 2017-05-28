# Install script for the argus configuration for the Stratosphere Project
# https://stratosphereips.org
# Author: Sebastian Garcia. sebastian.garcia@agents.fel.cvut.cz

# If there is a previous argus conf, backup it
if [ -f /etc/argus.conf ]; then
    echo 'Backing up old argus configuration'
    sudo mv /etc/argus.conf /etc/argus.$RANDOM.conf.bak
fi
echo 'Copying new argus configuration file to /etc'
sudo cp ./argus-to-sda.conf /etc/argus.conf

# Create the argus folder for starting it automatically
echo 'Creating the /etc/argus folder'
ARGUSF=/etc/argus
sudo mkdir $ARGUSF
sudo cp ./run $ARGUSF
echo 'Type the id of your argus sensor. Only 4 chars:'
read ID
sudo sed -i "s/Test/$ID/" $ARGUSF/run

# Copy the start script to /etc/init.d
echo 'Installing the start script in /etc/init.d'
sudo cp ./argus-to-sda.sh /etc/init.d/
sudo chmod 755 /etc/init.d/argus-to-sda.sh
echo 'Making argus start when the rpi starts'
sudo ln -s /etc/init.d/argus-to-sda.sh /etc/rc2.d/S08argus-to-sda.sh

# Start the service
echo 'Starting Argus now'
sudo /etc/init.d/argus-to-sda.sh

echo
echo "Argus is monitored by supervised and it will respown if killed."
echo "To stop argus type 'sudo killall -9 supervise; sudo killall -9 argus'"
echo "To start it again type '/etc/init.d/arugs-to-sda.sh'"
echo "To change the Argus ID, change it in the file /etc/argus/run, or run install.sh again."
