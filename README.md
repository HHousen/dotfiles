# HHousen's dotfiles

> HHousen's configuration files managed by [chezmoi](https://github.com/twpayne/chezmoi). Uses [Zsh](https://en.wikipedia.org/wiki/Z_shell), [Antigen](https://github.com/zsh-users/antigen) for plugin management, [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh/) for plugins and themes, [powerlevel10k](https://github.com/romkatv/powerlevel10k) as the theme, [Oh My Tmux](https://github.com/gpakosz/.tmux) for custom tmux configuration, [Atuin](https://github.com/atuinsh/atuin) for terminal history, and some tools from [modern-unix](https://github.com/ibraheemdev/modern-unix).

## Installation/Setup

Before following the installation steps below, create the file `~/.config/chezmoi/chezmoi.toml` with the following content:

```toml
[data]
    conda_path="/opt/anaconda/"
    manage_firefox_user_chrome=true
    git_email="hayden@haydenhousen.com"
    git_name="Hayden Housen"
```

This file defines variables to be used by [`chezmoi`'s templates](https://github.com/twpayne/chezmoi/blob/master/docs/HOWTO.md#use-templates).

Explanation of the options:

- `conda_path`: Path to your [conda](https://docs.conda.io/en/latest/) installation. If you **don't use conda** then remove `conda_path` or set it to an empty string.
- `manage_firefox_user_chrome`: Set to true to symlink [dot_firefoxUserChrome.css](./dot_firefoxUserChrome.css) into `~/.mozilla/firefox/<profile>/chrome/userChrome.css` (where `<profile>` is automatically determined and is probably your default firefox profile). This is carried out by the [run_once_after_firefox_user_chrome.sh.tmpl](./.chezmoiscripts/run_once_after_firefox_user_chrome.sh.tmpl) script. The default options in [dot_firefoxUserChrome.css](./dot_firefoxUserChrome.css) hide the horizontal tabs and is intended to be used with the [Tree Style Tab](https://github.com/piroor/treestyletab) firefox extension.
- `git_email` and `git_name`: Global git user email and name set in `~/.gitconfig`.

### One Command

Run `sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply HHousen` to get everything downloaded and installed or follow the individual steps below.

### Individual Steps

1. Install `chezmoi` by following [chezmoi's install guide](https://github.com/twpayne/chezmoi/blob/master/docs/INSTALL.md). You can learn more about `chezmoi` by reading their [quick start guide](https://github.com/twpayne/chezmoi/blob/master/docs/QUICKSTART.md) or [how-to guide](https://github.com/twpayne/chezmoi/blob/master/docs/HOWTO.md).

2. Initialize `chezmoi` using this repository: `chezmoi init https://github.com/HHousen/dotfiles.git`.

3. Preview changes that `chezmoi` would make to your `$HOME`: `chezmoi diff`.

4. Apply the changes: `chezmoi apply`. This will automatically install antigen and packages required for certain plugins using the [run_once_install-packages.sh](run_once_install-packages.sh) script. Upon the first launch, `antigen` will initialize and install everything else.

5. Launch zsh: `zsh`.

### Fonts

The font I use is the [Meslo Nerd Font patched for Powerlevel10k](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k).

## Included tools

- [zsh](https://www.zsh.org/) as the shell
- [chezmoi](https://github.com/twpayne/chezmoi) for dotfiles management
- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh/) for plugins and themes
- [Antigen](https://github.com/zsh-users/antigen) for plugin management
- [powerlevel10k](https://github.com/romkatv/powerlevel10k) as the theme
- [Oh My Tmux](https://github.com/gpakosz/.tmux) for custom tmux configuration
- [Atuin](https://github.com/atuinsh/atuin) for terminal history
- [zoxide](https://github.com/ajeetdsouza/zoxide) for a smarter `cd` command
- [bat](https://github.com/sharkdp/bat) for a better `cat` command

## Workflow

1. Run `chezmoi add <file>` to add files to the chezmoi repo.
2. Edit files in `~/.local/share/chezmoi` or wherever the chezmoi repo is (`chezmoi cd` to find out).
3. Git commit (and eventually push) the changes.
4. Run `chezmoi diff` to preview the changes that will be made to your `$HOME`.
5. Run `chezmoi apply` to apply the changes to your `$HOME`.

### Previous tools

Some previous tools that are no longer included:

- [GEF](https://github.com/hugsy/gef) for extra features for GDB
- [the ultimate vim configuration](https://github.com/amix/vimrc)
- [tealdeer](https://github.com/tealdeer-rs/tealdeer) for command-line access to [tldr-pages](https://github.com/tldr-pages/tldr) (set of help pages for command-line tools that is example driven)
- [lsd](https://github.com/lsd-rs/lsd) for a **d**eluxe `ls` command
