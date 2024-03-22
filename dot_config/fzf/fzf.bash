# Setup fzf
# ---------
if [[ ! "$PATH" == */home/heimdal/.local/share/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/heimdal/.local/share/fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/heimdal/.local/share/fzf/shell/completion.bash"

# Key bindings
# ------------
source "/home/heimdal/.local/share/fzf/shell/key-bindings.bash"
