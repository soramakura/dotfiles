help:
    @just --list fedora install

import "./install/c.just"
import "./install/clitools.just"
import "./install/container.just"
import "./install/credential-manager.just"
import "./install/editor.just"
import "./install/file-browser.just"
import "./install/file-sync.just"
import "./install/fonts.just"
import "./install/for-config.just"
import "./install/git.just"
import "./install/ime.just"
import "./install/multimedia-apps.just"
import "./install/multimedia-runtime.just"
import "./install/multiplexer.just"
import "./install/nvidia.just"
import "./install/power-profiles.just"
import "./install/rust.just"
import "./install/screen.just"
import "./install/terminal.just"
import "./install/web-browser.just"
import "./install/wm.just"
import "./install/zig.just"

[private]
mod _dnf "./dnf.just"
