[group("editor")]
neovim: git c-development
    sudo dnf install neovim python3-neovim tree-sitter-cli

    ln -snf "{{justfile_directory()}}/config/nvim" "{{config_directory()}}/"

[group("editor")]
helix:
    sudo dnf install helix

    ln -snf "{{justfile_directory()}}/config/helix" "{{config_directory()}}/"
