@echo on
setlocal

@rem ripgrep
winget install -e --id=BurntSushi.ripgrep.MSVC

@rem bat
winget install -e --id= sharkdp.bat

@rem  fd
winget install -e --id=sharkdp.fd

@rem lazygit
winget install -e --id=JesseDuffield.lazygit

endlocal
