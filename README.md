# I really dig Oh My Zsh
The combination of z.sh for quick and easy directory changes and pretty visuals that let you know what directory and branch you are on is tops. I'm a goddamn spacey airhead so this type of thing makes CLI things much more bearable.

![Screenshot of my terminal](/img/omzscreen.png?raw=true)

## Here are some of my set-up and installation notes

**Install Oh My Zsh via curl:**

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

**Configure ~/.zshrc config file**

I keep an updated version of my .zshrc config [here](https://gist.github.com/mikowl/88b674937f265d1b372083f2fbf16d22)

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

