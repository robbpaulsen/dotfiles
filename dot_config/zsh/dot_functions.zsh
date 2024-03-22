function cdd() {
	cd "$(lsd -d -- */ | fzf)" || echo "Invalid directory"
}

# get the list of recet directories visited with `cd` command
function recent_dirs() {
	# This script depends on pushd. It works better with autopush enabled in ZSH
	escaped_home=$(echo $HOME | sed 's/\//\\\//g')
	selected=$(dirs -p | sort -u | fzf)

	cd "$(echo "$selected" | sed "s/\~/$escaped_home/")" || echo "Invalid directory"
}

# Create Directories to start a pentesting session
function mkt() {
	mkdir {nmap,content,exploits,scripts}
}

# Extract nmap information
function extractPorts() {
	ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
	ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
	echo -e "\n[*] Extracting information...\n" >extractPorts.tmp
	echo -e "\t[*] IP Address: $ip_address" >>extractPorts.tmp
	echo -e "\t[*] Open ports: $ports\n" >>extractPorts.tmp
	echo $ports | tr -d '\n' | xclip -sel clip
	echo -e "[*] Ports copied to clipboard\n" >>extractPorts.tmp
	cat extractPorts.tmp
	rm extractPorts.tmp
}

# Set 'man' colors
function man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
}

# fzf improvement
fzf-lovely() 
{

	if [ "$1" = "h" ]; then
		fzf -m --reverse --preview-window down:30 --preview '[[ $(file --mime {}) =~ binary ]] &&
 	                echo {} is a binary file ||
	                 (~/.cargo/bin/bat --style=numbers --color=always {} ||
	                  highlight -O ansi -l {} ||
	                  coderay {} ||
	                  rougify {} ||
	                  /bin/cat {}) 2> /dev/null | head -500'

	else
	        fzf -m --preview '[[ $(file --mime {}) =~ binary ]] &&
	                         echo {} is a binary file ||
	                         (~/.cargo/bin/bat --style=numbers --color=always {} ||
	                          highlight -O ansi -l {} ||
	                          coderay {} ||
	                          rougify {} ||
	                          /bin/cat {}) 2> /dev/null | head -500'
	fi
}

# Free cache and perform quick scrubbing
function rmk() {
	scrub -p dod $1
	shred -zun 10 -v $1
}

# Get a random shell tip
function rndmtip() {
  curl -s https://raw.githubusercontent.com/jlevy/the-art-of-command-line/master/README.md | 
    sed '/cowsay[.]png/d' | 
    pandoc -f markdown -t html |
    xmlstarlet fo --html --dropdtd |
    xmlstarlet sel -t -v "(html/body/ul/li[count(p)>0])[$RANDOM mod last()+1]" |
    xmlstarlet unesc | fmt -80 | iconv -t US
}

# Extract the actual terminal size
function get_term_size() {
    # Usage: get_term_size

    # (:;:) is a micro sleep to ensure the variables are
    # exported immediately.
    shopt -s checkwinsize; (:;:)
    printf '%s\n' "$LINES $COLUMNS"
}

# extract the exact size of the focused window
function get_window_size() {
    # Usage: get_window_size
    printf '%b' "${TMUX:+\\ePtmux;\\e}\\e[14t${TMUX:+\\e\\\\}"
    IFS=';t' read -d t -t 0.05 -sra term_size
    printf '%s\n' "${term_size[1]}x${term_size[2]}"
}

