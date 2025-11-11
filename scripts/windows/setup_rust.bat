@echo on
setlocal

winget install -e --id=Rustlang.Rustup

rustup self update
rustup update

rustup component add rust-analyzer
rustup component add rustfmt

endlocal
