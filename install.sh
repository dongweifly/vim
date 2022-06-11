git pull https://github.com/dongweifly/vim.git ~/.vim

if [[ -f ~/.vimrc ]]; then
    mv ~/.vimrc ~/.vimrc.back
fi

cd ~/.vim && ln -s vimrc ../vimrc

