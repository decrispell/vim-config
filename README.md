vim-config
==========

A set of configuration files and plugins for the vim text editor.
Plugins are managed using "pathogen", and stored as git submodules in the "bundle" directory.

The easiest way to use this repository is to check out a local copy and create the appropriate links, e.g.

<code>cd ~</code>
<code>git clone --recursive https://github.com/decrispell/vim-config.git vim-config</code>

On Linux/Mac:

<code>ln -s vim-config/vimrc .vimrc</code>
<code>ln -s vim-config/gvimrc .gvimrc</code>
<code>ln -s vim-config/vim .vim</code>

On Windows:
(from Documents and Settings/{User})
<code>mklink /J vimfiles vim-config\vim </code>
<code>mklink /H _vimrc vim-config\vimrc </code>


In order to use the "YouCompleteMe" auto-completion plugin, you must build the plugin's plugin code.

<code> cd vim/bundle/YouCompleteMe </code>
<code> ./install.py --clang-completer </code>

