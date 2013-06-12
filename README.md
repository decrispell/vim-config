vim-config
==========

A set of configuration files and plugins for the vim text editor.  
Plugins are managed using "pathogen", and stored as git submodules in the "bundle" directory.

The easiest way to use this repository is to check out a local copy and create the appropriate links, e.g.  

<code>cd ~</code>  
<code>git clone --recursive https://github.com/decrispell/vim-config.git vim-config</code>  
<code>ln -s vim-config/vimrc .vimrc</code>  
<code>ln -s vim-config/gvimrc .gvimrc</code>  
<code>ln -s vim-config/vim .vim</code>  

In order to use the "YouCompleteMe" auto-completion plugin, you must build the plugin's plugin code.

Assuming you have a recent version of libclang (>= v2.5) installed on your system:

1) Make a temporary build directory

<code>cd ~</code>  
<code>mkdir ycm_build</code>  
<code>cd ycm_build</code>  

2) run CMake

<code>cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/cpp -DUSE_SYSTEM_LIBCLANG=ON</code>

3) build the plugin (the binary will be copied to the YouCompleteMe directory)

<code>make ycm_core</code>

