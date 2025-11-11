@echo on
setlocal

echo %DOTFILES_DIR%
cd %DOTFILES_DIR%

@rem neovim
xcopy /E %DOTFILES_DIR%\config\nvim %LOCALAPPDATA%\

endlocal
