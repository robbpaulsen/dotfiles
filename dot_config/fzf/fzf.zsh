# Setup fzf
# ---------
if [[ ! "$PATH" == */home/heimdal/.local/share/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}$HOME/.local/share/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/heimdal/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/heimdal/.fzf/shell/key-bindings.zsh"

# User theme
# -----------
#export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
# --color=fg:#dedede,bg:#121212,hl:#666666
# --color=fg+:#eeeeee,bg+:#282828,hl+:#cf73e6
# --color=info:#cf73e6,prompt:#FF0000,pointer:#cf73e6
# --color=marker:#f0d50c,spinner:#cf73e6,header:#91aadf'

# Rain theme
# ---------
export FZF_DEFAULT_OPTS='
--color=fg:#f8f8f2,bg:#32324b,hl:#8be9fd
--color=fg+:#f8f8f2,bg+:#616175,hl+:#8be9fd
--color=info:#8be9fd,prompt:#a8ffde,pointer:#f1fa8c
--color=marker:#f1fa8c,spinner:#8be9fd,header:#a8ffde'

# Halcyon theme
# -------------
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
# --color=fg:#d7dce2,bg:#1d2433,hl:#c3a6ff
# --color=fg+:#d7dce2,bg+:#2f3b54,hl+:#c3a6ff
# --color=info:#5ccfe6,prompt:#bae67e,pointer:#ffae57
# --color=marker:#ef6b73,spinner:#ffd580,header:#8695b7'

# Actiblush theme
# --------------
### export FZF_DEFAULT_OPTS=" \
#    --color=bg+:#040c16,bg:#040c16,spinner:#92bbed,hl:#bdd6f4\
#    --color=fg:#cce9ea,header:#E6676B,info:#92bbed,pointer:#92bbed \
#    --color=marker:#edf7f8,fg+:#cce9ea,prompt:#92bbed,hl+:#92bbed \
#    --prompt ' : '"

# Lighthaus theme
# ---------------
#  export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#     --color=fg:#CCCCCC,bg:#18191E,hl:#FFFF00
#     --color=fg+:#FFEE79,bg+:#21252D,hl+:#ED722E
#     --color=info:#D68EB2,prompt:#50C16E,pointer:#FFFF00
#     --color=marker:#FC2929,spinner:#FF4D00,header:#1D918B'

# Rose pine moon theme
# -------------------
# export FZF_DEFAULT_OPTS="
# --color=fg:#908caa,bg:#232136,hl:#ea9a97
# --color=fg+:#e0def4,bg+:#393552,hl+:#ea9a97
# --color=border:#44415a,header:#3e8fb0,gutter:#232136
# --color=spinner:#f6c177,info:#9ccfd8,separator:#44415a
# --color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

# Catppuccin mocha theme
# ---------------------
# export FZF_DEFAULT_OPTS=" \
#--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
#--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
#--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

 # Open up fzf as a floating pane
export FZF_TMUX=0
