# My aliases

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# ls stuff, most are set in lib/directories.zsh
alias ls='gls --color'
alias l='lsd -l'
alias la='lsd -la'
alias lt='ls -ltFho'   #long list,sorted by date,show type,human readable
alias ldot='ls -ld .*' #list dot files

# Copy current directory path to keyboard
alias cwd="pwd | pbcopy"

# CD Shortcuts
alias d="cd ~/Documents/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias docs="cd ~/Documents"
alias sites="cd ~/Sites"
alias notes="cd ~/Documents/Notes"
alias omz="cd ~/.oh-my-zsh"
alias omzc="cd ~/.oh-my-zsh/custom"

# Quick edit to my aliases and zshrc config
alias zshrc="vim ~/.zshrc"
alias aliases="vim ~/.oh-my-zsh/custom/myaliases.zsh"
alias galiases="ccat ~/.oh-my-zsh/plugins/git/git.plugin.zsh | grep alias"

#Misc
alias scrum="chrome https://nordicnaturals.zoom.us/j/5519745621"
alias kara="vim ~/.config/karabiner/karabiner.json"
alias hosts="sudo vim /etc/hosts"

# Git 
alias gs='git status'
alias gl="git log --pretty=format:'%C(magenta)%h %C(cyan)%ad %C(yellow)%an%Cgreen%d %Creset%s' --date=short -n 25"
alias gl1="git log -1 --pretty=format:'%C(magenta)%B' | lolcat -F 0.017"
alias gl2="git log -2 --pretty=format:'%C(magenta)%B' | lolcat -F 0.017"
alias gl3="git log -3 --pretty=format:'%C(magenta)%B' | lolcat -F 0.017"
alias gdf='git --no-pager diff dev... --name-only | lolcat -F 0.015'
# Opens changed files from last
alias fix="git diff --name-only | uniq | xargs code-insiders"
alias fix2="git diff --name-only | uniq | grep -v '\.jsx\.snap' | grep -v '\.lock' | xargs code-insiders"

# Some docker and composer things
alias flushredis='docker exec nordicnaturals_redis /bin/bash -c "redis-cli flushall"'
alias nnbash='echo "🐳 🐳  docker exec -it nordicnaturals_web bash 🐳 🐳" && docker exec -it nordicnaturals_web bash'
alias flushmagento='php bin/magento cache:flush'
alias deploystatic='php bin/magento setup:static-content:deploy --area=frontend -f'

# Docker Process Status
alias dps='echo "🐳 🐳 🐳 🐳" && docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}"'
alias dres='docker restart nordicnaturals_web'

# docker-compose and composer
alias dcup='docker-compose up -d'
alias dc='docker-compose'
alias cu='composer update --prefer-source'
alias cui='composer update --prefer-source --ignore-platform-reqs'

# Dockergento
alias dg='dockergento'
alias dgs='dockergento start'
alias dgw='dockergento watch vendor/nordicnaturals | lolcat -F 0.015'
alias dgc='dockergento magento cache:clean'
alias dgf='dockergento magento cache:flush'
alias dgd='dockergento magento setup:static-content:deploy --area=frontend -f'
alias dgu='dockergento magento setup:upgrade'
alias dgir='dockergento magento indexer:reindex'
alias dgcu='dockergento composer update --prefer-source'
alias dgcuir='dockergento composer update --prefer-source --ignore-platform-reqs'
alias dgmh='dockergento mirror-host app dev generated pub var'
alias dgbash='dockergento bash'
alias daliases="ccat ~/.oh-my-zsh/custom/myaliases.zsh | grep dockergento"

#alias flushstatic='rm -R pub/static/frontend/NordicNaturals && rm -R var/view_preprocessed'
alias fs='echo "Removing ./generated" && rm -rf ./generated && echo "Removing ./pub/static" && rm -rf ./pub/static'

alias scratch='vim ~/Documents/Notes/scratch.md'
# Make nested directories and file
mktouch() { 
  mkdir -p $(dirname $1) && touch $1; 
}

# Encode an svg to base64 and copy to clipboard, ex: b64 path/to/image.svg
function b64() {
  echo "data:image/svg+xml;base64," && openssl base64 < $1 | tr -d '\n' | cat $1 | openssl base64 | tr -d '\n' | pbcopy
}

function whatschanged() {
  git --no-pager diff $1... --name-only | lolcat -F 0.015
}

# Search for a word in a file, ex) peep searchterm file.php
function peep() {
  grep -B 1 -A 5 $1 $2 | pygmentize -l bash -O style=dracula
}
function srch() {
  grep -B 5 -A 5 $1 $2
}

function serve() {
  if [ $# -eq 0 ]
    then
      python -m SimpleHTTPServer 8000
  fi
  python -m SimpleHTTPServer $1
}

alias ghd='open /Applications/GitHub\ Desktop.app'

# Spotify
# it's occasionally convenient to control spotify in the terminal ¯\_(ツ)_/¯
alias sptf="spotify"
alias sptfs="spotify status | lolcat"
alias sptfp="spotify play"
alias sptfpa="spotify pause"
alias sptfn="spotify next"
alias sptfpr="spotify prev"
alias sptfv="spotify vol"
alias sptfvu="spotify vol up"
alias sptfvd="spotify vol down"


#alias todo="awk '(p+=/^\* Notes/)>1{exit} p' ~/Documents/Notes/work-notes.org | pygmentize -l lua -O style=material -f console256 -g"
#alias td="awk '(p+=/^\* Notes/)>1{exit} p' ~/Documents/Notes/work-notes.org | highlight --syntax javascript --out-format xterm256 -l --force -s moria --no-trailing-nl"
alias todo="echo '🦄 org-mode notes C-x n s' && sleep 2 && emacs -nw ~/Documents/Notes/work-notes.org"
alias em="open /usr/local/Cellar/emacs-plus/26.2/Emacs.app"

#set default pygmentize style
alias pygmentize='pygmentize -O style=dracula -f console256 -g'

# Colored up cat
# Install Pygments first - "sudo easy_install Pygments"
# and pigments material theme: https://github.com/horosgrisa/pygments-style-material
# style located at /usr/local/lib/python2.7/site-packages/Pygments-2.3.1-py2.7.egg/pygments/styles
alias ccat='pygmentize -O style=dracula -f console256 -g'

# Pipe Highlight to less
export LESSOPEN="| $(which highlight) %s --out-format xterm256 -l --force -s moria --no-trailing-nl"
export LESS=" -R"
alias less='less -m -N -g -i -J --line-numbers --underline-special'
alias more='less'

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get week number
alias week='date +%V'

# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'

# Google Chrome
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias flushit="sudo killall -HUP mDNSResponder; sleep 2;"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# macOS has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# macOS has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# JavaScriptCore REPL
jscbin="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc";
[ -e "${jscbin}" ] && alias jsc="${jscbin}";
unset jscbin;

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
#alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias urldecode='python -c "import sys, urllib as ul; \
    print ul.unquote_plus(sys.argv[1])"'

alias urlencode='python -c "import sys, urllib as ul; \
    print ul.quote_plus(sys.argv[1])"'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "${method}"="lwp-request -m '${method}'"
done

# Make Grunt print stack traces by default
command -v grunt > /dev/null && alias grunt="grunt --stack"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l && source ~/.zshrc"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

