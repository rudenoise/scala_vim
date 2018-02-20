#!/bin/bash
set -e

mkdir ~/code
cd ~/code
git clone https://github.com/rudenoise/vimrc.git
cd vimrc
cp -r .vimrc ~/.vimrc
cd ~/

mkdir -p ~/.vim/autoload;
mkdir -p ~/.vim/plugin;
mkdir -p ~/.vim/ftplugin;

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone --depth=1 https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic

git clone https://github.com/ensime/ensime-vim.git ~/.vim/bundle/ensime-vim

git clone https://github.com/derekwyatt/vim-scala.git ~/.vim/bundle/vim-scala


wget https://raw.githubusercontent.com/kien/rainbow_parentheses.vim/master/autoload/rainbow_parentheses.vim -P $HOME/.vim/autoload/;
wget https://raw.github.com/kien/rainbow_parentheses.vim/master/plugin/rainbow_parentheses.vim -P $HOME/.vim/plugin/;
wget https://raw.githubusercontent.com/rudenoise/scala_nvim/master/scala.vim -P $HOME/.vim/ftplugin/

mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

cd ~/

rm vim.bash

rm -fr code

mv .bashrc .bashrc_orig

wget https://raw.githubusercontent.com/rudenoise/scala_vim/master/.bashrc 

cat .bashrc_orig >> .bashrc

rm .bashrc_orig
