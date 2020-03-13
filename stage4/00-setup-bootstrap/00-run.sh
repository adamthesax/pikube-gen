

install -m 644 files/pikube-bootstrap.service "${ROOTFS_DIR}/etc/systemd/system/pikube-bootstrap.service"

mkdir -p "${ROOTFS_DIR}/opt/pikube"
install -m 744 files/bootstrap.sh "${ROOTFS_DIR}/opt/pikube/bootstrap.sh"

on_chroot << EOF
systemctl enable pikube-bootstrap
EOF