我的vim配置文件(for golang and python dev)
详情看内部注释

vim目录为debian10编译的二进制,prefix目录/opt

<<<<<<< HEAD:README
```sh
# 推荐在docker下编译
apt build-dep vim
# 如果编译gvim
apt build-dep vim-gtk
=======
or

building vim from source(debian)：

```sh
sudo apt install libncurses5-dev \
libgtk2.0-dev libatk1.0-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
python3-dev ruby-dev lua5.2 liblua5.2-dev libperl-dev git
>>>>>>> 006451de7ac3289b78a573ce65ba106abb5fbfe8:README.md
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
<<<<<<< HEAD:README

# with gui
--enable-gui=gtk2 --with-x
=======
>>>>>>> 006451de7ac3289b78a573ce65ba106abb5fbfe8:README.md
```
