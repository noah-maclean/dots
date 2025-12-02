#!/bin/bash

clear

# TODO: check if correct
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

# TODO: set shell to zsh
# TODO: fix $SHELL = /bin/zsh
if (! check_install "zsh") && ($SHELL != "/bin/zsh"); then
    figlet_or_echo "== SETUP ZSH =="
    chsh -s $(which zsh)
    source ~/.zshrc
    echo "Shell changed from bash to zsh"
else
    echo "zsh installation error."
fi

# TODO: install oh my zsh
figlet_or_echo "== OH MY ZSH =="
# if ask_yes_no "Install Oh My Zsh?"; then
#     sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    if ask_yes_no "Install Oh My Zsh?"; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi
else
    echo "Oh My Zsh is already installed."
fi

# TODO: setup ly and enable services
# TODO: network manager, bluetooth, ly


echo "Installation completed"
echo "Reboot to finalise setup"
