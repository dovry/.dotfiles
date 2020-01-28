# Dotfiles

## Setup

[shell_setup.sh](shell_setup.sh) is a script that adds a few lines of text to the `.bashrc` so it can source the aliases and functions. If there exists a `~/.zshrc` then it is moved, and a dummy file that sources everything required is created instead. It also symlinks `.vimrc` and `.tmux.conf` to `~/`

## Version numbering

Running `ver` or `version` returns the version number for each of the files

- X.0.0 major   - the file is overhauled
- 0.X.0 minor   - commands are added or removed
- 0.0.X fix     - the file is improved in any other way

## [Aliases](.shell_aliases) and [Functions](.shell_functions)

These files contain aliases and functions for both bash and zsh

## [.tmux.conf](.tmux.conf)

configuration for [Tmux](https://github.com/tmux/tmux)

## [.vimrc](.vimrc)

configuration for [Vim](https://www.vim.org/)

## Fresh-install

Bootstrapping scripts - WIP
