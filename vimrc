" Misc settings {{{
	" Use vim settings instead of the vi settings.
	" Put this first, because it changes other options as a side effect.
	set nocompatible                       
	set shell=bash						" Vim expects posix-compliant shell	
	set hidden                          " Hide buffer instead of destroying it when openning a new buffer
	set encoding=utf-8                  " Sets how vim shall represent characters internally. Utf-8 is necessary for most flavors of Unicode.
	set cryptmethod=blowfish2			" Use the best encryption method when writing crypted files
	set history=200						" remember 200 commands in history instead of 12 by default

	" set mouse=a " allo mosue in all modes

	set spell spelllang=en_us

	set noswapfile " no swap files

	set autoread " autoread buffer of changed outside of vim files

	" let g:netrw_bunner = 0 "no header spam in directory mode
	" let g:netrw_liststype = 3 "tree style

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
	let g:has_plugin_nerdtree = isdirectory(expand("~/.vim/bundle/nerdtree/.git")) 
	let g:has_plugin_vim_commentary = isdirectory(expand("~/.vim/bundle/vim-commentary/.git")) 
	let g:has_plugin_syntastic = isdirectory(expand("~/.vim/bundle/Vundle.vim/syntax/"))

	" set the runtime path to include Vundle and initialize
	set runtimepath+=~/.vim/bundle/Vundle.vim

	if g:has_plugin_vundle
		" must be off before loading plugins
		filetype off

		" required
		call vundle#begin()

		" Solarized colorscheme. On GitHub.
		Plugin 'altercation/vim-colors-solarized'

		" commenting code
		Plugin 'tpope/vim-commentary'

		" File manager. On GitHub. 
		Plugin 'scrooloose/nerdtree'

		" A plugin that show the current file on NERDtree
		" Plugin 'unkiwii/vim-nerdtree-sync'

		" Open file and go to line: vim hello.cpp:10. On GitHub.
		Plugin 'bogado/file-line'

		" Key mappings for cscope commands. GitHub.
		"Plugin 'chazy/cscope_maps'

		" PlantUML syntax
		Plugin 'aklt/plantuml-syntax'

		" all about "surroundings": parentheses, brackets, quotes, XML tags, and more. 
		Plugin 'tpope/vim-surround'

		" remaps . to repeat not only native commands
		Plugin 'tpope/vim-repeat'

		" Git wrapper
		Plugin 'tpope/vim-fugitive'

		" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks 
		Plugin 'airblade/vim-gitgutter'

		" source code browser
		Plugin 'vim-scripts/taglist.vim'

		" A syntax checking plugin for Vim which runs files through external syntax checkers
		Plugin 'vim-syntastic/syntastic'

		" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
		Plugin 'ctrlpvim/ctrlp.vim'

		" swtich between source files and header files
		Plugin 'vim-scripts/a.vim'

		" Clang formatter plugin
		Plugin 'rhysd/vim-clang-format'

		" Clang C++ complete plugin
		Plugin 'Rip-Rip/clang_complete'

		" Plugin for defining custom user's operators
		Plugin 'kana/vim-operator-user'

		" Pluging for Racket functional lang
		Plugin 'wlangstroth/vim-racket'

		" Racket docs and completion
		Plugin 'MicahElliott/vrod'

		" Ack search tool from Vim 
		Plugin 'mileszs/ack.vim'

		" A filetype plugin for gprof output files (GNU profiler)
		Plugin 'vim-scripts/gprof.vim'

		" Toggle between one window and multi-window
		Plugin 'itspriddle/ZoomWin'

		" A library plugin for Vim to define your own text objects
		Plugin 'kana/vim-textobj-user'

		" Provide text objects (ae and ie) to select the entire buffer
		Plugin 'kana/vim-textobj-entire'

		" Restores iFocusGained and FocusLost autocommand events when using vim inside Tmux
		Plugin 'tmux-plugins/vim-tmux-focus-events'

		" vim plugin for tmux.conf: proper syntax highlighting, commening etc 
		Plugin 'tmux-plugins/vim-tmux'

		" seamless integration for vim and tmux's clipboard
		Plugin 'roxma/vim-tmux-clipboard'

		" Golang support
		Plugin 'fatih/vim-go'

		" Vim terminal debugging for python (at least for now) 
		Plugin 'epheien/termdbg'

		" Lib that provides An Interface to WEB APIs for other plugins
		Plugin 'mattn/webapi-vim'

		" Provides Rust file detection, formatting etc., depends on webapi-vim
		Plugin 'rust-lang/rust.vim'

		" Provides powerline support for status line
		Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
		" Plugin 'powerline/powerline'

		" Status line for vim like powerline
		" Plugin 'vim-airline/vim-airline'
		" Plugin 'vim-airline/vim-airline-themes'

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

