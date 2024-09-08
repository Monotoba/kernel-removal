#!/bin/bash
#====================================
# Remove the kernel selected from the 
# menu listing.
# Press Enter/Return to exit
#====================================

# Function to list installed kernels sorted by version in reverse order
list_kernels() {
    echo "Installed kernels (sorted by version, latest first):"
    dpkg -l | grep 'linux-image-[0-9]' | grep -v $(uname -r) | awk '{print $2}' | sort -Vr | nl
}

# Main loop
while true; do
    list_kernels

    # Ask the user for input
    echo ""
    echo "Enter the number of the kernel you wish to remove (or press Enter to exit):"
    read -p "Selection: " selection

    # If the input is empty, break the loop
    if [ -z "$selection" ]; then
        echo "Exiting..."
        break
    fi

    # Get the selected kernel package name
    kernel_package=$(dpkg -l | grep 'linux-image-[0-9]' | grep -v $(uname -r) | awk '{print $2}' | sort -Vr | sed -n "${selection}p")

    # If the selection is valid, proceed with removal
    if [ ! -z "$kernel_package" ]; then
        echo "Removing $kernel_package..."
        sudo apt-get purge -y $kernel_package
    else
        echo "Invalid selection. Please try again."
    fi

    echo ""
done

echo ""
echo "Updating Grub..."
sudo update-grub
echo ""
echo "Done"
