我的vim配置文件(for golang and python dev)
vimrc_minial为精简版，仅包含ycm和主题
详情看内部注释

vim目录为debian10编译的二进制,prefix目录/opt

```sh
# 推荐在docker下编译
apt build-dep vim
# 如果编译gvim
apt build-dep vim-gtk
```

```sh
git clone https://github.com/vim/vim.git

cd vim

./configure --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=$(python3-config --configdir) \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-cscope \
            --prefix=/opt

# with gui
--enable-gui=gtk2 --with-x
```
