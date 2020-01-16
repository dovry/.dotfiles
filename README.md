# Dotfiles

Version numbering in the files

- X.0.0 major   - the file is overhauled
- 0.X.0 minor   - commands are added or removed
- 0.0.X fix     - the file is improved in any other way

## [.zshrc](.zshrc) and .bashrc

The zshrc is configured properly and is ready for use

[shell_setup.sh](shell_setup.sh) is a script that adds a few lines of text to the .bashrc so it can source the aliases and functions. It also symlinks .zshrc, .vimrc and .tmux.conf to the homefolder

## [Aliases](.shell_aliases) and [Functions](.shell_functions)

These files contain aliases and functions for both bash and zsh

## [.tmux.conf](.tmux.conf)

configuration for [Tmux](https://github.com/tmux/tmux)

## [.vimrc](.vimrc)

configuration for [Vim](https://www.vim.org/)

## Fresh-install

Bootstrapping scripts
