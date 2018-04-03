This is my ~/.vim dir
Installation
============

Clone the repo:
`git clone https://github.com/toozej/vimfiles.git ~/.vim`

Grab the plugin submodules:
`cd ~/.vim && git submodule init && git submodule update`


Make sure vim finds the vimrc file by either symlinking it:
`ln -s ~/.vim/vimrc ~/.vimrc`

or by sourcing it from  your own ~/.vimrc:
`source ~/.vim/vimrc`

Removal of submodules
=====================

Clone the repo:
`git clone https://github.com/toozej/vimfiles.git ~/.vim`

Grab the plugin submodules:
`cd ~/.vim`

Remove folder of submodule:
`rm -rf bundle/foldername && git rm -r bundle/foldername`

Initialize and update submodules:
`git submodule init && git submodule update`

Commit:
`git commit -m "removed somemodule"`

Addition of submodules
======================

Clone the repo:
`git clone https://github.com/toozej/vimfiles.git ~/.vim`

Grab the plugin submodules:
`cd ~/.vim && git submodule init`

Add submodule:
`git submodule add https://giturl.com/repo bundle/modulename`

Update submodules:
`git submodule update --init --recursive`

Commit:
`git commit -m "added somemodule"`
