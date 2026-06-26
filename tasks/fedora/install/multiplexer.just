[group("multiplexer")]
tmux:
    sudo dnf install tmux

    ln -snf "{{justfile_directory()}}/config/tmux" "{{home_directory()}}/"
