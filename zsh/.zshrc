# ~/.zshrc — plain zsh + antidote + starship

# ── Locale ──────────────────────────────────────────────────────────────
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# ── PATH ────────────────────────────────────────────────────────────────
typeset -U path fpath # drop duplicate entries automatically

export PNPM_HOME="$HOME/Library/pnpm"
export BUN_INSTALL="$HOME/.bun"
path=(
  "$HOME/.local/bin"
  "$BUN_INSTALL/bin"
  "$PNPM_HOME"
  "$HOME/.console-ninja/.bin"
  $path
)
[[ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]] && source "$HOME/google-cloud-sdk/path.zsh.inc"

export COREPACK_ENABLE_AUTO_PIN=0
export EDITOR=nvim
export VISUAL=nvim

# ── History ─────────────────────────────────────────────────────────────
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history       
setopt share_history         
setopt hist_ignore_all_dups   
setopt hist_ignore_space      
setopt hist_reduce_blanks
setopt hist_verify            

# ── Shell options ───────────────────────────────────────────────────────
setopt auto_cd                # type a directory name to cd into it
setopt auto_pushd pushd_ignore_dups pushd_silent # `cd -<Tab>` lists recent dirs
setopt interactive_comments   # allow # comments on the command line
setopt no_beep

# ── Completion ──────────────────────────────────────────────────────────
ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
[[ -d "$ZSH_CACHE_DIR" ]] || mkdir -p "$ZSH_CACHE_DIR"

autoload -Uz compinit bashcompinit
if [[ -n "$ZSH_CACHE_DIR/zcompdump"(#qN.mh+24) || ! -f "$ZSH_CACHE_DIR/zcompdump" ]]; then
  compinit -d "$ZSH_CACHE_DIR/zcompdump"
else
  compinit -C -d "$ZSH_CACHE_DIR/zcompdump"
fi
bashcompinit # needed by gcloud's bash-style completion

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*' # case-insensitive + fuzzy
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no                        # fzf-tab replaces the menu
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$ZSH_CACHE_DIR/zcompcache"
zstyle ':completion:*:descriptions' format '[%d]'     # lets fzf-tab group results
zstyle ':completion:*:git-checkout:*' sort false

# fzf-tab: previews while completing
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' fzf-flags --height=50%
zstyle ':fzf-tab:complete:(cd|__zoxide_z|__zoxide_zi):*' fzf-preview 'eza -1 --color=always --icons=always $realpath'
zstyle ':fzf-tab:complete:(nvim|n|cat|bat):*' fzf-preview '[[ -d $realpath ]] && eza -1 --color=always --icons=always $realpath || bat --color=always --style=numbers --line-range=:200 $realpath'

# ── Plugins (antidote) ──────────────────────────────────────────────────
# Plugin list lives in ~/.zsh_plugins.txt; antidote compiles it to a static file
# and only regenerates it when the list changes.
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
zstyle ':antidote:bundle' use-friendly-names 'yes'
antidote load "$HOME/.zsh_plugins.txt" "$ZSH_CACHE_DIR/zsh_plugins.zsh"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=50
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# ── Key bindings ────────────────────────────────────────────────────────
bindkey -e                                   # emacs-style line editing
bindkey '^[[A' history-substring-search-up   # ↑
bindkey '^[[B' history-substring-search-down # ↓
bindkey '^P'   history-substring-search-up
bindkey '^N'   history-substring-search-down
bindkey '^[[1;3D' backward-word              # ⌥←
bindkey '^[[1;3C' forward-word               # ⌥→
bindkey '^[[1;5D' backward-word              # ⌃←
bindkey '^[[1;5C' forward-word               # ⌃→
bindkey '^[[H'  beginning-of-line            # Home
bindkey '^[[F'  end-of-line                  # End
bindkey '^[[3~' delete-char                  # Delete
bindkey '^[[Z'  reverse-menu-complete        # ⇧Tab
bindkey ' '     magic-space                  # expand !! / !$ on space

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line             # Ctrl-X Ctrl-E: edit command in nvim

# ── Tools ───────────────────────────────────────────────────────────────
# fzf: Ctrl-R history · Ctrl-T files · Alt-C directories
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height=50% --layout=reverse --border=rounded --info=inline'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:200 {}'"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_ALT_C_OPTS="--preview 'eza --tree --level=2 --color=always --icons=always {}'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window=down:3:wrap"
source <(fzf --zsh)

eval "$(zoxide init zsh)" # z <dir>, zi = interactive picker

# Node (fnm): auto-switches version on cd when a .nvmrc / .node-version is found
eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell zsh)"

# Completions that need compinit to be loaded first
[[ -s "$BUN_INSTALL/_bun" ]] && source "$BUN_INSTALL/_bun"
[[ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]] && source "$HOME/google-cloud-sdk/completion.zsh.inc"

# ── Aliases & functions ─────────────────────────────────────────────────
alias e='exit'
alias n='nvim'

# Better ls
alias ls="eza --icons=auto --group-directories-first"
alias ll='eza -lh --icons=auto --group-directories-first --git --time-style=relative --hyperlink'
alias la='ll -a'
alias lt='eza --tree --level=2 --icons=auto --git-ignore'

# Better cd
alias cd="z"

# Make a directory and move into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Firefox
alias ffd='open -na Firefox --args -P daily'
alias ffp='open -na Firefox --args -P pentest'
alias ffdev='open -na "Firefox Developer Edition" --args -P dev'
# throwaway profile, deleted by hand or on reboot
fftmp() { open -na Firefox --args --profile "$(mktemp -d)"; }

# Claude Code with GLM settings
alias glm='claude --settings ~/.claude/glm.json'

# ── Prompt ──────────────────────────────────────────────────────────────
eval "$(starship init zsh)"
