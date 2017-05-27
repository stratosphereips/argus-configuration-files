# Install script for the argus configuration for the Stratosphere Project
# https://stratosphereips.org

# If there is a previous argus conf, backup it
if [ -f /etc/argus.conf ]; then
    echo 'Backing up old argus configuration'
    mv /etc/argus.conf /etc/argus.$RANDOM.conf.bak
fi
echo 'Copying new argus configuration file to /etc'
cp ./argus-to-sda.conf /etc/argus.conf

#argus-to-sda.conf
#argus-to-sda.sh
#install.sh
#run

1. Create a folder in your computer for argus. For example /opt/argus-to-sda/
2. Copy the file 'argus-to-sda.conf' to /etc as root.
3. Copy the file 'argus-to-sda.sh' to /etc/init.d/
4. Copy the file 'run' to the project folder, for example /opt/argus-to-sda/
5. Make the init script executable if it is not. 
    chmod 777 /etc/init.d/argus-to-sda.sh
6. Make a link to start argus when the computer reboots
    ln -s /etc/init.d/argus-to-sda.sh /etc/rc2.d/S08argus-to-sda.sh
7. If necesarry, change the id of your organization in the /opt/argus-to-sda/run file. The id should be provided by SDA. Change the parameter -e to '"newid"'.
8. Start the service
    /etc/init.d/arugs-to-sda.sh

