[group("c")]
c-development:
    sudo dnf install @c-development


[group("c")]
clang: c-development
    sudo dnf install clang clang-tools-extra lld lldb


