{{ if eq .chezmoi.os "linux" -}}
#!/bin/sh
sudo apt install thefuck autojump
{{ else if eq .chezmoi.os "darwin" -}}
#!/bin/sh
brew install thefuck autojump
{{ end -}}

curl -L git.io/antigen > ~/antigen.zsh
