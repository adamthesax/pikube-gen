#!/usr/bin/bash -e

echo "Begining pikube bootstrapping"

if [ ! -f "/boot/pikube.tar.gz" ];then
    echo "Error: unable to find /boot/pikube.tar.gz" | tee /var/pikube.status
    exit 1
fi

BOOTSTRAP_DIR=/opt/pikube/bootstrap

mkdir -p $BOOTSTRAP_DIR
tar -xzf /boot/pikube.tar.gz -C $BOOTSTRAP_DIR
/opt/pikube/bootstrap/./run.sh

systemctl disable pikube-bootstrap
sleep 120
reboot