# vim


## install

```bash
git clone https://github.com/dongweifly/vim.git ~/.vim
mv ~/.vimrc ~/.vimrc.bak
ln -s ~/.vimrc ~/.vimrc 
```

Install vim plug, open vim and run 
```
: PlugInstall 

````

## 问题记录

1. COC相关的问题
    * coc插件是否必须都是TS/JS写的: 不一定。不过，如果您想使用 TS/JS 以外的语言来开发 coc 插件，您可能需要自己处理一些类型声明、适配、调试等问题，这可能会增加开发难度和时间。而且，TS/JS 本身就是前端开发的主流语言，使用它们可以更好地利用现有的资源和工具345。

    * COC 插件的路径: 默认数据安装在~/.config/coc/extension中。可通过let g:coc_data_home="/path/to/yours"来设置

2. clangd自动提示
    * clangd的启动vim唤起的吗，如果vim关掉了，clangd是否还存在。
    * 无法自动提示的原因是什么。

