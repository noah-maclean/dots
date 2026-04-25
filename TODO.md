# TODOs for dots

## Chezmoi (MacOS)

- create templates for files to have linux/macos specific details
- create .chezmoiignore to ignore macos specific files on linux and vice versa
- https://recca0120.github.io/en/2026/04/13/chezmoi-dotfiles-management/
- https://github.com/timmyb824/dotfiles/blob/main/.chezmoiignore
- https://medium.com/@tiomothybryant3/how-chezmoi-transformed-my-dotfile-management-across-multiple-systems-0db4029b518e

## Neovim

- nvim-lint and conform for all file types
- remove nvim-lspconfig and mason-lspconfig and have an lsp directory with information from nvim-lspconfig repo and enable lsp manually (`vim.lsp.enable()`)
- create a new config with vim.pack when 0.12 is out
- switch from alpha to snacks dashboard

## Styling

- create colours.css file that can be used by all configs to make styling easier
    - waybar
    - swaync
    - swayosd
    - wofi
    - wlogout
    - waypaper
    - **use colours from tokyonight-night**
    - look at:
        - [meowrch waybar](https://github.com/meowrch/meowrch/blob/main/home/.config/waybar/style.css)
        - [catppuccin waybar](https://github.com/catppuccin/waybar)
        - [catpuccin swaync](https://github.com/catppuccin/swaync)
        - [tokyonight vscode](https://github.com/tokyo-night/tokyo-night-vscode-theme)
- create tokyonight-night and tokyonight-moon?

- replace gui applications in waybar with tuis OR guis with vim bindings
    - nmrs - nmtui (now that colours are fixed)
    - adw-bluetooth - bluetui
    - pavucontrol - pulsemixer

- [rename outputs (sinks)](https://github.com/Seyloria/sinkswitch?tab=readme-ov-file#abc-rename-outputs-sinks)
    
## Install Script

- finish install script (simple and interactive version)
    - simple: installs all packages without asking (hyprland setup)
    - interactive: installs packages as groups

## Waybar

- look into more groups in waybar
    - hardware group
    - power group to remove need for wlogout?
- re-add sinkswitch to waybar
    - get bluetooth devices working?
    
## zsh

- remove oh-my-zsh and just use .zshrc
    - add git keybindings from omz
    - install p10k, syntax highlighting, autosuggestions, etc. manually
    - look at common-aliases plugin in omz repo
- try oh my posh
