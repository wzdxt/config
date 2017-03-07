# Path to your oh-my-zsh installation.
export ZSH=/Users/xintong.dai/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="random"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias aj="autojump"
alias reopen="source ~/.zshrc"
alias gs="git status"
alias gu="git add -u"
alias gcs="git commit -s"
alias gcsm="git commit -s -m"
alias gp="git push origin head"
alias gr="git rebase"
alias gt="git tag"
alias gitmerge="gf && git branch -D xbj-dev ; git checkout -b xbj-dev origin/xbj-dev && git merge - && gp && git checkout -"
alias artis="./artisan ide-helper:meta && ./artisan ide-helper:models && ./artisan ide-helper:generate"
alias tunnel="~/workspace/xuebaapp/ssh_tunnel.sh"
gctp() {
  ROOT=`git rev-parse --show-toplevel`
  COMPOSER_FILE=${ROOT}/composer.json
  if [ -f ${COMPOSER_FILE} ]; then
    VERSION=`jq '.version' ${COMPOSER_FILE} | cut -d'"' -f2`
    if [ -z ${VERSION} ]; then
      echo 'version not defined by composer.json'
      return 1
    fi
  else
    echo 'cannot fine composer.json'
    return 1
  fi
  gc -m ${VERSION}; gt ${VERSION} -f; git push origin ${VERSION} -f
}

# autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# php-version
source $(brew --prefix php-version)/php-version.sh

# docker
eval "$(docker-machine env default)"


# php
export XDEBUG_CONFIG="idekey=netbeans-xdebug"
export KOHANA_ENV=development

# sbtenv
eval "$(sbtenv init -)"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.composer/vendor/bin" # Add RVM to PATH for scripting
export HOMEBREW_GITHUB_API_TOKEN="fc925f5424c4017cfc8695f956e35b38a1c880f9"
export GOROOT=/usr/local/Cellar/go/1.7/libexec/
export GOPATH=/Users/xintong.dai/projects/golang/
