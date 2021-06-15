" ==========================================================
" Vundle
" ==========================================================
set shell='/bin/sh'
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
"Bundle 'kchmck/vim-coffee-script'
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
"Plugin 'digitaltoad/vim-pug'
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'rizzatti/dash.vim'
"Plugin 'vim-perl/vim-perl'
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
"let g:rehash256 = 1

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


" coc.nvim
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"autocmd BufEnter *.go nmap <leader>cc  <Plug>(go-callers)
nmap <leader>cr <Plug>(coc-references)



" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" enable highlight current symbol on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
set termguicolors

" auto import for go filetype
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" set to highlighing NOTE: and HABA:
syntax keyword jsCommentTodo    contained TODO FIXME XXX TBD NOTE

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
nnoremap <C-l> <C-i>
