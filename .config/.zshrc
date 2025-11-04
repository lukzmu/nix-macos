# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
    docker
    docker-compose
    git
    python
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Aliasing
alias notes='cd ~/developer/projects/lukzmu/notes/ && nvim .'
alias journal='cd ~/developer/projects/lukzmu/journal/'
alias lg='lazygit'
alias img='wezterm imgcat $@'

# Theme
eval "$(starship init zsh)"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - path)"
