vim-config
==========

A set of configuration files and plugins for the vim text editor.
Plugins are managed using [vim-plug](https://github.com/junegunn/vim-plug).

The easiest way to use this repository is to check out a local copy and create the appropriate links, e.g.

```shell
cd ~
git clone https://github.com/decrispell/vim-config.git vim-config
```

On Linux/Mac:

```shell
ln -s vim-config/vimrc .vimrc
ln -s vim-config/gvimrc .gvimrc
ln -s vim-config/vim .vim
```

On Windows:
(from Documents and Settings/{User})
```shell
mklink /J vimfiles vim-config\vim
mklink /H _vimrc vim-config\vimrc
```

[Vim-Plug](https://github.com/junegunn/vim-plug) is used to manage plugins.  You should run
```
:PlugInstall
```
inside of vim to perform the installation of plugins. Vim might complain about missing colorschemes before you do this step.


The [flake8](https://pypi.python.org/pypi/flake8) checker is used (via [syntastic](https://github.com/scrooloose/syntastic)) to check python code. You need to have it installed on your system for this to work.

On OS X (at least), neovim requires the neovim python package to support plugins like YouCompleteMe. install with 'pip install neovim'.
