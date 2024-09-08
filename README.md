# kernel-removal
A bash script to list all installed kernels on Ubuntu systems, and remove selected kernels to free up space

## How the Script Works:

Kernel Listing: The script lists all installed kernels except the currently active one, which is protected from accidental removal. The list is sorted in reverse version order, so the most recent kernels appear at the top. Each kernel is assigned a number for easy selection.

Interactive Menu: The user is prompted to enter the number corresponding to the kernel they wish to remove. If no input is given (i.e., the user presses Enter), the script will exit.

Kernel Removal: The script checks whether the selected kernel exists, and if valid, uses apt-get purge to remove the selected kernel and all its associated files. This method ensures that no residual files are left behind.

GRUB Update: After a kernel is removed, the script automatically updates the GRUB configuration to reflect the changes. This ensures that removed kernels are no longer displayed in the GRUB boot menu during system startup.

Exit Mechanism: The script continues to loop, displaying the remaining kernels until the user presses Enter without selecting a kernel.

## Learn More at: https://www.coderancher.us/2024/09/11/managing-old-kernels-on-ubuntu-a-custom-kernel-removal-script/
