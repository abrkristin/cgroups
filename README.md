# Configure CPU Quota for a User

This script dynamically configures a CPU quota for a specific user on a Linux system. It creates a systemd slice configuration file and sets the CPU usage limit for the user.

## Features

- Automatically retrieves the user's UID.
- Creates the required systemd directory and configuration file.
- Sets a CPU quota of 90%.
- Reloads systemd to apply changes.

## Prerequisites

- **Linux system** with systemd.
- User account exists on the system.
- Sudo privileges to execute the script.

## Usage

1. Clone or download the script to your local machine.
2. Modify the `test-user` in the script to the target user.
3. Make the script executable (chmod +x configure_cpu_quota.sh).
4. Run the script (./configure_cpu_quota.sh)
5. The script will:

- Create the required directory: /etc/systemd/system/user-<UID>.slice.d/
- Write the configuration file: /etc/systemd/system/user-<UID>.slice.d/90-cpu.conf
- Reload systemd to apply changes (changes will be applied immediately).
