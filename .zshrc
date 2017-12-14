#########################################################
# My zshconfig
#########################################################

# Path to your oh-my-zsh installation.
export ZSH=/Users/fangpeng/.oh-my-zsh
DEFAULT_USER="$USER"
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="random"
ZSH_THEME="lambda-mod"

eval "$(thefuck --alias)"
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
DISABLE_LS_COLORS="true"

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
plugins=(git osx autojump brew node npm web-search zsh-autosuggestions extract)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/mysql/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

## Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
#else
#   export EDITOR='mvim'
#fi

# starting tmux on shell login
#if [[ ! $TERM =~ screen ]]; then
#    exec tmux
#fi

#if [[ "$TERM" != "screen-256color" ]]; then
#    exec tmux -S /var/tmux/$USER new-session -A -s "$USER"
#fi

export EDITOR='mvim -v'
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# autojump
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh

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
# 别名设置
alias cls='clear'
alias ll='ls -l'
alias la='ls -a'
alias vi='vim'
alias -s gz='tar -xzvf'	#在命令行直接输入后缀为.gz的文件名，会在该命令打开
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias vim='mvim -v'
alias vi='mvim -v'
alias gs='git push origin master'
alias cls="clear"
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin
alias zshconfig="subl ~/.zshrc"
alias envconfig="subl ~/config/env.sh"
alias gl='git pull origin master'
alias gs='git push origin master'
alias lintpy="python -m 'autopep8' --in-place --aggressive --aggressive"
# 用 sublime text打开文件
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# alias for proxy
alias proxy="export ALL_PROXY=socks5://127.0.0.1:7070"
alias unproxy="unset ALL_PROXY"
alias ip="curl https://haoip.cn/"

export GOPATH="$HOME/goproj/mysqlproxy:$HOME/com/goproc"
export GOROOT=/usr/local/Cellar/go/1.8.1/libexec
export GOBIN=~/gobin
export GIT_EDITOR=mvim
export PYENV_ROOT="$HOME/.pyenv"
export PATH="/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PYENV_ROOT/bin:$PATH"
export PATH="$PATH:$GOROOT/bin:$GOBIN"
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/bin:$PATH

#######Docker alias############
alias dip="docker inspect --format='{{.NetworkSettings.IPAddress}}' $1"
alias dstop="docker stop $1"

# cat 高亮
alias ccat="pygmentize -g -O style=colorful,linenos=1"

alias hp="http_proxy=http://localhost:8123"
alias hsp="https_proxy=https://localhost:8123"
alias glr="git fetch --all && git pull upstream master"


#set pip install requirements.txt
function pips() {
    echo $'\n'$1 >> requirements.txt; pip install $1

}

# create python module
function mkpydir() {
    mkdir $1 && cd $1 && touch __init__.py && cd ..
}
export NVM_DIR="/Users/fangpeng/.nvm"

#########Python虚拟环境############
#
#export WORKON_HOME=~/Envs
#source /usr/local/bin/virtualenvwrapper.sh
#alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

# autoenv自动激活：https://github.com/kennethreitz/autoenv 
#source $(brew --prefix autoenv)/activate.sh
##################################

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#### Docker ######
# 删除所有<none>镜像
function drmi_none() {
	for var in $(docker images | grep "^<none>" | awk '{print $3}')
	do
		docker ps -a | awk '{print $1,$2}' | grep $var | awk '{print $1}' | xargs docker rm 
		docker rmi $var
	done
}

# 快速执行c程序
function crun() {
	cc ${1} -o tmp && ./tmp && rm tmp
}

