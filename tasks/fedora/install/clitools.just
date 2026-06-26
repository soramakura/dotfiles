[group("cli-tools")]
ripgrep:
    sudo dnf install ripgrep

[group("cli-tools")]
fd-find:
    sudo dnf install fd-find

[group("cli-tools")]
fzf:
    sudo dnf install fzf
    echo 'eval "$(fzf --bash)"' >> "{{home_directory()}}/.bashrc"

[group("cli-tools")]
bat:
    sudo dnf install bat

[group("cli-tools")]
btop:
    sudo dnf install btop

[group("cli-tools")]
ps_mem:
    sudo dnf install ps_mem

[group("cli-tools")]
fastfetch:
    sudo dnf install fastfetch

[group("cli-tools")]
yt-dlp:
    sudo dnf install yt-dlp

[group("cli-tools")]
nmtui:
    sudo dnf install nmtui
