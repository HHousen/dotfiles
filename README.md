# HHousen's dotfiles

> HHousen's configuration files managed by [chezmoi](https://github.com/twpayne/chezmoi). Uses [Zsh](https://en.wikipedia.org/wiki/Z_shell), [Antigen](https://github.com/zsh-users/antigen) for plugin management, [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh/) for plugins and themes, [powerlevel10k](https://github.com/romkatv/powerlevel10k) as the theme, and [the ultimate vim configuration](https://github.com/amix/vimrc).

## Installation/Setup

Note: [dot_zshrc.tmpl](dot_zshrc.tmpl) is set up to use [conda](https://docs.conda.io/en/latest/). Make sure to set `conda_path` in `~/.config/chezmoi/chezmoi.toml` so `chezmoi` can add conda to your path correctly. This is accomplished through [`chezmoi`'s templates](https://github.com/twpayne/chezmoi/blob/master/docs/HOWTO.md#use-templates).

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