# find the most common/repeated word on a file
function mode() {
  if [[ $# -ne 1 ]]; then
    echo 'find the most common item in file'
    echo 'EXAMPLE: mode <FILE>'
  else
    LC_ALL=C sort -T ./ $1 | uniq -c | LC_ALL=C sort -T ./ -rn
  fi
}

# unique sort file
function usort() {
  if [[ $# -ne 1 ]]; then
    echo 'unique sort file inplace'
    echo 'EXAMPLE: usort <FILE>'
  else
    LC_ALL=C sort -u $1 -T ./ -o $1
  fi
}

function get_display() {
  dispmngr="$(grep 'ExecStart' /etc/systemd/system/display-manager.service | tr '/' ' ' | awk '{ print $NF }')"
  echo -e "\n[+] This is your display manager: $dispmngr\n"
}

function ctrl_l() {
    builtin print -rn -- $'\r\e[0J\e[H\e[22J' >"$TTY"
    builtin zle .reset-prompt
    builtin zle -R
}
zle -N ctrl_l
bindkey '^l' ctrl_l

# retrieve SELinux enforcing status
function genf() {
  getenforce
}

# set SELinux enforce status to Permissive
function set_free() {
  sudo setenforce 0 &&
      enfstat="$(getenforce)"
      echo $enfstat
}

# check your weather putting city as parameter
function weather() {
  curl "https://v2.wttr.in/$1"
}

# cheat-sheet in terminal
function cheatsheet() {
  curl "https://cht.sh/$1"
}

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
function ex() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo ''$1' cannot be extracted via ex()' ;;
    esac
  else
    echo ''$1' is not a valid file'
  fi
}

function kln_lns() {

  awk '{ if (!seen[$0]++) print }' $1

}

function test_colors1() {

  curl -s https://gist.githubusercontent.com/WoLpH/8b6f697ecc06318004728b8c0127d9b3/raw/colortest.py | 
    python

}

function test_colors2() {

  for code ({000..255}) print -P -- "\n\n$code: %F{$code}This is how your text would look like%f\n"

}

function any_zombies() {
     ps -xaw -o state -o ppid |
          grep Z |
          grep -v PID |
          awk '{print $2}'
}

function kill_emall() {
     kill -9 `ps -xaw -o state -o ppid |
          grep Z |
          grep -v PID | 
          awk '{print $2}'`
}

function test_colors3() {

  awk 'BEGIN{
  s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
  for (colnum = 0; colnum<77; colnum++) {
    r = 255-(colnum*255/76);
    g = (colnum*510/76);
    b = (colnum*255/76);
    if (g>255) g = 510-g;
      printf "\033[48;2;%d;%d;%dm", r,g,b;
      printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
      printf "%s\033[0m", substr(s,colnum+1,1);
    }
    printf "\n";
  }'

}

function knowledge() {
  tldr --list |
    fzf --layout=reverse --preview 'tldr {1} --color=always' --preview-window=right,70% |
    xargs tldr
}

# Color Testing for zsh

typeset -AHg FX FG BG

FX=(
  reset     "%{%}"
  bold      "%{%}" no-bold      "%{%}"
  dim       "%{%}" no-dim       "%{%}"
  italic    "%{%}" no-italic    "%{%}"
  underline "%{%}" no-underline "%{%}"
  blink     "%{%}" no-blink     "%{%}"
  reverse   "%{%}" no-reverse   "%{%}"
)

for color in {000..255}; do
  FG[$color]="%{color}m%}"
  BG[$color]="%{color}m%}"
done

# Show all 256 colors with color number
function spectrum_ls() {
  setopt localoptions nopromptsubst
  local ZSH_SPECTRUM_TEXT=${ZSH_SPECTRUM_TEXT:-Arma virumque cano Troiae qui primus ab oris}
  for code in {000..255}; do
    print -P -- "$code: ${FG[$code]}${ZSH_SPECTRUM_TEXT}%{$reset_color%}"
  done
}

# Show all 256 colors where the background is set to specific color
function spectrum_bls() {
  setopt localoptions nopromptsubst
  local ZSH_SPECTRUM_TEXT=${ZSH_SPECTRUM_TEXT:-Arma virumque cano Troiae qui primus ab oris}
  for code in {000..255}; do
    print -P -- "$code: ${BG[$code]}${ZSH_SPECTRUM_TEXT}%{$reset_color%}"
  done
}

# Rename Lazy Vims Config Dir for the VIM fundamentals Course
function rnme_lazy() {
  nname=$HOME/.config/nvim-TEMP
  oname=$HOME/.config/nvim
  cname=$HOME/.config/nvim-FUNDAMENTALS

  mv $oname $nname &&
    mv $cname $oname
}

function rnme_backlazy() {
  nname=$HOME/.config/nvim-TEMP
  oname=$HOME/.config/nvim
  cname=$HOME/.config/nvim-FUNDAMENTALS

  mv $oname $cname &&
    mv $nname $oname
}

function show_certs() {
  awk -v cmd='openssl x509 -noout -subject' '/BEGIN/{close(cmd)};{ print | cmd }' < /etc/ssl/certs/ca-certificates.crt
}

function fan_speed(){
  speed="$(sensors | grep fan2 | awk '{print $2; exit}')"

  if [ "$speed" != "" ]; then
    speed_round=$(echo "$speed/1000" | bc -l | LANG=C xargs printf "%.1f\n")
    echo "# $speed_round"
  else
    echo "#"
  fi
}


function wless_down(){
  alias ip='sudo /usr/sbin/ip'
  wiface=$(iw dev | grep "Interface " | xargs | cut -d " " -f 2)

  ip link set $wiface down
}

function wless_rmac(){
  alias macchanger='sudo /bin/macchanger'
  wiface=$(iw dev | grep "Interface " | xargs | cut -d " " -f 2)

  sudo macchanger -a $wiface
}

function wless_omac(){
  alias macchanger='sudo /bin/macchanger'
  wiface=$(iw dev | grep "Interface " | xargs | cut -d " " -f 2)

  sudo macchanger -p $wiface
}

function wless_mon(){
  alias iw='sudo /usr/sbin/iw'
  wiface=$(iw dev | grep "Interface " | xargs | cut -d " " -f 2)

  iw dev $wiface set type monitor
}

function wless_up(){
  alias ip='sudo /usr/sbin/ip'
  wiface=$(iw dev | grep "Interface " | xargs | cut -d " " -f 2)

  ip link set $wiface up
}

function wless_unblock(){
  sudo rfkill unblock all
}

function mpressed() {
  DATE=($(date +%s%d%m%Y))
  tar -zcf backup-${DATE} -C $1 $2 # orden de los archivos "-zcf backup-etc es el nombre del comprimmido que se creara , -C es el directorio base de donde sincronizara y el siguiente argumto es el directorio destino"
}

function xtrct_emails() {
  grep -HiEhr -o -e "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b:...*" | grep '\S'
}

rot13 () {
	if [ $# -eq 0 ]; then
		tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
	else
		echo $* | tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
	fi
}

get_os() {
  kernel_name=$(uname -s)

# $kernel_name is set in a function called cache_uname and is
    # just the output of "uname -s".
    case $kernel_name in
        Darwin)   os=$darwin_name ;;
        SunOS)    os=Solaris ;;
        Haiku)    os=Haiku ;;
        MINIX)    os=MINIX ;;
        AIX)      os=AIX ;;
        IRIX*)    os=IRIX ;;
        FreeMiNT) os=FreeMiNT ;;

        Linux|GNU*)
            os=Linux
        ;;

        *BSD|DragonFly|Bitrig)
            os=BSD
        ;;

        CYGWIN*|MSYS*|MINGW*)
            os=Windows
        ;;

        *)
            printf '%s\n' "Unknown OS detected: '$kernel_name', aborting..." >&2
            printf '%s\n' "Open an issue on GitHub to add support for your OS." >&2
            exit 1
        ;;
    esac
}

