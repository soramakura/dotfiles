@echo on
setlocal

winget install -e --id=Microsoft.VisualStudio.2022.BuildTools
winget install -e --id=Microsoft.VisualStudio.2022.Community

endlocal

