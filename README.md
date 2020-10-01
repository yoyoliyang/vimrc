我的vim配置文件(for golang and python dev)
详情看内部注释

vim目录为debian10编译的二进制,prefix目录/opt

or

building vim from soure(debian)：

```sh
sudo apt install libncurses5-dev \
libgtk2.0-dev libatk1.0-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
python3-dev ruby-dev lua5.2 liblua5.2-dev libperl-dev git
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
```
