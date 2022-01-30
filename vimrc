" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

set nocompatible              " be iMproved, required
filetype off                  " required


" Platform identification {
    silent function! OSX()
        return has('macunix')
    endfunction
    silent function! LINUX()
        return has('unix') && !has('macunix') && !has('win32unix')
    endfunction
    silent function! WINDOWS()
        return  (has('win16') || has('win32') || has('win64'))
    endfunction
" }


" ##################################################
"                   Vundle
" https://github.com/VundleVim/Vundle.vim
" 1. Install Vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" 2. Install/update plugins
" :PluginInstall
" ##################################################
" set the runtime path to include Vundle and initialize
if WINDOWS()
    set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
    call vundle#begin('$VIM/vimfiles/bundle/')
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-rmarkdown'

Plugin 'mbbill/fencview'

" Syntax highlighting, matching rules and mappings for the original Markdown
" and extensions.
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Vimwiki is a personal wiki for Vim
Plugin 'vimwiki/vimwiki'

" python auto-complete
" Plugin 'Valloric/YouCompleteMe'

Plugin 'vim-scripts/indentpython.vim'

" Plugin 'tmhedberg/SimpylFold'
" Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale' " 异步语法检查, 替代 syntastic
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/genutils'

" lookup file
" Plugin 'vim-scripts/lookupfile'
" default F5

" show buffer files
" Plugin 'jlanzarotta/bufexplorer'
" 1. <leader>be (normal open)
" 2. <leader>bt (toggle open / close)
" 3. <leader>bs (force horizontal split open)
" 4. <leader>bv (force vertical split open)

" manage buffer window, file list windows, tag list windows etc.
" Plugin 'vim-scripts/winmanager--Fox'
" use :WMToggle to toggle

" enhance terminal integration for vim
" Plugin 'wincent/terminus'

" vim session management plugin
" Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-session'

" NERDTree 的作用就是列出当前路径的目录树
Plugin 'scrooloose/nerdtree'
" use NERDTree open dir window
" Quick tag browser for the current file, a must have if you are using any kind of ctags like exuberant-tags.
Plugin 'majutsushi/tagbar'

" also look up file etc
" Plugin 'kien/ctrlp.vim'
" use <c-p> to trigger search bar

" python completion 太卡
" Plugin 'davidhalter/jedi-vim'
" usage for jedi-vim
" 1. need install jedi module: pip install jedi
" 2. default completion trigger by <Ctrl-Space>
" 3. useful functions
"   Go to definition (or assignment) (go to definition 会递归地寻找定义)
"   g:jedi#goto_command  <leader>d
"   Show pydoc documentation
"   g:jedi#documentation_command <K>
"   Show usages of a name
"   g:jedi#usages_command

" Supertab is a vim plugin which allows you to use <Tab> for all your insert completion needs (:help ins-completion)
Plugin 'ervandew/supertab'

" deprecated
" Plugin 'jakedouglas/exuberant-ctags'

" 开闭
" Plugin 'Townk/vim-autoclose'
Plugin 'jiangmiao/auto-pairs'

" Plugin 'Shougo/neocomplete.vim'

" golden-ratio resizing automatically the windows you are working on to the size specified in the 'Golden Ratio'
" Plugin 'roman/golden-ratio'

" Light & Dark color schemes for terminal and graphic Vim awesome editor
Plugin 'NLKNguyen/papercolor-theme'

" Provides syntax highlighting for generic log files in VIM
" set filetype=log
Plugin 'mtdl9/vim-log-highlighting'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" ##################################################


set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" setting for diff two files
set diffopt+=vertical

" When you are displaying more than one window, you can set the scrollbind option in each window so they scroll together.
" set scrollbind

if LINUX()
    set term=xterm
    set ttytype=xterm
endif

" show the scrollbars other than Menubar and Toolbar
set guioptions='rL'
" set guioptions=''

" Maximize the window of Vim
if has('gui_running') && has("win32")
   au GUIEnter * simalt ~x
endif

