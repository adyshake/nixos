# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "wintermi/zsh-lsd"
plug "MAHcodes/distro-prompt"
plug "chivalryq/git-alias"
plug "zap-zsh/sudo"

bindkey -e

export ANDROID_HOME="$HOME/Library/Android/sdk"
# PATH exports
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/opt/apache-maven/bin"
export PATH="$PATH:$(brew --prefix llvm@15)/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"/Users/snadnan/Library/Python/3.11/bin"
export GOPATH="$HOME/go"

export CPPFLAGS="-I/opt/homebrew/opt/openjdk@11/include"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home"
# . "$HOME/.cargo/env"

export LDFLAGS="$LDFLAGS -L$(brew --prefix llvm@15)/lib"
export CPPFLAGS="$CPPFLAGS -I$(brew --prefix llvm@15)/include"
# bun completions
# [ -s "/Users/snadnan/.bun/_bun" ] && source "/Users/snadnan/.bun/_bun"

# bun
# export BUN_INSTALL="$HOME/.bun"
export EDITOR='nvim'

# opam configuration
[[ ! -r /Users/snadnan/.opam/opam-init/init.zsh ]] || source /Users/snadnan/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

alias y="yarn"
eval "$(fnm env --use-on-cd)"
alias vi=nvim

export PATH="$PATH:$GOPATH/bin"
export HOMEBREW_NO_ANALYTICS=1

bindkey -s "^f" "t-sesh\n"
bindkey -s "^g" "nvim .\n"
# bindkey -s "^h" "home-manager switch --show-trace\n"

[ -f "/Users/snadnan/.ghcup/env" ] && source "/Users/snadnan/.ghcup/env" # ghcup-env
export PATH=$PATH:/Users/snadnan/.toolbox/bin
eval "$(/opt/homebrew/bin/brew shellenv)"
# Set up rtx for runtime management
eval "$(rtx activate zsh)"
# source /Users/snadnan/.brazil_completion/zsh_completion
alias auth='kinit && mwinit'
alias dsk='ssh devdesk'
alias dskm='mwinit -o && ssh devdesk'
alias dskk='auth && ssh devdesk'
alias rzsh='source ~/.zshrc'
alias nds='ninja-dev-sync'

alias bb=brazil-build
alias bba='brazil-build apollo-pkg'
alias bre='brazil-runtime-exec'
alias brc='brazil-recursive-cmd'
alias bws='brazil ws'
alias bwsuse='bws use --gitMode -p'
alias bwscreate='bws create -n'
alias brc=brazil-recursive-cmd
alias bbr='brc brazil-build'
alias bball='brc --allPackages'
alias bbb='brc --allPackages brazil-build'
alias bbc='brc --allPackages brazil-build clean'
alias bbra='bbr apollo-pkg'
alias erg='eda run git'

if [ -e /home/snadnan/.nix-profile/etc/profile.d/nix.sh ]; then . /home/snadnan/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi


# You probably also want to add Nix to your path:
export PATH=$HOME/.nix-profile/bin:$PATH

# If you plan to use home-manager, it may also be required to set NIX_PATH
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/$USER/channels${NIX_PATH:+:$NIX_PATH}

function midcurl() {
  /usr/bin/curl "$@" -L --cookie ~/.midway/cookie --cookie-jar ~/.midway/cookie
}

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"