" Commentary settings {{{"
	if g:has_plugin_vim_commentary
		autocmd FileType h,hpp,c,cpp,cs,java setlocal commentstring=//\ %s
	endif
"}}}"

" taglist plugin  settings {{{"
	let g:Tlist_Use_Right_Window   = 1
"}}}"

"Colors {{{
	let g:solarized_termcolors=16
	let g:solarized_diffmode="high"			" Set high visibility for diff mode
	syntax on    							" Enable syntax highlighting. 
	set t_Co=16                             " Set vim to use 16

	if g:has_plugin_vim_colors_solarized
		set background=dark                 " Use dark solarized theme by default
		colorscheme solarized
		call togglebg#map("<F5>")
	endif
"}}}

" Syntastic settings {{{"
	if g:has_plugin_syntastic
		" set statusline+=%#warningmsg#
		" set statusline+=%{SyntasticStatuslineFlag()}
		" set statusline+=%*

		let g:syntastic_always_populate_loc_list = 1
		" let g:syntastic_auto_loc_list = 1
		let g:syntastic_auto_loc_list = 0
		" let g:syntastic_check_on_open = 1
		let g:syntastic_check_on_open = 0
		let g:syntastic_check_on_wq = 0


		let g:syntastic_cpp_config_file = '.syntastic-cpp-gcc'
		let g:syntastic_cpp_compiler = "g++"
		let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"

	endif
"}}}"

" Key Shortcuts {{{
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

	" Maximize current window
	" nnoremap <C-W>z :tab sp<CR>

	" Treat long lines as break lines (useful when moving around in them)
	" nnoremap j gj
	" nnoremap k gk

	" Allow saving of files as sudo when I forgot to start vim using sudo.
	cmap w!! w !sudo tee > /dev/null %

	" In command line mode use <up>/<down> commands for history
	cnoremap <C-p> <Up>
	cnoremap <C-n> <Down>
"}}}

"UI Config {{{
	set showcmd                             " Show command in the bottom bar
	set showmode                            " Show vim insert mode
	" set cursorline                          " Highlite current line
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
	" set hlsearch                            " When there is a previous search pattern, highlight all its matches.

	set path+=**                        " Allow recurcive file searching and completion

	" Clear the search highliting
	nnoremap <leader><space> :noh<cr>

	" Make the tab key match bracket pairs.
	" nnoremap <tab> %
	" vnoremap <tab> %
"}}}

"Spaces & Tabs {{{
	set tabstop=4					" A tab is 4 spaces
	set softtabstop=4        		" A tab alos is 4 spaces when inserting it in insert mode
	set expandtab              		" Expand tabs by default (overloadable per file type later)
	set shiftwidth=4          		" Number of spaces to use for autoindenting
	set shiftround            		" Use multiple of shiftwidth when indenting with '<' and '>'j
	set smarttab					" insert tabs on the start of a line according to shiftwidth, not tabstop
	set autoindent             		" always set autoindenting on
	set copyindent             		" copy the previous indentation on autoindenting
	set backspace=indent,eol,start 	" Allow backspacing over everything in insert mode.

	" Only do this part when compiled with support for autocommands.
	if has("autocmd")
		" Use filetype detection and file-based automatic indenting.
		filetype plugin indent on

		" Use actual tab chars in Makefiles.
		autocmd FileType make set tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab
		" Use chars in c/cpp.
		autocmd FileType h,c,cpp,objc, set expandtab ts=4 sw=4 ai

		" FUSE automounts for archives
		autocmd FileType *.zip,*.jar,*.war,*.ear FUSE_MOUNT|fuse-zip %SOURCE_FILE %DESTINATION_DIR

		" FUSE automounts for ssh
		autocmd FileType *.ssh FUSE_MOUNT2|sshfs %PARAM %DESTINATION_DIR

	endif

