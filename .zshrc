export TERM="xterm-256color"
# Zi Setup
zi_home="${HOME}/.zi"
source "${zi_home}/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
###-tns-completion-start-###
if [ -f /Users/barayuda/.tnsrc ]; then 
    source /Users/barayuda/.tnsrc 
fi
###-tns-completion-end-###
POWERLEVEL9K_MODE="nerdfont-complete"
source  ~/.oh-my-zsh/custom/themes/powerlevel9k/powerlevel9k.zsh-theme

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user ssh dir dir_writable newline os_icon vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time root_indicator background_jobs history)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/.profile
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias startDatabase='brew services start mariadb'
alias stopDatabase='brew services stop mariadb'
alias restartDatabase='brew services restart mariadb'
alias ll='exa -l -F --icons'
export ANDROID_HOME=/Users/$USER/Documents/SDK/android
export FLUTTER_HOME=/Users/$USER/Documents/SDK/flutter/bin
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=$FLUTTER_HOME::$PATH

#alias php="/Applications/AMPPS/php/bin/php"
#alias mysql="/Applications/AMPPS/mysql/bin"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
#export PATH="/Applications/AMPPS/mysql/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

plugins+=(zsh-nvm)
source ~/.zsh-nvm/zsh-nvm.plugin.zsh

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/barayuda/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/barayuda/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/barayuda/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/barayuda/google-cloud-sdk/completion.zsh.inc'; fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# RUBY
# export RUBY_BREW="/usr/local/opt/ruby/bin"
# export PATH=$RUBY_BREW:$PATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# RUBY RVM
export PATH="/Users/barayuda/.rvm/gems/ruby-2.7.0/bin:$PATH"

# Fish shell
zi light simnalamburt/shellder