" Use color scheme
colo desert " desertEx chela_light tolerable papayawhip winter peachpuff elflord
" colo xemacs
" colo macvim-light
" colo mango
" colo wwdc17
" let g:wwdc17_frame_color = 10 " choose frame color
" let g:wwdc17_high_contrast = 1 " Increase contrast
" let g:wwdc17_term_italics = 1 " Enable italics in the terminal
" let g:wwdc17_term_trans_bg = 0 " Use a transparent background in the terminal

" set t_Co=256   " This is may or may not needed.
" set background=dark
" colorscheme PaperColor
" show the line number
set number

" to disable alt key in windows
set winaltkeys=no

" choose strong method to encrypt file
set cryptmethod=blowfish2

" use relative number
" set relativenumber

" let the search more comfortable, if there exists an upper letter, it's case
" sensitive, otherwise not
set ignorecase
set smartcase

" when bracket is  inserted, briefly jump to the match
set showmatch

" let replacement always be global
set gdefault

" tell vim to creat a undo file so that undo info will be stored
" set undofile

" wraping is on in default
set wrap

" switch wrap and show horizontal bar
function! Wrap()
    if &wrap
        set nowrap
        if !LINUX()
            set guioptions+=b
        endif
    else
        set wrap
        if !LINUX()
            set guioptions-=b
        endif
    endif
endfunction

nnoremap <silent> <f5> :call Wrap()<CR>


" show the column N
set colorcolumn=

" autowrite all file when focus is lost
" autocmd FocusLost * :wa

" show working (current) line
" set cursorline

" when use <Tab> completion, ignore the file extension below
set suffixes=.out,.synctex,.ion,.pdf,.bak,~,.o,.h,.info,.swp,.aux,.bbl,.blg,.dvi,.lof,.log,.lot,.ps,.toc

"make it so that jk, instead of navigating across actual lines, allows you
"to scroll up/down visual lines... so if you have a really long wrapped line,
"you can actually scroll down through it
" nnoremap j gj
" nnoremap k gk

" let the search pattern be consistent with Perl/Python
" nnoremap / /\v
" vnoremap / /\v

" replace the match character % with Tab key
nnoremap <tab> %
vnoremap <tab> %

" Be certain these two lines have no trailing spaces
" Rehighlight visual block after left/right shift
" vnoremap < <gv
" vnoremap > >gv

" make vim wrap long lines at a character in 'breakat' rather than the last char that fits on the screen
set linebreak

set incsearch "DO highlight while typing search characters
set winwidth=80 " minimal window height and width when switching. see also

"cycle through open buffer windows, whether split horizontally or vertically,
"similar to alt-tab. also see set wiw and set wh for more usefulness, below.
nnoremap <C-N> <C-W>w

set expandtab " expand tab chars to spaces by default
set tabstop=4 " tabspacing
set softtabstop=4 "
set sta
set shiftwidth=4
" :h winminwidth
set softtabstop=4 " set indent, let <tab>=4 space
" completion
" set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" switch on the spell check
" setlocal spell spelllang=en_us
set nospell

" set default directory
" cd d:\downloads\

" set the gui font
set guifont=Courier_New:h11:cANSI
" set guifont=Rod:h16:b:cANSI
" set guifont=Anonymous:h12:cANSI
" set guifont=Consolas\ 13
" set guifont=Consolas:13:cANSI
" set guifont=Anonymice_Powerline:h13:cANSI
" set guifont=FixedsysTTF:h14:cANSI

" let the number big enough will set the cursor fixed in the middle vertically
" set scrolloff=100

" map Ctrl-S as :w
imap <C-S> <ESC>:w<CR>a
nmap <C-S> :w<CR>
map <C-S> :w<CR>

" Under Windows, the * and + registers are equivalent.
" Generally on Linux, + and * are different:
"   + corresponds to the desktop clipboard (XA_SECONDARY),
"       that is accessed using CTRL-C, CTRL-X, and CTRL-V
"   * corresponds to the X11 primary selection (XA_PRIMARY),
"       which stores the mouse selection and is pasted using the middle mouse button in most applications.