get_distro()
{
  cat /etc/os-release | tr '"' " " | grep -E "NAME" | head -n 1 | awk -F " " '{ print $2 }'
}

get_memory() {
    case $os in
        "Linux" | "Windows")
            # MemUsed = Memtotal + Shmem - MemFree - Buffers - Cached - SReclaimable
            # Source: https://github.com/KittyKatt/screenFetch/issues/386#issuecomment-249312716
            while IFS=":" read -r a b; do
                case $a in
                    "MemTotal") ((mem_used+=${b/kB})); mem_total="${b/kB}" ;;
                    "Shmem") ((mem_used+=${b/kB}))  ;;
                    "MemFree" | "Buffers" | "Cached" | "SReclaimable")
                        mem_used="$((mem_used-=${b/kB}))"
                    ;;
                esac
            done < /proc/meminfo

            mem_used="$((mem_used / 1024))"
            mem_total="$((mem_total / 1024))"
        ;;

        "Mac OS X" | "macOS" | "iPhone OS")
            mem_total="$(($(sysctl -n hw.memsize) / 1024 / 1024))"
            mem_wired="$(vm_stat | awk '/ wired/ { print $4 }')"
            mem_active="$(vm_stat | awk '/ active/ { printf $3 }')"
            mem_compressed="$(vm_stat | awk '/ occupied/ { printf $5 }')"
            mem_compressed="${mem_compressed:-0}"
            mem_used="$(((${mem_wired//.} + ${mem_active//.} + ${mem_compressed//.}) * 4 / 1024))"
        ;;

        "BSD" | "MINIX")
            # Mem total.
            case $kernel_name in
                "NetBSD"*) mem_total="$(($(sysctl -n hw.physmem64) / 1024 / 1024))" ;;
                *) mem_total="$(($(sysctl -n hw.physmem) / 1024 / 1024))" ;;
            esac

            # Mem free.
            case $kernel_name in
                "NetBSD"*)
                    mem_free="$(($(awk -F ':|kB' '/MemFree:/ {printf $2}' /proc/meminfo) / 1024))"
                ;;

                "FreeBSD"* | "DragonFly"*)
                    hw_pagesize="$(sysctl -n hw.pagesize)"
                    mem_inactive="$(($(sysctl -n vm.stats.vm.v_inactive_count) * hw_pagesize))"
                    mem_unused="$(($(sysctl -n vm.stats.vm.v_free_count) * hw_pagesize))"
                    mem_cache="$(($(sysctl -n vm.stats.vm.v_cache_count) * hw_pagesize))"
                    mem_free="$(((mem_inactive + mem_unused + mem_cache) / 1024 / 1024))"
                ;;

                "MINIX")
                    mem_free="$(top -d 1 | awk -F ',' '/^Memory:/ {print $2}')"
                    mem_free="${mem_free/M Free}"
                ;;

                "OpenBSD"*) ;;
                *) mem_free="$(($(vmstat | awk 'END {printf $5}') / 1024))" ;;
            esac

            # Mem used.
            case $kernel_name in
                "OpenBSD"*)
                    mem_used="$(vmstat | awk 'END {printf $3}')"
                    mem_used="${mem_used/M}"
                ;;

                *) mem_used="$((mem_total - mem_free))" ;;
            esac
        ;;

        "Solaris" | "AIX")
            hw_pagesize="$(pagesize)"
            case $os in
                "Solaris")
                    pages_total="$(kstat -p unix:0:system_pages:pagestotal | awk '{print $2}')"
                    pages_free="$(kstat -p unix:0:system_pages:pagesfree | awk '{print $2}')"
                ;;

                "AIX")
                    IFS=$'\n'"| " read -d "" -ra mem_stat <<< "$(svmon -G -O unit=page)"
                    pages_total="${mem_stat[11]}"
                    pages_free="${mem_stat[16]}"
                ;;
            esac
            mem_total="$((pages_total * hw_pagesize / 1024 / 1024))"
            mem_free="$((pages_free * hw_pagesize / 1024 / 1024))"
            mem_used="$((mem_total - mem_free))"
        ;;

        "Haiku")
            mem_total="$(($(sysinfo -mem | awk -F '\\/ |)' '{print $2; exit}') / 1024 / 1024))"
            mem_used="$(sysinfo -mem | awk -F '\\/|)' '{print $2; exit}')"
            mem_used="$((${mem_used/max} / 1024 / 1024))"
        ;;

        "IRIX")
            IFS=$'\n' read -d "" -ra mem_cmd <<< "$(pmem)"
            IFS=" " read -ra mem_stat <<< "${mem_cmd[0]}"

            mem_total="$((mem_stat[3] / 1024))"
            mem_free="$((mem_stat[5] / 1024))"
            mem_used="$((mem_total - mem_free))"
        ;;

        "FreeMiNT")
            mem="$(awk -F ':|kB' '/MemTotal:|MemFree:/ {printf $2, " "}' /kern/meminfo)"
            mem_free="${mem/*  }"
            mem_total="${mem/$mem_free}"
            mem_used="$((mem_total - mem_free))"
            mem_total="$((mem_total / 1024))"
            mem_used="$((mem_used / 1024))"
        ;;

    esac

    [[ "$memory_percent" == "on" ]] && ((mem_perc=mem_used * 100 / mem_total))

    case $memory_unit in
        gib)
            mem_used=$(awk '{printf "%.2f", $1 / $2}' <<< "$mem_used 1024")
            mem_total=$(awk '{printf "%.2f", $1 / $2}' <<< "$mem_total 1024")
            mem_label=GiB
        ;;

        kib)
            mem_used=$((mem_used * 1024))
            mem_total=$((mem_total * 1024))
            mem_label=KiB
        ;;
    esac

    memory="${mem_used}${mem_label:-MiB} / ${mem_total}${mem_label:-MiB} ${mem_perc:+(${mem_perc}%)}"

    # Bars.
    case $memory_display in
        "bar")     memory="$(bar "${mem_used}" "${mem_total}")" ;;
        "infobar") memory="${memory} $(bar "${mem_used}" "${mem_total}")" ;;
        "barinfo") memory="$(bar "${mem_used}" "${mem_total}")${info_color} ${memory}" ;;
    esac
}