"}}}

"Editing {{{
	set pastetoggle=<F3>					" When in insert mode, press <F2> to switch to paste mode, 
	" this allows to paste mass data that won't be autoindented
	set binary                              " Set binary mode to newer write final new line when aditig binary file

	" Autoinsertion of different bocks
	inoremap <leader>( ()<esc>i
	inoremap <leader>[ []<esc>i
	inoremap <leader>{ {}<esc>i
	inoremap <leader>{{ {<esc>o}<esc>O
	inoremap <leader>' ''<esc>i
	inoremap <leader>" ""<esc>i
	inoremap <leader>< <><esc>i

	"Insert #include <> 
	inoremap <leader>IN #include <><esc>i
	"Insert #include ""
	inoremap <leader>in #include ""<esc>i

	" Insert if block
	inoremap <leader>if if ()<esc>mmo{<cr>}<esc>`m$i
	" Insert if/else block
	inoremap <leader>ife if ()<esc>mmo{<cr>}<cr>else<cr>{<cr>}<esc>`m$i

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
	" set wrap					" Wrap lines longer than the width of the window
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
	if g:has_plugin_nerdtree
		" Open/close file tree
		nnoremap <leader>nt :NERDTreeToggle<CR>
		nnoremap <leader>nf :NERDTreeFind <CR> zz :wincmd p <CR> 

		let g:NERDTreeDirArrowExpandable = '▸'
		let g:NERDTreeDirArrowCollapsible = '▾'
		let g:NERDTreeShowHidden=1
		let g:NERDTreeHighlightCursorline = 1
		let g:NERDTreeMouseMode=3

		" Open NERDTree automatically when vim starts up on opening a directory
		autocmd StdinReadPre * let s:std_in=1
		autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif
	endif
" }}}

" Cscope Settings {{{

	" The following maps all invoke one of the following cscope search types:
	" prefixes
	"	CTRL-\ - result will be displayed in the current window.
	"	CTRL-@ - result will be displayed in horizontally splitted window
	"	CTRL-@@ - result will be displayed in vertically splitted window
	"
	"   's'   symbol: find all references to the token under cursor
	"   'g'   global: find global definition(s) of the token under cursor
	"   'c'   calls:  find all calls to the function name under cursor
	"   't'   text:   find all instances of the text under cursor
	"   'e'   egrep:  egrep search for the word under cursor
	"   'f'   file:   open the filename under cursor
	"   'i'   includes: find files that include the filename under cursor
	"   'd'   called: find functions that function under cursor calls

	function! RebuildIndexes()
		" cscope files and tags
		execute ':silent !find -L $(pwd) -name "*.h" -or -name "*.c" -or -name "*.cpp" > $(pwd)/cscope.files' 
		execute ':silent !find -L $(pwd) -name "*.java" >> $(pwd)/cscope.files'
		execute ':silent !cscope -R -b -q -k'
		execute ':cs add cscope.out'

		" ctags index
		execute ':silent !ctags -R $(pwd)'

		" refresh window
		execute ':redraw!'
	endfunction
" }}}

" Clang-format Settings {{{

	" automatically detects the style file (.clang-format or _clang-format) 
	let g:clang_format#detect_style_file = 1
	" 0 - do not apply formatting if the style file is not found
	let g:clang_format#enable_fallback_style = 0
	" format on save
	let g:clang_format#auto_format = 1 

	" map to <Leader>cf in C++ code
	autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf
	" :<C-u>ClangFormat<CR>
	autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
	" if you install vim-operator-user
	autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
	" Toggle auto formatting:
	nmap <Leader>C :ClangFormatAutoToggle<CR>

" }}}

" Clang-complete settings {{{
" path to directory where library can be found
"let g:clang_library_path='/usr/lib/llvm-3.8/lib/'
let g:clang_library_path='/usr/lib/x86_64-linux-gnu/libclang-3.8.so.1'

" }}}

" Rust Settings {{{
	let g:rustfmt_autosave = 1
" }}}

" Spell checker {{{
autocmd FileType md,txt setlocal spell spelllang=en_us

"  }}}