" insert mode, Ctrl-v to paste the text in clipboard
imap <C-V> <ESC>"+pa
" visual mode, Ctrl-c to copy the text to clipboard
vmap <C-c> "+y

" insert mode, Ctrl-z means 'undo'
imap <C-z> <ESC>ua

" set file encoded without bomb
set nobomb

set list listchars=tab:>-

" Use UTF-8 as default encoding scheme
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gb18030,utf-16,big5,gbk,gb2312,big5,euc-jp,eux-kr,cp936

" close "fencvim.vim" aurodetect
let g:fencview_autodetect=1
let g:vimim_do_search=1
map <F2> :FencView<cr>

"Set mapleader
let mapleader = ","

"Fast reloading of the .vimrc
" map <silent> <leader>ss :source $MYVIMRC<cr>
"Fast editing of .vimrc
map <silent> <leader>ee :e $MYVIMRC<cr>

" clear search highlight
nnoremap <leader><space> :noh<cr>

" new vertical window
nnoremap <leader>v <c-w>v<c-w>l

" reselect the text just pasted
nnoremap <leader>p V']

nnoremap <leader>m :set foldmethod=marker<cr>

" let ctrl-q to comment lines selected with %%
" vnoremap <C-q> :s/^/%%/<cr>

" search visually selected text
" vnoremap // y/<C-R>"<CR>
vnoremap // y/\V<C-R>"<CR>

"When .vimrc is edited, reload it
autocmd! bufwritepost _vimrc source $MYVIMRC

" set autowriteall

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" if has("vms")
"   set nobackup    " do not keep a backup file, use versions instead
" else
"   set backup    " keep a backup file
" endif

" set backupdir=~/Documents/backup_file,.,/tmp

" set modifiable    " default the setting is on
" set writebackup
" set patchmode=.orig

" display incomplete commands in the lower right corner of the window
set showcmd

set history=50    " keep 30 lines of command line history
set ruler    " show the cursor position all the time
set showmode    "
" While typing a search command, show where the pattern, as it was typed so far, matches.
set incsearch

" setting for taglist plugin
set tags=tags;
" set autochdir

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
"if has('mouse')
"  set mouse=a
"endif
set mousehide

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin on
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " set always nobomb even open files with bomb
  autocmd BufReadPost setlocal nobomb


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

  set autoindent    " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

set ff=unix

" disable bell, silent mode
set belloff=all

" setting for statusline
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor
hi User1 guifg=#eea040 guibg=#555555
hi User2 guifg=#dd3333 guibg=#555555
hi User3 guifg=#ff66ff guibg=#555555
hi User4 guifg=#a0ee40 guibg=#555555
hi User5 guifg=#eeee40 guibg=#555555
" let statusline appears all the time
set laststatus=2

" auto expand to current timestamp
" iab xxxdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iab xxxdate <c-r>=strftime("%Y-%m-%d %a")<cr>

" set dictionary location
" set dictionary+=d:\\profiles\\Vim\\.dic.vim

" viminfo 文件目录
" set viminfo+=d:\\profiles\\Vim\\viminfo

" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
" 在终端上用vim复制带括号的内容的时候取消自动缩进
" 常规解法是在 set paste 复制结束后 set nopaste
" let &t_SI .= "\<Esc>[?2004h"
" let &t_EI .= "\<Esc>[?2004l"
"
" inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
"
" function! XTermPasteBegin()
"   set pastetoggle=<Esc>[201~
"   set paste
"   return ""
" endfunction


" Use the below highlight group when displaying bad whitespace and TAB is desired.
highlight BadWhitespace ctermbg=red guibg=red
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile * match BadWhitespace /\s\+$/


" #######################################################################
" settings for latex-suite
" #######################################################################

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" remap the <S-F-1> to <S-F-4> keys to insert $$,eqnarray*,eqnarray,tabular
" envrionments
let g:Tex_HotKeyMappings = '\\[,align*,eqnarray,proof'

" settings to let the environment expand not like the default settings
let g:Tex_Env_theorem = "\\begin{theorem}\<Tab>\\label{<++>} <++>\<CR><++>\<CR>\\end{theorem}\<CR><++>"
let g:Tex_Evn_array = "\\begin{array}{<++>}\<CR><++>\<CR>\\end{array}\<CR><++>"

" setting for which error warning will be ignored after compiling
" the 8th is made by me, to ignore some font Chinese font size uncompatible
let g:Tex_IgnoredWarnings =
            \"Underfull\n".
            \"Overfull\n".
            \"specifier changed to\n".
            \"You have requested\n".
            \"Missing number, treated as zero.\n".
            \"There were undefined references\n"
            \"Citation %.%# undefined"
            \'LaTeX Font Warning:'
let g:Tex_IgnoreLevel = 8

" let tlist_tex_settings='latex;b:bibitem;c:command;e:environment;l:label'
" let tlist_bib_settings='bibtex;a:article;b:book;m:misc;p:part;s:string;t:thesis'

" remap some environments
"
" %%% let g:Tex_Env_$$ = "$$\<CR><++>\<CR>$$\<CR><++>"
" %%% $$ environment can't be changed like this, so I changes the line
" %%% below of file $VIM/vimfile/ftplugin/latex-suite/envmacros.vim
"
" %%% elseif a:env == '$$'
" %%%   return IMAP_PutTextWithMovement('$$<++>$$')
"
" %%% to the line
"
" %%% elseif a:env == '$$'
" %%%  return IMAP_PutTextWithMovement("$$\<CR><++>\<CR>$$\<CR><++>")

" remap the default key <C-J> to <A-space> for jump to next placeholder
imap <A-space> <Plug>IMAP_JumpForward

" #######################################################################
" settings for vimwiki
" #######################################################################
let wiki_1 = {}
if WINDOWS()
    let wiki_1.path = 'd:\ztx\vimwiki\'
    let wiki_1.path_html = 'd:\ztx\vimwiki\html\'
else
    let wiki_1.path = '~\ztx\vimwiki\'
    let wiki_1.path_html = '~\ztx\vimwiki\html\'
endif

let wiki_2 = {}
let wiki_2.ext = '.md'
let wiki_2.syntax = 'markdown'
if WINDOWS()
    let wiki_2.path = 'd:\ztx\markdown\'
else
    let wiki_2.path = '~\ztx\markdown\'
endif

let wiki_2.index = 'index'

let g:vimwiki_list = [wiki_1, wiki_2]

let g:vimwiki_use_mouse = 1
let g:vimwiki_camel_case = 0

" #######################################################################
" setting for compiling c++ file
" #######################################################################

autocmd FileType cpp map <F5> <Esc>:w!<CR>:!compile_cpp.bat %<CR>

" #######################################################################
" setting for NERDTree
" #######################################################################

" 启动vim自动打开NERDTree
" autocmd vimenter * NERDTree
" 打开新的buffer时自动定位到编辑窗口
" autocmd VimEnter * wincmd p
" 关闭vim时，如果打开的文件除了NERDTree没有其他文件时，它自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI=1
" 在新 tab 页打开文件
let NERDTreeMapOpenInTab='\r'
" F3 Toggle NerdTree
map <F3> :NERDTreeToggle<CR>
map <F4> :TagbarToggle<CR>
let g:tagbar_sort = 0
" swap 文件写入磁盘的间隔时间, 默认4000milliseconds, 调小可以降低tagbar跳转延迟
" 频繁读写可能会降低磁盘的使用寿命
set updatetime=200

" #######################################################################
" setting for others
" #######################################################################
" MySQL
" let g:dbext_default_profile_mysqlMaster='type=MYSQL:user=root:passwd=passwd:dbname=analysis'
" let g:dbext_default_profile = 'mysqlMaster'

" for .hql files
au BufNewFile,BufRead *.hql set filetype=sql

" vim-markdown
let g:vim_markdown_frontmatter=1
let g:vim_markdown_folding_disabled=1

" Vim-Supertab Configuration
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" Elixir Tagbar Configuration
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
\ }

" 解决windows下 menu 乱码的问题, 要放到vimrc文件最后
if WINDOWS()
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif
