"Misc settings {{{
" Use vim settings instead of the vi settings.
" Put this first, because it changes other options as a side effect.
set nocompatible                       
set shell=bash						" Vim expects posix-compliant shell	
set hidden                          " Hide buffer instead of destroying it when openning a new buffer
set encoding=utf-8                  " Sets how vim shall represent characters internally. Utf-8 is necessary for most flavors of Unicode.
set cryptmethod=blowfish2			" Use the best encryption method when writing crypted files
"}}}

"Plugin Installing {{{

" Brief help
" :call PluginInstallVundle	- lists configured plugins
" :PluginList				- lists configured plugins
" :PluginInstall			- installs plugins; 
"								append `!` to update or just :PluginUpdate
" :PluginSearch foo			- searches for foo; 
"								append `!` to refresh local cache
" :PluginClean				- confirms removal of unused plugins; 
"								append `!` to auto-approve removal
"								check once if we have vundle plugin istalled 

let g:has_plugin_vundle = isdirectory(expand("~/.vim/bundle/Vundle.vim/.git")) 
let g:has_plugin_vim_colors_solarized = isdirectory(expand("~/.vim/bundle/vim-colors-solarized/.git"))

" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim

if g:has_plugin_vundle
	" must be off before loading plugins
	filetype off
	
	" required
	call vundle#begin()

	" Solarized colorscheme. On GitHub.
	Plugin 'altercation/vim-colors-solarized'

	" File manager. On GitHub. 
	Plugin 'scrooloose/nerdtree'
	
	" Open file and go to line: vim hello.cpp:10. On GitHub.
	Plugin 'bogado/file-line'
	
	" Key mappings for cscope commands. GitHub.
	Plugin 'chazy/cscope_maps'
	
	call vundle#end()

	" turn on to activate filetype-speciffic settings read from plugins
	filetype plugin indent on
endif

function! PluginVundleInstall()
	if !g:has_plugin_vundle
		execute ':silent !mkdir -p ~/.vim/bundle'
		execute ':silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
	endif
endfunction
"}}}

"Colors {{{
let g:solarized_termcolors=16
syntax on    							" Enable syntax highlighting. 
set t_Co=16                             " Set vim to use 16

if g:has_plugin_vim_colors_solarized
    set background=dark                 " Use dark solarized theme by default
    colorscheme solarized
    call togglebg#map("<F5>")
endif
"}}}

"Leader Shortcuts {{{
" Set map leader to ',' and local mapleader to '\'
let mapleader=","
let maplocalleader="\\"

" jk is escape from insert mode
inoremap jk <esc>

" Edit and Load .vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk
"}}}

"UI Config {{{
set showcmd                             " Show command in the bottom bar
set showmode                            " Show vim insert mode
set cursorline                          " Highlite current line
set wildmenu                            " Visual autocomplete for command menu
set wildmode=longest:list,full          " First tab will complete to longest string and show the match list, 
                                        " then second tab will complete to first full match and open the wildmenu.
set wildignore=*.o,*~,*.pyc,*.lass		" Ignore compiled files
set visualbell                          " Visual bell instead of sound bell
set ruler                               " Show info about current line, column etc in the status bar
set rulerformat=%l,%c%V%=%P             " Show number of current line, column, virtual column and current offset in percent
set laststatus=2						" Set laststatus to 2 to always see a status line for each window

set number 								" Always show line numbers
set relativenumber						" Show relative to current line numbers 

" toggle relative numbering
nnoremap <leader>rn : call RelativeNumberToggle() <CR>
function! RelativeNumberToggle()
	if &relativenumber == 0
		set relativenumber
	else
		set norelativenumber
	endif
endfunction
"}}}

" Speed Optimization {{{
set lazyredraw                          " Redraw only when we need to.
set ttyfast                             " Indicates a fast terminal connection. 
"}}}

"Searching and highliting {{{
" Makes searches use normal regexes.
"nnoremap / /\v
"vnoremap / /\v

set ignorecase                          " Ignore case in search command
set smartcase                           " Inteligent case handling in search: ignore case if searching all in lowercase, 
                                        " but case sensitive when searching in mixed cases
"set gdefault                            " Applies substitutions globally on lines.
set incsearch                           " While typing a search command, show where the pattern, as it was typed so far, matches. 
set showmatch                           " Highlight matching [{()}]
set hlsearch                            " When there is a previous search pattern, highlight all its matches.

set path+=**                        " Allow recurcive file searching and completion

" Clear the search highliting
nnoremap <leader><space> :noh<cr>

" Make the tab key match bracket pairs.
nnoremap <tab> %
vnoremap <tab> %
"}}}

"Spaces & Tabs {{{
set tabstop=4						" A tab is 4 spaces
set softtabstop=4               			" A tab alos is 4 spaces when inserting it in insert mode
set expandtab                   			" Expand tabs by default (overloadable per file type later)
set shiftwidth=4                			" Number of spaces to use for autoindenting
set shiftround                  			" Use multiple of shiftwidth when indenting with '<' and '>'j
set smarttab                    			" insert tabs on the start of a line according to shiftwidth, not tabstop
set autoindent                  			" always set autoindenting on
set copyindent                  			" copy the previous indentation on autoindenting
set backspace=indent,eol,start  			" Allow backspacing over everything in insert mode.
"}}}

"Editing {{{
set pastetoggle=<F2>					" When in insert mode, press <F2> to switch to paste mode, 
										" this allows to paste mass data that won't be autoindented
set binary                              " Set binary mode to newer write final new line when aditig binary file

" Autoinsertion of different bocks
inoremap <leader>( ()<esc>i
inoremap <leader>[ []<esc>i
inoremap <leader>{ {}<esc>i
inoremap <leader>{{ {<esc>o}<esc>O<tab>
inoremap <leader>' ''<esc>i
inoremap <leader>" ""<esc>i
inoremap <leader>< <><esc>i

"Insert #include <> 
inoremap <leader>IN #include <><esc>i
"Insert #include ""
inoremap <leader>in #include ""<esc>i

" Insert if block
inoremap <leader>if if ()<cr>{<cr><cr>}<esc>3k$i

"}}} 

"Folding rules {{{ 
set foldenable                  			" enable folding 
set foldcolumn=2                			" add a fold column 
set foldmethod=marker           			" detect triple-{ style fold markers 
set foldlevelstart=99           			" start out with everything unfolded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo	" which commands trigger auto-unfold

function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('        ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
    return line . ' …' . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction
"set foldtext=MyFoldText()

" Mappings to easily toggle fold levels
nnoremap z0 :set foldlevel=0<cr>
nnoremap z1 :set foldlevel=1<cr>
nnoremap z2 :set foldlevel=2<cr>
nnoremap z3 :set foldlevel=3<cr>
nnoremap z4 :set foldlevel=4<cr>
nnoremap z5 :set foldlevel=5<cr>
"}}}

" Text wrapping {{{
set wrap					" Wrap lines longer than the width of the window
set colorcolumn=80

set textwidth=0		" set textwrap to 0 to disable text wrapping
" default vims format options are: tcq (auto-wrap text, autowrap comments, allow formating of comments with 'gq'
set formatoptions+=r " auto inserting the current comment leader on hitting ENTER
set formatoptions+=n " recognize numbered lists when formation text
set formatoptions+=1 " don't break a line after a one-letter word.
set formatoptions+=j " remove a comment leader when joining lines.
 
" toggle text wrapping
nnoremap <leader>tw : call TextWrapToggle() <CR>
function! TextWrapToggle()
	if &textwidth == 0
		set textwidth=79
	else
		set textwidth=0
	endif
endfunction
" }}}

" NERDTree Settings {{{
" Open/close file tree
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" }}}

" Cscope Settings {{{

function! CSRebuildIndex()
	execute ':silent !find $(pwd) -name "*.h" -or -name "*.c" -or -name "*.cpp"  > $(pwd)/cscope.files' 
	execute ':silent !find $(pwd) -name "*.java" >> $(pwd)/cscope.files'
	execute ':silent !cscope -R -b -q -k'
	execute ':cs add cscope.out'
	execute ':redraw!'
endfunction
