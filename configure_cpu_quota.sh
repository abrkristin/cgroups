# Get user UID for 'test_user' and store it as a variable
USER_UID=$(id -u test-user)
  
# Create directory for systemd slice
sudo mkdir -p /etc/systemd/system/user-${USER_UID}.slice.d
sudo chmod 755 /etc/systemd/system/user-${USER_UID}.slice.d

# Create CPU quota configuration file
sudo tee /etc/systemd/system/user-${USER_UID}.slice.d/90-cpu.conf > /dev/null <<EOF
[Slice]
CPUQuota=90%
EOF
  
# Reload systemd daemon
sudo systemctl daemon-reload

# Restart test-user slice
sudo systemctl restart user-${USER_UID}.slice
