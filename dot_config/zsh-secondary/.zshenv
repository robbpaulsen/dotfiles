# Profile file like .profile
# ------------------------------------------------------------------------------
# Path - The higher it is, the more priority it has
# ------------------------------------------------------------------------------

path=(
  "XDG_DESKTOP_DIR="$HOME/Desktop"
  "XDG_DOWNLOAD_DIR="$HOME/Downloads"
  "XDG_TEMPLATES_DIR="$HOME/Templates"
  "XDG_PUBLICSHARE_DIR="$HOME/Public"
  "XDG_DOCUMENTS_DIR="$HOME/Documents"
  "XDG_MUSIC_DIR="$HOME/Music"
  "XDG_PICTURES_DIR="$HOME/Pictures"
  "XDG_VIDEOS_DIR="$HOME/Videos"
  "XDG_CACHE_HOME=$HOME/.cache"
  "$HOME/.local/bin"
  "TERM=xterm-256color"
  "SHELL=/usr/bin/zsh"
  "EDITOR=nvim"
  "VISUAL=nvim"
  "BROWSER=firefox"
  "COLORTERM=truecolor"
  "GH_EDITOR=nvim"
  "GIT_EDITOR=nvim"
  "GH_BROWSER=firefox"
  "GITHUB_USERNAME=robbpaulsen"
  "MDCAT_PAGER=bat"
  "KITTY_OS=linux"
  'RANGER_DEVICONS_SEPARATOR=" "'
  "LS_COLORS=$(vivid generate -m 24-bit rose-pine-moon)"
  "CARGO_HOME=$HOME/.cargo"
  "CARGO_DEFAULT_BIN=${HOME}/.cargo/bin"
  "BIN_DIR="${BIN_DIR:-"$CARGO_DEFAULT_BIN"}"
  "RUSTFLAGS="-C target-feature=-crt-static"
  "GOROOT=/home/heimdal/.go"
  "GOPATH=/home/heimdal/go"
  "PATH=$PATH:$GOROOT/bin:$GOPATH/bin"
  "GO111MODULE=on"
  "PATH=$PATH:/usr/lib/jvm/java-17-openjdk-17.0.9.0.9-3.fc39.x86_64"
  "JAVA_HOME=$HOME/Downloads/android-studio/jbr/bin"
  "GEM_HOME=$HOME/.gem"
  "PIPX_HOME_DIR=$HOME/.local/pipx/venvs"
  "PIPX_BIN_DIR=$HOME/.local/pipx/bin"
  "KITTY_CONFIG_DIRECTORY=$HOME/.config/kitty"
  "KITTY_CACHE_DIRECTORY=$HOME/.cache/kitty"
  "ZELLIJ_CONFIG_DIR=$HOME/.config/zellij"
  "ZELLIJ_CONFIG_FILE=$HOME/.config/zellij/config.kdl"
  "GIT_CONFIG_GLOBAL=$HOME/.config/git/.gitconfig"
  "LIBVIRT_DEFAULT_URI=qemu:///system"
  "PATH=$PATH:/var/lib/flatpak/exports/share"
  "PATH=$PATH:/home/heimdal/.local/share/flatpak/exports/share"
  "PATH=$PATH:/home/heimdal/Downloads/git-repos/hashcat-utils/src"
  "PATH=$PATH:$HOME/Downloads/git-repos/hash-cracker/scripts/extensions/hashcat-utils-linux/bin"
  "PATH=$PATH:$HOME/Playgrounds/object-orientedp/flutter/bin"
  "PATH=$PATH:$HOME/Downloads/android-studio/bin"
  "PATH=$PATH:$HOME/Downloads/cmdline-tools/bin"
  "$path"
)
export path


# pipx
eval "$(register-python-argcomplete pipx)"

# zoxide
eval "$(zoxide init zsh)"

# navi widget
eval "$(navi widget zsh)"

# set PATH so it includes user"s private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
export PATH

if [ -f "$HOME/.aliases.zsh" ] ; then
  . "$HOME/.aliases.zsh"
fi

if [ -f "$HOME/.functions.zsh" ] ; then
  . "$HOME/.functions.zsh"
fi

if [ -f "$HOME/.key-bindings.zsh" ] ; then
  . "$HOME/.key-bindings.zsh"
fi

if [ -f "$HOME/.cargo/env" ] ; then
    . "$HOME/.cargo/env"
fi

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
