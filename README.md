# I really dig Oh My Zsh
The combination of z.sh for quick and easy directory changes and pretty visuals that let you know what directory and branch you are on is tops. I'm a spacey airhead so this type of thing makes CLI things much more bearable. Overall my needs are pretty basic so I like to keep things clean and simple.

This is a repo of my `~/.oh-my-zsh/custom` directory. I'm putting it up here along side some notes so setting things up on a new machine will be easy.

![Screenshot of my terminal](/img/omzscreen.png?raw=true)

## Here are some of my set-up and installation notes

**Install Oh My Zsh via curl:**

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

**Pull this repo into your `~/.oh-my-zsh/custom` folder**

`cd ~/.oh-my-zsh/custom && git pull https://github.com/mikowl/ohmyzsh-custom.git`

**Configure your ~/.zshrc file**

I keep an updated version of my .zshrc config [here](https://gist.github.com/mikowl/88b674937f265d1b372083f2fbf16d22) or scroll down to copy and paste my config.

## Things that are needed in order for the above config to work properly

### Powerlevel9k

I like the [Powerlevel9k](https://github.com/bhilburn/powerlevel9k) theme because it's easy enough to customize and get it to look the way I want. 

Just clone it into the `custom/themes` directory.

`git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k`

### Fonts

There are lots of powerline flavors of your favorite font, my favorite powerline flavored font is **Meslo LG L DZ Regular**, it can be found [here](https://github.com/powerline/fonts/tree/master/Meslo%20Dotted).

### Awesome Terminal fonts

This font improves the symbols that are displayed in the terminal, particularly for git (i.e. an octocat, branch icon, up and down arrows, clock, etc). It's a bit of a pain to install but worth it I think.

- [Download the fonts here](https://github.com/gabrielelana/awesome-terminal-fonts)
- Follow [these instructions](https://github.com/gabrielelana/awesome-terminal-fonts/wiki/OS-X) for installing

### Terminal theme

- I use a slightly modified version of Solarized for my Terminal's theme. You can [find it here](https://gist.github.com/mikowl/2e9a0b3b88355b40aa4cbcf30d4ea676)

### Aliases

Aliases that I need that aren't included in plug-ins are put into `custom/myaliases.zsh`.

### Cat

![Screenshot of pygmentized cat](/img/omzcat.png?raw=true)

I like have a colored cat command, particularly this [material style pygments theme](https://github.com/horosgrisa/pygments-style-material).

**To Install**

`pip install pygments` and `pip install pygments-style-material`

## .zshrc config

```
#Mikowl's .zshrc config v1.6b
printf  '%s%*s%s' "$(tput setaf 175)" $(tput cols) "🗓  $(date '+%A, %B, %d')"

# Path to your oh-my-zsh installation.
export ZSH="/Users/"$(whoami)"/.oh-my-zsh"

# zsh completion (brew install zsh-completions)
fpath=(/usr/local/share/zsh-completions $fpath)

# Powerlevel9k Theme set-up

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='awesome-fontconfig'

# Stuff on the left
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_DIR_HOME_BACKGROUND='000'
POWERLEVEL9K_DIR_HOME_FOREGROUND='219'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='000'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='004'
POWERLEVEL9K_DIR_ETC_BACKGROUND='123'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='123'
POWERLEVEL9K_VCS_BACKGROUND='035'
POWERLEVEL9K_VCS_FOREGROUND='red'

# Stuff on the right
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)
POWERLEVEL9K_STATUS_OK_BACKGROUND='000'
POWERLEVEL9K_STATUS_OK_FOREGROUND='078'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='000'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='203'
POWERLEVEL9K_TIME_BACKGROUND='000'
POWERLEVEL9K_TIME_FOREGROUND='143'
POWERLEVEL9K_DATE_BACKGROUND='000'
POWERLEVEL9K_DATE_FOREGROUND='175'

# Git stuff
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='000'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='078'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='000'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='228'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='000'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='204'

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Plugins
plugins=(
  brew catimg colorize cp emoji emoji-clock git gitfast lwd node npm osx vscode web-search z
)

source $ZSH/oh-my-zsh.sh

# precmd is called just before the prompt is printed
# I just use it to add a space between commands
function precmd() {
  echo ""
}

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
fi

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Custom aliases are set in ~/.oh-my-zsh/custom/myaliases.zsh
```
