@echo on
setlocal

set DOTFILES_REPO=https://github.com/soramakura/dotfiles.git
set DOTFILES_DIR=%CD%

cd ..\
cd
if exist dotfiles (
    echo "dotfiles is checked out already."
) else (
    git clone ${DOTFILES_REPO}
)
cd %DOTFILES_DIR%

winget upgrade --all
call .\scripts\windows\setup_langc.sh
call .\scripts\windows\setup_cmdtools.sh
call .\scripts\windows\setup_git.sh
call .\scripts\windows\setup_rust.sh
call .\scripts\windows\setup_neovim.sh
call .\scripts\windows\link.sh

if exist %USERPROFILE%\.ssh\id_ed25519 (
    echo "id_ed25519.pub already exists"
) else (
    ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519
    cat ~/.ssh/id_ed25519.pub
)

echo "Done!"

endlocal
