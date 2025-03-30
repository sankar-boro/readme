#!/bin/bash

# sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
# wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

sudo systemctl stop postgresql
sudo apt-get --purge remove postgresql\*
sudo rm -rf /var/lib/postgresql/
sudo rm -rf /etc/postgresql/
sudo rm -rf /etc/postgresql-common/
sudo deluser postgres
sudo delgroup postgres
sudo rm -rf /var/log/postgresql/
sudo rm /usr/bin/psql
sudo apt-get autoremove
sudo apt-get autoclean

sleep 3
echo "Uninstall completed"
echo "Installing postgres"

sudo apt-get update
sudo apt-get -y install postgresql-17
