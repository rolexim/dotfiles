# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  ansible
  aws
  brew
  colored-man-pages
  colorize
  docker
  docker-compose
  docker-machine
  fzf
  fzf-tab # to turn it on and off: toggle-fzf-tab
  git
  github
  kubectl
  macos
  pip
  pyenv
  pylint
  python
  sublime
  terraform
  vagrant
  vagrant-prompt
  vscode
  yarn
  zsh-autosuggestions
  zsh-syntax-highlighting
  )

# Note: adding zsh-completions as a regular Oh My ZSH! plugin will not work properly
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# If you want hub (GitHub CLI) to work with the system zsh, add this to your ~/.zshrc before it sources oh-my-zsh.sh
if (( ! ${fpath[(I)/usr/local/share/zsh/site-functions]} )); then
  FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi

source $ZSH/oh-my-zsh.sh

# User configuration

# RCONTRERAS 2022-05-22 - Custom aliases & env variables
case "$OSTYPE" in
  darwin*)
    alias onedd='cd ~/Documents/OneD'
    alias onedw='cd ~/Documents/OneD/0Work'
    alias onedp='cd ~/Documents/OneD/1Personal'
    alias onedl='cd ~/Documents/OneD/2Learning'
    # RCONTRERAS 2020-10-16 - Add .local/bin to PATH
    # FOR WSL:
    # PATH=$HOME/.local/bin:/usr/local/go/bin:$PATH
    #
    # FOR macOS:
    #
    export MYKEYS=~/Documents/OneD/1Personal/REVISAR-KEYS/SSH/AWSKeys
    ;|
  linux*)
    alias onedd='cd /mnt/c/Users/RCONTRERAS/OneDrive/Documents'
    alias onedw='cd /mnt/c/Users/RCONTRERAS/OneDrive/Documents/0Work'
    alias onedp='cd /mnt/c/Users/RCONTRERAS/OneDrive/Documents/1Personal'
    alias onedl='cd /mnt/c/Users/RCONTRERAS/OneDrive/Documents/2Learning'
    # RCONTRERAS 2020-10-16 - Add .local/bin to PATH
    # FOR WSL:
    # PATH=$HOME/.local/bin:/usr/local/go/bin:$PATH
    #
    # FOR macOS:
    #
    export MYKEYS=/mnt/c/Users/RCONTRERAS/OneDrive/Documents/1Personal/REVISAR-KEYS/SSH/AWSKeys
    ;|
  dragonfly*|freebsd*|netbsd*|openbsd*)
    # ...
    ;|
  *)
    # RCONTRERAS 2022-04-28 - https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-completion.html
    # autoload bashcompinit && bashcompinit               #### 2022-09-26 - This line might not be neccesary if Oh My Zsh plugin is used
    # autoload -Uz compinit && compinit                   #### 2022-09-26 - This line might not be neccesary if Oh My Zsh plugin is used
    # complete -C '/usr/local/bin/aws_completer' aws      #### 2022-09-26 - This line might not be neccesary if Oh My Zsh plugin is used
    # complete -o nospace -C /usr/bin/terraform terraform #### 2022-09-26 - This line might not be neccesary if Oh My Zsh plugin is used
    # source /etc/bash_completion.d/azure-cli             #### 2022-09-26 - This line might not be neccesary if Oh My Zsh plugin is used

    # # UGLY HISTORY SYNC BETWEEN TABS DISABLE
    setopt INC_APPEND_HISTORY
    setopt NO_SHARE_HISTORY
    # setopt APPEND_HISTORY
    # # unsetopt

    # History file de-duplication
    setopt HIST_EXPIRE_DUPS_FIRST                         #### 2022-10-28
    setopt HIST_IGNORE_DUPS                               #### 2022-10-28
    setopt HIST_IGNORE_ALL_DUPS                           #### 2022-10-28
    setopt HIST_IGNORE_SPACE                              #### 2022-10-28
    setopt HIST_FIND_NO_DUPS                              #### 2022-10-28
    setopt HIST_SAVE_NO_DUPS                              #### 2022-10-28

    # RCONTRERAS 2022-09-22 - SSH Keep alive
    alias ssh='ssh -o TCPKeepAlive=yes -o ServerAliveInterval=15'

    # RCONTRERAS 2022-09-22 - fzf configuration
    export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border'

    # RCONTRERAS 2022-09-22 - pyenv shell environment
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    # Load pyenv-virtualenv automatically
    eval "$(pyenv virtualenv-init -)"
    # pyenv shell environment

    # RCONTRERAS 2022-09-22 - Colorize plugin
    export ZSH_COLORIZE_STYLE="dracula"

    ldapsearchr() {
      USER_ID=${1:-$USER}
      echo LDAP summary for uid=$USER_ID
      ldapsearch -xLLL -H ldaps://ldap.pinadmin.com -b dc=pinterest,dc=com "(uid=$USER_ID)"
      ldapsearch -xLLL -H ldaps://ldap.pinadmin.com:636 -b dc=pinterest,dc=com uid=$USER_ID memberOf
    }

    # # RCONTRERAS 2022-09-22 - Modern Unix customizations
    # alias bathelp='bat -plhelp'
    # help() {
    #   set -o pipefail
    #   "$@" --help 2>&1 | bat -plhelp
    # }
    # # Modern Unix customizations

    # RCONTRERAS 2022-09-22 - Start SSH agent & Add keys
    if [ -z "$SSH_AUTH_SOCK" ] ; then # -z for Bash
    # eval $(ssh-agent)
    # eval `ssh-agent -s`  # -c Generate C-shell | -s Generate Bourne shell
    # ssh-add ~/.ssh/id_rsa     # Add Default RSA key (just for AWS :O)
    # ssh-add ~/.ssh/id_ed25519 # Add ED25519 key
    fi
    # Start SSH agent & Add keys
    ;;
esac
# RCONTRERAS Custom aliases & env variables

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  # export EDITOR='mvim'
  export EDITOR='subl -w'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
