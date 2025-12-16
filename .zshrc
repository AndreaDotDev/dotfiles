export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load 
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh


# ---- Custom Aliases ----
alias e='exit'
alias n='nvim'

# Better ls 
alias ls="eza --icons=always"

# Better cd
alias cd="z"
eval "$(zoxide init zsh)"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/acolombo/Lavoro/Sesamo/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/acolombo/Lavoro/Sesamo/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/acolombo/Lavoro/Sesamo/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/acolombo/Lavoro/Sesamo/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Corepack environment variable
export COREPACK_ENABLE_AUTO_PIN=0


PATH=~/.console-ninja/.bin:$PATH
# pnpm
export PNPM_HOME="/Users/acolombo/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Added by Windsurf
export PATH="/Users/acolombo/.codeium/windsurf/bin:$PATH"
