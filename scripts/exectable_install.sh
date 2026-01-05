#!/bin/bash

clear

check_install() {
    local package="$1"
    if command -v $package &> /dev/null; then
        return 1
    else
        return 0
    fi
}


ask_yes_no() {
    local prompt="$1"

    while true; do
        # $1 is the first argument passed to the function (the prompt text)
        # -p prints the text on same line as input 
        # -r prevents backslashes being escape characters
        # -n 1 only accepts 1 character
        read -r -p "$prompt [Y/n] " -n 1 input
        
        # Only print a newline if the user typed a character (y/n). 
        # If they hit Enter, the terminal already moved the cursor down.
        if [[ -n $input ]]; then
            echo ""
        fi

        case $input in
            # matches y, Y or enter
            [yY]|"")
            return 0  # success (true)
                ;;
            # matches n or N
            [nN])
                return 1  # failure (false)
                ;;
            # matches anything else
            *)
                echo "Invalid input. Please press y or n."
                ;;
        esac
    done
}


figlet_or_echo() {
    local message="$1"
    if command -v figlet &> /dev/null; then
    # if ! pacman -Qi figlet &> /dev/null; then
        figlet -t -f slant $message
        # figlet -t $message
    else
        echo $message
    fi
}


# login to sudo so that it doesn't need to be done when installing
# echo "Script requires sudo privilages to install packages"
# sudo -v

# update system first
echo "Updating system..."
sudo pacman -Syyu

# install figlet if not installed
# # alternative
# # if ! command -v figlet &> /dev/null; then
#     if ask_yes_no "Install figlet (ascii font renderer)"; then
#         sudo pacman -S figlet
#     else 
#         echo "Skipping figlet installation..."
#     fi
# fi

if check_install "figlet"; then
    if ask_yes_no "Install figlet (ascii font renderer)"; then
        sudo pacman -S figlet
    else 
        echo "Skipping figlet installation..."
    fi
fi


# if ! command -v git &> /dev/null; then
if check_install "git"; then
    figlet_or_echo "== GIT =="
    if ask_yes_no "Install git?"; then
        echo "Installing git..."
        sudo pacman -S git
    else
        echo "Cannot proceed without git"
        exit 0
    fi
fi



# if ! command -v yay &> /dev/null; then
if check_install "yay"; then
    figlet_or_echo "== YAY =="
    if ask_yes_no "Install yay (aur helper)?"; then
        echo "Installing yay..."
        # TODO: uncomment when done
        # sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && rm -rf yay
        echo "yay installed"
    else
        echo "Cannot install all packages without yay"
        exit 0
    fi
fi

figlet_or_echo "== INSTALLING PACKAGES =="

sleep 0.5

figlet_or_echo "== PACMAN =="
sudo pacman -S --needed $(< pacman.list)

figlet_or_echo "== AUR =="
yay -S --needed $(< aur.list)

figlet_or_echo "== ZSH =="

if (! check_install "zsh") ; then
    if [[ "$SHELL" != *"zsh"* ]]; then
        figlet_or_echo "== SETUP ZSH =="
        chsh -s $(which zsh)
        source ~/.zshrc
        echo "Shell changed from bash to zsh"
        echo "Changes will take effect after rebooting or logging out"
    else
        echo "zsh is already the current shell"
else
    echo "zsh installation error."
fi


figlet_or_echo "== OH MY ZSH =="

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    if ask_yes_no "Install Oh My Zsh?"; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi
else
    echo "Oh My Zsh is already installed."
fi

# TODO: setup ly and enable services
# TODO: network manager, bluetooth, ly

figlet_or_echo "== SETUP SYSTEM =="

figlet_or_echo "== NETWORK MANAGER =="

if ! command -v nmcli &> /dev/null; then
    if ask_yes_no "Install NetworkManager?"; then
        sudo pacman -S --needed --noconfirm networkmanager
    fi
fi

# Enable the service
if command -v nmcli &> /dev/null; then
    echo "Enabling NetworkManager..."
    sudo systemctl enable --now NetworkManager
else
    echo "NetworkManager not found. Internet might not work after reboot."
fi


figlet_or_echo "== BLUETOOTH =="

if ! command -v bluetoothctl &> /dev/null; then
    if ask_yes_no "Install Bluetooth support?"; then
        sudo pacman -S --needed --noconfirm bluez bluez-utils
    fi
fi

if command -v bluetoothctl &> /dev/null; then
    echo "Enabling Bluetooth..."
    sudo systemctl enable --now bluetooth
else
    echo "Bluetooth not installed."
fi


figlet_or_echo  "== AUDIO =="

if ask_yes_no "Install PipeWire Audio?"; then
    sudo pacman -S --needed --noconfirm pipewire pipewire-pulse wireplumber pipewire-alsa pipewire-jack
    systemctl --user --now enable pipewire pipewire-pulse wireplumber
    echo "Audio services enabled"
fi


figlet_or_echo "== LY =="

if ask_yes_no "Install and Enable Ly (display manager)?"; then
    
    # 1. Install ly
    if ! check_install "ly"; then
        echo "Installing ly..."
        sudo pacman -S --needed --noconfirm ly
    fi

    echo "Enabling ly..."
    sudo systemctl enable ly.service
    
    echo "Ly enabled. You will see it on next reboot."


figlet_or_echo "== MICROCODE =="

# Detect CPU vendor
cpu_vendor=$(grep -m1 'vendor_id' /proc/cpuinfo | awk '{print $3}')

if [[ "$cpu_vendor" == "GenuineIntel" ]]; then
    echo "Intel CPU detected."
    if ask_yes_no "Install Intel Microcode?"; then
        sudo pacman -S --needed --noconfirm intel-ucode
        echo "For GRUB, run: sudo grub-mkconfig -o /boot/grub/grub.cfg"
        echo "For Limine, add 'module_path: boot():/intel-ucode.img' before initramfs"
    fi
elif [[ "$cpu_vendor" == "AuthenticAMD" ]]; then
    echo "AMD CPU detected."
    if ask_yes_no "Install AMD Microcode?"; then
        sudo pacman -S --needed --noconfirm amd-ucode
        echo "For GRUB, run: sudo grub-mkconfig -o /boot/grub/grub.cfg"
        echo "For Limine, add 'module_path: boot():/amd-ucode.img' before initramfs"
    fi
fi


echo "Installation completed"
echo "Reboot to finalise setup"
