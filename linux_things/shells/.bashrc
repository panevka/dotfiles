#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


source /usr/share/nvm/init-nvm.sh
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export ANDROID_HOME=/home/syzyf/software/Android/Sdk  # Replace with the actual SDK path
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/lib/jvm/default
export KITTY_PATH="/usr/bin/kitty"
export PYTHON_HOME="/usr/bin/python3"
export PATH=$PATH:$PYTHON_HOME/Scripts
export EDITOR=nvim 
export VISUAL=nvim
export BROWSER=zen-browser

if [ -r "$HOME/.bashrc_private" ]; then
    source "$HOME/.bashrc_private"
fi

eval "$(starship init bash)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
