vim-config
==========

A set of configuration files and plugins for the vim text editor.
Plugins are managed using "pathogen", and stored as git submodules in the "bundle" directory.

The easiest way to use this repository is to check out a local copy and create the appropriate links, e.g.

```shell
cd ~
git clone --recursive https://github.com/decrispell/vim-config.git vim-config
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

In order to use the "YouCompleteMe" auto-completion plugin, you must build the plugin's plugin code.

```shell
cd vim/bundle/YouCompleteMe
./install.py --clang-completer
```

When pulling updates, be sure to update the submodules afterwards:
```shell
git pull
git submodule update --init --recursive
```
