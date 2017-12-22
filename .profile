#!/bin/sh

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

source_if () { if [ -n "$1" ]; then if [ -f "$2" ]; then . "$2"; fi; fi; }

source_if "$BASH_VERSION" "$HOME/.bashrc"
source_if "$ZSH_VERSION" "$HOME/.zshrc"

append_paths  () { local p=""; while [ -n "$1" ]; do p="$p:$1"; shift; done; export PATH="$PATH$p"; }
prepend_paths () { local p=""; while [ -n "$1" ]; do p="$p$1:"; shift; done; export PATH="$p$PATH"; }

prepend_paths \
    "$HOME/bin" \
    "$HOME/.local/bin" \
    "$HOME/.cargo/bin" \
    "$HOME/.config/yarn/global/node_modules/.bin"

# OPAM configuration
. /home/mike/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
