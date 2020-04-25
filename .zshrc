# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export TERM="screen-256color"

# Prompt Settings (http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html)
export PS1="%B%K{4} %3~ > %k%b "

# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-9.0.1.jdk/Contents/Home

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Grep
export GREP_COLOR=always

# Lerna GitHub Access
export GH_TOKEN=6cd28562b263c3e40c3dda7aa31a820e6f10fd0d 

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'
