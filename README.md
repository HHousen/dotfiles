# HHousen's dotfiles

> HHousen's configuration files managed by [chezmoi](https://github.com/twpayne/chezmoi). Uses [Zsh](https://en.wikipedia.org/wiki/Z_shell), [Antidote](https://antidote.sh/) for plugin management, [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh/) for plugins and themes, [powerlevel10k](https://github.com/romkatv/powerlevel10k) as the theme, [Oh My Tmux](https://github.com/gpakosz/.tmux) for custom tmux configuration, [Atuin](https://github.com/atuinsh/atuin) for terminal history, [mise](https://mise.jdx.dev/) for runtime and CLI tool management, and some tools from [modern-unix](https://github.com/ibraheemdev/modern-unix).

## Installation/Setup

Before following the installation steps below, create the file `~/.config/chezmoi/chezmoi.toml` with the following content:

```toml
[data]
    atuin_sync_address="https://api.atuin.sh"
    manage_firefox_user_chrome=true
    git_email="hayden@haydenhousen.com"
    git_name="Hayden Housen"
```

This file defines variables to be used by [`chezmoi`'s templates](https://github.com/twpayne/chezmoi/blob/master/docs/HOWTO.md#use-templates).

Explanation of the options:

- `atuin_sync_address`: URL of your Atuin sync server. The public default is `https://api.atuin.sh`.
- `manage_firefox_user_chrome`: Set to true to symlink [dot_firefoxUserChrome.css](./dot_firefoxUserChrome.css) into `~/.mozilla/firefox/<profile>/chrome/userChrome.css` (where `<profile>` is automatically determined and is probably your default firefox profile). This is carried out by the [run_once_after_firefox_user_chrome.sh.tmpl](./.chezmoiscripts/run_once_after_firefox_user_chrome.sh.tmpl) script. The default options in [dot_firefoxUserChrome.css](./dot_firefoxUserChrome.css) hide the horizontal tabs and is intended to be used with the [Tree Style Tab](https://github.com/piroor/treestyletab) firefox extension.
- `git_email` and `git_name`: Global git user email and name set in `~/.gitconfig`.

### One Command

Run `sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply HHousen` to get everything downloaded and installed or follow the individual steps below.

### Individual Steps

1. Install `chezmoi` by following [chezmoi's install guide](https://github.com/twpayne/chezmoi/blob/master/docs/INSTALL.md). You can learn more about `chezmoi` by reading their [quick start guide](https://github.com/twpayne/chezmoi/blob/master/docs/QUICKSTART.md) or [how-to guide](https://github.com/twpayne/chezmoi/blob/master/docs/HOWTO.md).

2. Initialize `chezmoi` using this repository: `chezmoi init https://github.com/HHousen/dotfiles.git`.

3. Preview changes that `chezmoi` would make to your `$HOME`: `chezmoi diff`.

4. Apply the changes: `chezmoi apply`. This will automatically install Antidote and packages required for certain plugins using the [run_once_install-packages.sh.tmpl](./.chezmoiscripts/run_once_install-packages.sh.tmpl) script. Upon the first launch, Antidote will initialize the plugins listed in [dot_zsh_plugins.txt](./dot_zsh_plugins.txt), which is applied to `~/.zsh_plugins.txt`.

5. Launch zsh: `zsh`.

### Fonts

The font I use is the [Meslo Nerd Font patched for Powerlevel10k](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k).

## Included tools

- [zsh](https://www.zsh.org/) as the shell
- [chezmoi](https://www.chezmoi.io/) for dotfiles management
- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh/) for plugins and themes
- [Antidote](https://antidote.sh/) for plugin management
- [powerlevel10k](https://github.com/romkatv/powerlevel10k) as the theme
- [Oh My Tmux](https://github.com/gpakosz/.tmux) for custom tmux configuration
- [Atuin](https://github.com/atuinsh/atuin) for terminal history
- [zoxide](https://github.com/ajeetdsouza/zoxide) for a smarter `cd` command
- [fzf](https://github.com/junegunn/fzf) for fuzzy finding
- [bat](https://github.com/sharkdp/bat) for a better `cat` command
- [lsd](https://github.com/lsd-rs/lsd) for a better `ls` command
- [tealdeer](https://github.com/tealdeer-rs/tealdeer) for command-line access to [tldr-pages](https://github.com/tldr-pages/tldr)
- [thefuck](https://github.com/nvbn/thefuck) for shell command correction
- [mise](https://mise.jdx.dev/) for Node.js, Python, and npm-installed CLI tool management

## Notable behavior

- Atuin manages command history, so zsh history persistence is disabled.
- mise is activated in zsh and manages Node.js, Python, Claude Code, and Codex via [dot_config/mise/config.toml](./dot_config/mise/config.toml).
- Zsh plugins are specified in [dot_zsh_plugins.txt](./dot_zsh_plugins.txt), which chezmoi manages as `~/.zsh_plugins.txt`.

## Agent configs

Claude and Codex configs are split between work and personal homes:

- `~/.claude-work` and `~/.claude-personal`
- `~/.codex-work` and `~/.codex-personal`

The personal Claude settings file is managed as a chezmoi symlink to the work settings file.

## Workflow

1. Run `chezmoi add <file>` to add files to the chezmoi repo.
2. Edit files in `~/.local/share/chezmoi` or wherever the chezmoi repo is (`chezmoi cd` to find out).
3. Git commit (and eventually push) the changes.
4. Run `chezmoi diff` to preview the changes that will be made to your `$HOME`.
5. Run `chezmoi apply` to apply the changes to your `$HOME`.
