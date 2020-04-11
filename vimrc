" ==========================================================
" Vundle
" ==========================================================
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'wincent/Command-T'

"Bundle 'Lokaltog/vim-easymotion'
Plugin 'easymotion/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'topfunky/PeepOpen-EditorSupport', {'rtp': 'vim-peepopen/'}
"Plugin 'klen/python-mode'
Bundle 'msanders/snipmate.vim'
Bundle 'nvie/vim-flake8'
" Plugin 'flazz/vim-colorschemes'
Bundle 'Lokaltog/vim-distinguished'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'AutoClose'
Bundle 'kchmck/vim-coffee-script'
Bundle 'digitaltoad/vim-jade.git'
Bundle 'scrooloose/syntastic'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'vim-scripts/taglist.vim'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'einars/js-beautify'
Bundle 'mileszs/ack.vim'
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
Plugin 'Chiel92/vim-autoformat'
Bundle 'groenewege/vim-less'
Plugin 'henrik/git-grep-vim'
Plugin 'henrik/vim-qargs'
Plugin 'mattn/emmet-vim'

" javascript Plugins
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'

Plugin 'kien/ctrlp.vim'
Plugin 'MattesGroeger/vim-bookmarks'

Plugin 'ternjs/tern_for_vim'
"Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'kien/rainbow_parentheses.vim'
"Plugin 'fatih/vim-go'
Plugin 'digitaltoad/vim-pug'
"Plugin 'Shougo/neocomplete.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'vim-perl/vim-perl'
Plugin 'kana/vim-fakeclip'
" SnipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
Plugin 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

""" Erlang Runtime
"Plugin 'vim-erlang/vim-erlang-runtime'
"Plugin 'vim-erlang/vim-erlang-compiler'
"Plugin 'vim-erlang/vim-erlang-omnicomplete'
"Plugin 'vim-erlang/vim-erlang-tags'
" Optional:
"Plugin 'honza/vim-snippets'
Plugin 'othree/yajs.vim'
Plugin 'othree/es.next.syntax.vim'

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
endif

call vundle#end()
filetype plugin indent on

" ==========================================================
" Shortcuts
" ==========================================================
" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

" Allow pasting blocks of code without indenting
set pastetoggle=<F4>

"Fix Shift+Tab
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i

nmap <Leader>t :TagbarToggle<CR>
nmap <Leader>N :NERDTreeToggle<CR>
nmap <Leader>i :IndentGuidesToggle<CR>
nmap <Leader>T :TlistToggle<CR>
":nmap <silent> <leader>d <Plug>DashSearch
"nmap <leader>d :GoDef<CR>
nnoremap <silent> <leader>h :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <leader>d :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <leader>r :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <leader>m :call LanguageClient_contextMenu()<CR>

" Let me save files with sudo
cmap w!! w !sudo tee % >/dev/null

let NERDTreeIgnore = ['\.pyc$']

set tw=0
set wm=0
set nowrap
set linebreak
set scrolloff=5 " Keep 5 lines below and above the cursor

" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set relativenumber
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
set showcmd

set colorcolumn=100

" don't bell or blink
"set noerrorbells
"set vb t_vb=


" don't outdent hashes
inoremap # #

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent
set mouse=a


set ls=2  "Always show status line"


set ruler

set hidden

set nolazyredraw
set showmatch
set encoding=utf8

set backspace=indent,eol,start

set nobackup
set noswapfile

" language en_US

set undodir=~/.vim_runtime/undodir
set undofile

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>.,trail:.,precedes:<,extends:>
set list

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

"""" Display
" colorscheme molokai
" set background=dark
"if has('gui_running')
"    set background=light
"else
"    set background=dark
"endif
"""if has("gui_running")
"    colorscheme desert
"    " Remove menu bar
"    set guioptions-=m
"    set guifont=Menlo:h14
"    "set guifont=Monaco:h14
"
"    " Remove toolbar
"    set guioptions-=T
"else
"    colorscheme zellner
"endif


" ===========================================================
" FileType specific changes
" ============================================================
" Javascript
au BufRead *.js set makeprg=jslint\ %
" Use tab to scroll through autocomplete menus
"autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
"autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"
autocmd filetype javascript set sw=2 ts=2 expandtab
let g:acp_completeoptPreview=1

" Mako/HTML
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2 setlocal ft=html
autocmd FileType html,xhtml,xml,css,coffee setlocal expandtab shiftwidth=2 tabstop=2

" Python
"au BufRead *.py compiler nose
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
au FileType python set foldmethod=indent foldlevel=99

" add hotkey for GitGrep
exe "nnoremap <leader>g :GitGrep "
" add hotkey for Ack
exe "nnoremap <leader>k :Ack "


" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0

" Run pyflake8
autocmd FileType python map <Leader>8 :call Flake8()<CR>
" Run when saving py files
autocmd BufWritePost *.py call Flake8()
" Ignore Errors
let g:flake8_ignore="E501,W293"

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif


if $COLORTERM == 'gnome-terminal'
   set t_Co=256
endif

" vim-indent-guides
let g:indent_guides_auto_colors = 0
""autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=white   ctermbg=3
""autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=lightgrey ctermbg=4
set ts=2 sw=2 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey


"" change current working directory and print out it afterwards
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>


"" set case insensitive search when try to opening files and directories
"set wildignorecase

"" highlight current line
set cursorline


map <c-e> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-e> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-e> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-e> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-e> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-e> :call CSSBeautify()<cr>

"noremap <F3> :Autoformat<CR><CR>
" or
"   autocmd FileType javascript noremap <buffer>  <c-f> :call
"   JsBeautify()<cr>
"     " for html
"       autocmd FileType html noremap <buffer> <c-f> :call
"       HtmlBeautify()<cr>
"         " for css or scss
"           autocmd FileType css noremap <buffer> <c-f> :call
"           CSSBeautify()<cr>"

" color scheme molokai
let g:molokai_original=1

" set 256 colors for vim
set t_Co=256
colorscheme molokai

" set no differences for tabs and normal whitespace (Good for reading, but bad
" for editing)
set nolist

" set ctag bin for plugin tagbar
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

" search with Ack for current word under cursor
:nnoremap <F3> :execute "Ack '<cWORD>' ."<cr>

" enable eslint in syntastic
let g:syntastic_javascript_checkers = ['jshint', 'eslint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces


" add for solve go-vim problem: 
" ref : https://github.com/fatih/vim-go/wiki/FAQ-Troubleshooting
set shell=/bin/sh

" vim-go settings
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_interfaces = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1
"let g:go_fmt_command = "gopls"
"let g:go_get_update = 0

" nerdtree toggle
map <C-n> :NERDTreeToggle<CR>

" set modifiable
set modifiable

" search over current word with ack and highlight it
function! g:TestFunc()
    let @/ = expand("<cword>")
    set hlsearch
endfunction
nmap <Leader>f :set nohlsearch\|:call g:TestFunc()\|:Ack <cword><CR>

" auto complete for neocomplete
let g:neocomplete#enable_at_startup = 1
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
  "let g:neocomplete#sources#omni#input_patterns = {}
"endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" gotags support for vim
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

set tags+=tags;/

" copy full file path to clipboard
nmap <Leader>cp :let @+=expand("%:p")<CR>
set clipboard=unnamed

"Golang settings
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>t <Plug>(go-test)

let g:LanguageClient_serverCommands = {
    \ 'go': ['go-langserver','-gocodecompletion', '-func-snippet-enabled=false'],
    \ }