get_cpu()
{
  awk -F '\\s*: | @' '/model name|Hardware|Processor|^cpu model|chip type|^cpu type/ { cpu=$2; if ($1 == "Hardware") exit } END { print cpu }' /proc/cpuinfo
}

get_cpu_usage() {
    case $os in
        "Windows")
            cpu_usage="$(wmic cpu get loadpercentage)"
            cpu_usage="${cpu_usage/LoadPercentage}"
            cpu_usage="${cpu_usage//[[:space:]]}"
        ;;

        *)
            # Get CPU cores if unset.
            if [[ "$cpu_cores" != "logical" ]]; then
                case $os in
                    "Linux" | "MINIX")  cores="$(grep -c "^processor" /proc/cpuinfo)" ;;
                    "Mac OS X"|"macOS") cores="$(sysctl -n hw.logicalcpu_max)" ;;
                    "BSD")              cores="$(sysctl -n hw.ncpu)" ;;
                    "Solaris")          cores="$(kstat -m cpu_info | grep -c -F "chip_id")" ;;
                    "Haiku")            cores="$(sysinfo -cpu | grep -c -F 'CPU #')" ;;
                    "iPhone OS")        cores="${cpu/*\(}"; cores="${cores/\)*}" ;;
                    "IRIX")             cores="$(sysconf NPROC_ONLN)" ;;
                    "FreeMiNT")         cores="$(sysctl -n hw.ncpu)" ;;

                    "AIX")
                        cores="$(lparstat -i | awk -F':' '/Online Virtual CPUs/ {printf $2}')"
                    ;;
                esac
            fi

            cpu_usage="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
            cpu_usage="$((${cpu_usage/\.*} / ${cores:-1}))"
        ;;
    esac

    # Print the bar.
    case $cpu_display in
        "bar")     cpu_usage="$(bar "$cpu_usage" 100)" ;;
        "infobar") cpu_usage="${cpu_usage}% $(bar "$cpu_usage" 100)" ;;
        "barinfo") cpu_usage="$(bar "$cpu_usage" 100)${info_color} ${cpu_usage}%" ;;
        *)         cpu_usage="${cpu_usage}%" ;;
    esac
}


