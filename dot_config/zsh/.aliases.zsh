# Enable aliases to be sudo’ed
alias sudo='sudo '
alias ~="cd ~"

# cd
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias 1='cd ../'
alias 2='cd ../../'
alias 3='cd ../../../'
alias 4='cd ../../../../'

# mdcat
alias mdcat='mdcat --paginate'
alias cat='/bin/cat'

# Screenkey tool to cast keyboard input in realtime
#alias screenkey='screenkey -p fixed -g $(slop -n -f '%g')'

# Faster System Wide Searching
alias fdh='sudo $HOME/.cargo/bin/fd --search-path $HOME -u -H 2>& /dev/null'
alias fdr='sudo $HOME/.cargo/bin/fd --search-path / -u -H 2>& /dev/null'


# open files with their respective program
alias open='xdg-open'

# Git
alias gaa="git add -A"
alias gca="git add --all && git commit --amend --no-edit"
alias gco="git checkout"
alias gs="git status -sb"
alias gf="git fetch --all -p"
alias gps="git push"
alias gpsf="git push --force"
alias gpl="git pull --rebase --autostash"
alias gb="git branch"

# Utils
alias k='kill -9'
alias i.='(idea $PWD &>/dev/null &)'
alias c.='(code $PWD &>/dev/null &)'
alias o.='open .'

# fix obvious typo's
alias cd..='cd ../'
alias cd.='cd ../'
alias pdw='pwd'
alias suod="sudo"
alias sduo="sudo"
alias udso="sudo"
alias sdou="sudo"
alias instal="install"
alias istall="install"
alias isntall="install"
alias isnstall='install'
alias istal="install"
alias nistal='install'
alias nistall='install'
alias intal='install'
alias intall='install'
alias fdn='dnf'
alias dfn='dnf'
alias nfd='dnf'
alias nf='dnf'
alias atp="apt"
alias pudate="update"
alias udpte="update"
alias nfd='dnf'

# Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=always'
alias egrep='egrep --color=always'
alias fgrep='fgrep --color=always'

# # readable output
alias df='df -h'

# # free
alias free="free -mt"

# # continue download
alias wget='wget -c --hsts-file=$XDG_DATA_HOME/wget-hsts'

# x2go
alias x2goclient='x2goclient --home=$XDG_CONFIG_HOME'

# Yarn new Home
alias yarn='yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config'

# # userlist
alias userlist="cut -d: -f1 /etc/passwd"

# # merge new settings
alias merge="xrdb -merge ~/.Xresources"

# # Aliases for software managment
# # pacman or pm / apt / dpkg
alias ainfo="apt info"
alias asearch="apt search"
alias ainstall="sudo apt-get --autoremove --no-install-recommends install"

# # ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

# # add new fonts
alias update-fc="sudo fc-cache -fv"

# # backup contents of /etc/skel to hidden backup folder in home/user
alias bupskel='cp -Rf /etc/skel ~/.skel-backup-$(date +%Y.%m.%d-%H.%M.%S)'

# # copy shell configs
alias cb='cp /etc/skel/.bashrc ~/.bashrc && exec bash'
alias cz='cp /etc/skel/.zshrc ~/.zshrc && echo "Copied."'
#
# # switch between bash and zsh
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"
#
# ## kill commands
# # quickly kill conkies
alias kc='killall conky'
# # quickly kill polybar
alias kp='killall polybar'
# # quickly kill picom
alias kpi='killall picom'
#
# # hardware info --short
alias hw="hwinfo --short"

# # Cleanup orphaned packages
alias acleanse="sudo apt-get autoremove -y && sudo apt-get clean -y && sudo apt autoclean"
alias dcleanse='sudo dnf autoremove'

# # clear
alias clean="clear; seq 1 $(tput cols) | sort -R | sparklines | lolcat"

# # get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# #systeminfo
alias probe="sudo -E hw-probe -all -upload"
alias sysfailed="systemctl list-units --failed"

# #shutdown or reboot
alias safereboot="sudo shutdown now"
alias sr="sudo reboot"

#give the list of all installed desktops - xsessions desktops
alias xd="lsd --icon=always /usr/share/xsessions"

# preview images
alias icat="kitty +kitten icat"

# list files
alias ls="lsd --icon=always"
alias la="lsd --icon=always -a"
alias l="lsd --icon=always -1"
alias ll="lsd --icon=always -ahl"
alias l.='lsd --icon=always -A | grep -E "^\."'
alias lt='lsd --icon=always --tree'

# directory
alias mkdir='mkdir -pv'

# Git
alias clone='git clone'

# Cargo & Rust
alias cupd='cargo update'
alias cclean='cargo clean'
alias cinst='cargo install'
alias csearch='cargo search --limit 50'

# top 10 processes eating cpu
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# svn alias
alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"

# reload bash/zsh conf
alias rebash='source ~/.bashrc'
alias zource='source ~/.config/zsh/.zshrc'
alias nzprof='nvim ~/.zprofile'
alias nzrc='nvim ~/.zshrc'
alias nalias='nvim ~/.aliases.zsh'
alias nkitty='nvim $HOME/.config/kitty/kitty.conf'

# neovim aliases
alias n='nvim'

# Wifi pentesting
alias sysstats='sudo systemctl status wpa_supplicant.service NetworkManager.service | grep "Active"'
alias checkmon='iw dev | grep type | cut -d " " -f 2'
alias checkrfkill='sudo rfkill list all'
alias unblockwlan='sudo rfkill unblock wlan'

# rmt
alias rmt="rmt -i --verbose"

# zoxide
alias z="__zoxide_z"
alias zi="__zoxide_zi"

# dnf
alias dquery='dnf list --all'
alias dinstall='sudo dnf install'
alias dsearch='dnf search'
alias dinfo='dnf info'
alias dcheck='dnf check-update'
alias dupdate='sudo dnf --assumeyes update'
alias list_repos='dnf repolist all'
alias list_repos_off='dnf repolist all | grep disabled'
alias list_repos_on='dnf repolist all | grep enabled'
alias group_list_all='sudo dnf grouplist --hidden'

# check command examples and manuals on Cheat.sh
alias huatperm="stat -c '%A %a %n'"

# Downlad th ebest audio and video with `yt-dlp`
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "

# Zellij session manager
alias zs="zellij-smart-sessionizer"