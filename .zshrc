
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	sudo
)

source $ZSH/oh-my-zsh.sh

######
if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi
######

## Aliases##
# Archivos y navegación
alias ls='lsd --group-dirs=first'
alias la='lsd -a'
alias ll='lsd -l'
alias lla='lsd -la'
alias lt='lsd --tree'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias mkdir='mkdir -pv'          # Crea directorios mostrando la ruta y creando padres
alias rm='rm -i'                 # Confirma antes de eliminar (seguridad)
alias cp='cp -i'                 # Confirma antes de sobrescribir
alias mv='mv -i'                 # Confirma antes de mover/sobrescribir

# Exploradores
alias cat='bat'                  # Usa bat como reemplazo moderno de cat
alias grep='grep --color=auto'  # Mejora visual para grep

# Edición
alias vim='nvim'
alias vi='nvim'
alias n='nvim'

# Sistema
alias update='sudo apt update && sudo apt upgrade -y'
alias cls='clear'
alias htop='btm'                 # Si usas bottom, el htop moderno
alias ping='ping -c 5'           # Limita los pings por defecto

# Información del sistema
alias disk='df -h'
alias mem='free -h'
alias ports='ss -tuln'

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'

# Sudo rápido
alias please='sudo'  # por si te sientes educado 😂
alias fuck='sudo $(fc -ln -1)'  # con `thefuck` o sin, para corregir errores anteriores


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