# git command
git() {
    if [[ $# -ge 1 && ("$1" == "status" || "$1" == "st") ]]; then
        # 如果是其他私有代码仓库，如公司的gitlab，添加name和email
        [ -d .git ] && [[ "X$(git remote -v | grep -o 'code.your_company.com.cn')" != "X" ]] && echo "============= MMM.. WORKER =============" && git config --local user.name fangpeng && git config --local user.email fangpeng@your_company.com.cn
        GIT_PROJECT_CMD=`/usr/bin/git rev-parse --show-toplevel`
        figlet ${GIT_PROJECT_CMD##*\/}
        command git "$@"
    elif [[ $# -ge 1 && "$1" == "todo" ]]; then
        git grep -EnI "TODO|FIXME"
    else
        command git "$@" 
    fi
}
# pip 下载缓存
export PIP_DOWNLOAD_CACHE=$HOME/Library/Caches/pip-downloads

# 设置pyenv代理
export PYTHON_BUILD_MIRROR_URL="http://pyenv.qiniudn.com/pythons/"

# fzf :https://github.com/junegunn/fzf
# vim usage: vim $(fzf)
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# pyspark
export SPARK_HOME=/usr/local/spark-2.1.0
export PATH=$SPARK_HOME/bin:$PATH
export PYTHONPATH=$SPARK_HOME/python/:$PYTHONPATH
export PYTHONPATH=$SPARK_HOME/python/lib/py4j-0.10.4-src.zip:$PYTHONPATH
export PYSPARK_DRIVER_PYTHON="ipython2"

# Maven
export M2_HOME=$HOME/Downloads/tools/apache-maven-3.5.0
export PATH=$PATH:$M2_HOME/bin

# scala
export SCALA_HOME="/usr/local/opt/scala@2.11"
export PATH=$PATH:$SCALA_HOME/bin

#export TTC_BOTS='tinycarebot,selfcare_bot,magicrealismbot'
export TTC_SAY_BOX="cat"
export TTC_WEATHER="Beijing"
export TTC_CELSIUS=true
export TTC_APIKEYS=false
export TTC_UPDATE_INTERVAL=20
# export PATH="/usr/local/opt/scala@2.11/bin:$PATH"
# GUN for Mac
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export JAVA_OPTS="$JAVA_OPTS -DsocksProxyHost=127.0.0.1  -DsocksProxyPort=1080"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH="/usr/local/Cellar/postgresql@9.6/9.6.5/bin:$PATH"

#### Launch Logo
#### FBI WARNING
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

_COLUMNS=$(tput cols)
_MESSAGE=" FBI Warining "
y=$(( ( $_COLUMNS - ${#_MESSAGE} )  / 2 ))
spaces=$(printf "%-${y}s" " ")

echo " "
echo -e "${spaces}\033[41;37;5m FBI WARNING \033[0m"
echo " "
_COLUMNS=$(tput cols)
_MESSAGE="Ferderal Law provides severe civil and criminal penalties for"
y=$(( ( $_COLUMNS - ${#_MESSAGE} )  / 2 ))
spaces=$(printf "%-${y}s" " ")
echo -e "${spaces}${_MESSAGE}"

_COLUMNS=$(tput cols)
_MESSAGE="the unauthorized reproduction, distribution, or exhibition of"
y=$(( ( $_COLUMNS - ${#_MESSAGE} )  / 2 ))
spaces=$(printf "%-${y}s" " ")
echo -e "${spaces}${_MESSAGE}"

_COLUMNS=$(tput cols)
_MESSAGE="copyrighted motion pictures (Title 17, United States Code,"
y=$(( ( $_COLUMNS - ${#_MESSAGE} )  / 2 ))
spaces=$(printf "%-${y}s" " ")
echo -e "${spaces}${_MESSAGE}"

_COLUMNS=$(tput cols)
_MESSAGE="Sections 501 and 508). The Federal Bureau of Investigation"
y=$(( ( $_COLUMNS - ${#_MESSAGE} )  / 2 ))
spaces=$(printf "%-${y}s" " ")
echo -e "${spaces}${_MESSAGE}"

_COLUMNS=$(tput cols)
_MESSAGE="investigates allegations of criminal copyright infringement"
y=$(( ( $_COLUMNS - ${#_MESSAGE} )  / 2 ))
spaces=$(printf "%-${y}s" " ")
echo -e "${spaces}${_MESSAGE}"
######### END Logo ########