# Trim leading and trailing spaces (for scripts)
trim() {
	local var=$@
	var="${var#"${var%%[![:space:]]*}"}"  # remove leading whitespace characters
	var="${var%"${var##*[![:space:]]}"}"  # remove trailing whitespace characters
	echo -n "$var"
}


get_gpu() {
  lspci -mm | awk -F '\"|\" \"|\\(' '/"Display|"3D|"VGA/ {a[$0] = $1 " " $3 " " $4} END {for(i in a) {if(!seen[a[i]]++) print a[i]}}' | awk -F " " '{ print $2,$3,$4,$5,$6,$7 }' | sed 's/\[//g' | sed 's/\]//g'
}


yt_playlist ()
{
   yt-dlp -o "%(playlist)s/%(playlist_index)s" -f "bv+ba/b" "$1"
}

function commands() {
  echo "\033[0;91m ============== ALL COMMANDS AVAILABLE =============="
  echo "weather         [city]      - Check weather"
  echo "cheatsheet      [command]   - cheatsheet online"
  echo "cdd                         - Cd into dir with fzf"
  echo "recent_dirs                 - View most recent accesed dirs"
  echo "mkt                         - Create a tree layout for pentest workflow"
  echo "extractPorts    [file]      - Extract the discovered ports from an Nmap file"
  echo "fzf-lovely                  - Dynamic pre-viewer with Fzf and bat"
  echo "rndmtip                     - Recieve a random tip from Cowsays"
  echo "get_term_size               - Get the terminal size in columns"
  echo "get_window_size [command]   - Get the window size in columns"
  echo "test_colors1                 - Test colors #1"
  echo "test_colors2                 - Test colors #2"
  echo "test_colors3                 - Test colors #3"
  echo "mode            [file]      - Find the most common/repeated word on a file"
  echo "usort           [file]      - in place sort the order of a file with many lines"
  echo "get_display                 - Get the name of the Display Manager"
  echo "ex              [file]      - EXtractor for all kind of archives"
  echo "kln_lns         [file]      - Print unsorted unique lines from a list/text file"
  echo "knowledge                   - Explore the TLDR pages and search for a command"
  echo "kill_emall                  - Kill any zombie process taking forever"
  echo "any_zombies                 - find zombie processes"
  # echo "                          - "
  echo "\033[0;91m ===================================================="
}
