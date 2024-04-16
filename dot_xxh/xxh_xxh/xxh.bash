#
# This entrypoint is to allow xxh getting current environment variables
# and pass some of them to xxh session to seamless transition to host.
#
# Usage in bash: source xxh.bash [ordinary xxh arguments]
#

local_xxh_home=~/.xxh

eargs=""

for pluginenv_file in $local_xxh_home/.xxh/plugins/*-bash-*/env; do
  if [[ -f $pluginenv_file ]]; then
    plugin_name=$(basename `dirname $pluginenv_file` | tr a-z A-Z | sed 's/-/_/g')

    if [[ $XXH_VERBOSE == '1' || $XXH_VERBOSE == '2' ]]; then
      echo Load plugin env $pluginenv_file
    fi

    for l in `cat $pluginenv_file`
    do
      if [[ -v $l ]]; then
        d=`declare -p $l | base64 --wrap=0`
        dd="export $plugin_name"_EXE_"$l=$d"
        ddd=`echo $dd | base64 --wrap=0`
        if [[ $XXH_VERBOSE == '2' ]]; then
          echo Prepare plugin env $pluginenv_file: name=$l, declare=$d
          echo Prepare plugin env $pluginenv_file bash: $dd
        fi
        eargs="$eargs +heb $ddd"
      fi
    done
  fi
done


CDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
[ -f $CDIR/xxh ] && xxh=$CDIR/xxh || xxh='xxh'
[ -f $CDIR/../xxh ] && xxh=$CDIR/../xxh || xxh='xxh'
$xxh +s xxh-shell-bash $eargs "$@"
