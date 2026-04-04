# dotfiles
dotfiles for soramakura.

## Ubuntu
```
curl https://raw.githubusercontent.com/soramakura/dotfiles/main/setup_ubuntu.sh | bash -xe
```

## Fonts

- Noto Sans CJK JP
- Noto Selif CJK JP
- HackGen Console NF
  - https://github.com/yuru7/HackGen/releases
    - Install `HackGen_NF_v*.zip`

## Prompt

```bash
function __parse_git_branch() {
    local branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        echo -e "\001\e[0m\002*\001\e[95m\002$branch\001\e[0m\002 "
    fi
}
export PS1="\[\e[0;92m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;96m\]\w \$(__parse_git_branch)\[\e[92m\]\$ \[\e[0m\]"
```
