" Specify a directory for plugins
" " - For Neovim: ~/.local/share/nvim/plugged
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'tomasiser/vim-code-dark'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" 语法高亮
Plug 'tpope/vim-fugitive' 
" 语法检查
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'Chiel92/vim-autoformat'
Plug 'ycm-core/YouCompleteMe'
" 添加注释插件,默认快捷键为<leader>+cc/cu
Plug 'scrooloose/nerdcommenter'
Plug 'rust-lang/rust.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Initialize plugin system
call plug#end()

" rust file auto format
let g:rustfmt_autosave = 1

" rust language server
if executable('rls')
    au User lsp_setup call lsp#register_server({
	    \ 'name': 'rls',
	    \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
	    \ 'whitelist': ['rust'],
	    \ })
endif 

filetype plugin indent on

" 主题设置
" set t_Co=256
colorscheme codedark

" 记录光标位置(返回上次光标位置)
" Only do this part when compiled with support for autocommands.
if has("autocmd")
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!
" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END
else
set autoindent   " always set autoindenting on
endif " has("autocmd")
"END 记录光标位置

" 调整分割窗口大小快捷键
" nmap w= :resize +3<CR>
" nmap w- :resize -3<CR>
" nmap w, :vertical resize +3<CR>
" nmap w. :vertical resize -3<CR>

" 支持鼠标滚屏
set mouse=a

" 定义ycm触发器(2个字母后自动提示)
let g:ycm_semantic_triggers =  {
	\ 'python':['->', '.' , 're!\w{1}'],
	\ 'go':['->', '.' , 're!\w{1}'],
	\}

" set background=dark    " Setting dark mode
""" Hilight search and set numbers //搜索高亮设置
set hlsearch
highlight Search guibg=#af005f ctermbg=125
" split navigations 分屏幕快捷键
nnoremap <C-h> :split<return>
nnoremap <C-g> :vsplit<return>
"""" 搜索后取消高亮快捷键
nnoremap <esc> :noh<return>
set number

" 注释插件配置
" 注释符号后添加空格
let g:NERDSpaceDelims = 1
let g:NERDAltDelims_python= 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommenEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Airline configuration
" let g:airline_theme="luna"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" 文件管理器配置Nerdtree configuration
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']
let g:nerdtree_tabs_open_on_cosole_startup = 0
" 启动vim后自动打开NERDTree
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" 缓冲区文件切换Switching between buffers
" Set commands to switching between buffers
:nnoremap <Tab> :bnext!<CR>
:nnoremap <S-Tab> :bprevious!<CR>
:nnoremap <C-X> :bp<bar>sp<bar>bn<bar>bd<CR>

" File searchs 文件搜索快捷键
map <C-p> :Files<CR>

" Ale Configuration python语法检查
"""" Better formatting fo worp/ale
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%] [%...code...%]'
"""" Enable completion where available.
let g:ale_completion_enabled = 1
""" Customize linters that are turned on
let g:ale_linters = {
	\   'python': ['flake8'],
	\}
let g:ale_set_highlights = 0

" Fix keys
set backspace=2
" 忽略大小写搜索
set ignorecase

nmap <F8> :TagbarToggle<CR>
" python save and run
autocmd FileType python nnoremap <buffer> <F5> <Esc>:w<cr>:!python3 %<cr>

let g:SuperTabDefaultCompletionType = "context"

" python 自动格式化
" nnoremap <F2> :Autoformat<CR> "快捷键格式化
autocmd FileType python au BufWrite * :Autoformat  "保存自动格式化
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" 光标所在行列高亮
set cursorline
set cursorcolumn

" 插入模式和普通模式光标样式修改
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
