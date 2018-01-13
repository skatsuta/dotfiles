"=========================================
" System
"=========================================
scriptencoding utf-8
set fileencodings=utf-8
set fileformat=unix
" Change the leader key to ','
let mapleader=','
" Enable to keep remembering undos even if Vim reloads or restarts
set undofile
" Do not show warnings when opening a new buffer from one that is not saved
set hidden
" Do not insert a whitespace when joining Japanese sentences
set formatoptions+=mM
" Enable backspace key to delete indents and line breaks
set backspace=indent,eol,start
" Enable the use of the mouse
set mouse=a
" Move cursor to the last position when a file is open
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END



"=========================================
" Search
"=========================================
" Ignore the case of normal letters
set ignorecase
" Enable case-sensitive only if a query contains both uppercase and lowercase
set smartcase
" Disable highlighting for search
set nohlsearch
" 'internal' means setting vimgrep as a default grep command
set grepprg=internal
" Cause the Quickfix window to open after any grep invocation
autocmd QuickFixCmdPost *grep* cwindow


"=========================================
" Display Options
"=========================================
" Any action that is not typed will not cause the screen to redraw
set lazyredraw
" Set the width of Asian characters to double size
set ambiwidth=double
" Show line number
set number
" Time to show the matching paren ('noshowmatch': not display)
set showmatch
" Set the number of whitespaces that a <Tab> in the file counts for
set tabstop=2 softtabstop=0 shiftwidth=2
" The title of the window will be set to the value of a filename
set title
" Show special characters
set listchars=tab:»\ ,trail:~
" Expand tabs into whitespaces (noexpandtab: no expanding)
set expandtab
" Don't extract tabs in Go file
autocmd BufRead *.go set noexpandtab
" Highlight the column
set colorcolumn=100
" Show Zenkaku spaces
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
  silent! match ZenkakuSpace /　/
endfunction
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd VimEnter,BufEnter * call ZenkakuSpace()
  augroup END
endif



"=========================================
" Syntax Highlighting
"=========================================
" Highlight .envrc as well as shell script
autocmd BufNewFile,BufRead .envrc set filetype=sh


"=========================================
" Status Line
"=========================================
" Format: file name (file path)     [Git(branch)][+][vim][file encoding][line ending][row, column]
" Ref: http://hail2u.net/blog/software/optimize-vim-statusline.html
set statusline=%{expand('%:p:t')}\ %<\(%{expand('%:p:h')}\)%=\ %{fugitive#statusline()}%m%r%y%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}[%3l,%3c]


"=========================================
" Key Mappings
"=========================================
" Open foldings by l
if has('folding')
  nnoremap <expr> l foldlevel(line('.')) ? "\<Right>zo" : "\<Right>"
endif
" Use Ctrl-S for saving, also in insert mode
noremap  <C-S> :update<CR>
inoremap <C-S> <C-O>:update<CR>
vnoremap <C-S> <C-C>:update<CR>


"=========================================
" Plugins
"=========================================
call plug#begin('~/.vim/plugged')

"========== General ==========
" Unite and create user interfaces.
Plug 'Shougo/unite.vim'
" MRU plugin includes unite.vim MRU sources
Plug 'Shougo/neomru.vim'
" Saves yank history includes unite.vim history/yank source.
Plug 'Shougo/neoyank.vim'
" Vim plugin for intensely orgasmic commenting
Plug 'scrooloose/nerdcommenter'
" Git wrapper
Plug 'tpope/vim-fugitive'
" Syntax checking hacks for vim
Plug 'scrooloose/syntastic'
" Provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'Raimondi/delimitMate'
" " Next generation completion framework
" Plug 'Shougo/neocomplete.vim'
" " Powerful shell implemented by vim.
" Plug 'Shougo/vimshell.vim'
" " neo-snippet plugin contains neocomplcache snippets source
" Plug 'Shougo/neosnippet'
" " The standard snippets repository for neosnippet
" Plug 'Shougo/neosnippet-snippets'
" " Vim-SnipMate defalut snippets
" Plug 'skatsuta/vim-snippets'
" " Interactive command execution in Vim.
" Plug 'Shougo/vimproc.vim'
" " Vim motions on speed!
" Plug 'Lokaltog/vim-easymotion'
" " Provides support for expanding abbreviations similar to emmet.
" Plug 'mattn/emmet-vim'
" " Run commands quickly.
" Plug 'thinca/vim-quickrun'
" " A Vim plugin for visually displaying indent levels in code
" Plug 'nathanaelkane/vim-indent-guides'
" " Monokai theme
" Plug 'tomasr/molokai'
" " Alpaca
" Plug 'alpaca-tc/alpaca_powertabline'
" " Powerline is a statusline plugin for vim, and provides statuslines and prompts
" " for several other applications
" Plug 'Lokaltog/powerline'
" " Ctags generator for Vim
" Plug 'szw/vim-tags'
" " Vim plugin that displays tags in a window, ordered by scope
" Plug 'majutsushi/tagbar'
" " surround.vim: quoting/parenthesizing made simple
" Plug 'tpope/vim-surround'
" " Search Dash.app from Vim
" Plug 'rizzatti/dash.vim'
" " Vim plugin for the_silver_searcher, 'ag', a replacement for the Perl module / CLI script 'ack'
" Plug 'rking/ag.vim'
" " Wisely add 'end' in Ruby, endfunction/endif/more in Vim script, etc
" Plug 'tpope/vim-endwise'
" " A fast, as-you-type, fuzzy-search code completion engine for Vim
" "Plug 'Valloric/YouCompleteMe'
" " Easily search for, substitute, and abbreviate multiple variants of a word
" Plug 'tpope/vim-abolish'
" " A Vim wrapper for running tests on different granularities
" Plug 'janko-m/vim-test'

" "========== Haskell ==========
" " Vim configuration files for Haskell code
" Plug 'kana/vim-filetype-haskell', { 'for': 'haskell' }
" " A completion plugin for Haskell, using ghc-mod
" Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
" " Vim to Haskell: A collection of vimscripts for Haskell development.
" Plug 'dag/vim2hs', { 'for': 'haskell' }
" " Happy Haskell programming on Vim, powered by ghc-mod
" Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }

" "========== Scala ==========
" " Integration of Scala into Vim
" Plug 'derekwyatt/vim-scala', { 'for': 'scala' }

" "========== Golang ==========
" Plug 'fatih/vim-go', { 'for': 'go' }

" "========== Rust ==========
" Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" Plug 'racer-rust/vim-racer', { 'for': 'rust '}

"========== JavaScript ==========
" Vastly improved Javascript indentation and syntax support in Vim.
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Prettier: post install (yarn install | npm install) then load plugin only for editing
" supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

" "========== Elixir ==========
" Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }

" "========== Ruby ==========
" " Vim/Ruby configuration files
" Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
" " rails.vim: Ruby on Rails power tools
" Plug 'tpope/vim-rails', { 'for': 'ruby' }

" "========== Systax Highlighting ==========
" " TOML
" Plug 'cespare/vim-toml'
" " EJS
" Plug 'briancollins/vim-jst'
" " Slim
" Plug 'slim-template/vim-slim'

call plug#end()

"-----------------------------------------
" NERD Commenter
" https://github.com/scrooloose/nerdcommenter
" Vim plugin for intensely orgasmic commenting
"-----------------------------------------
let g:NERDSpaceDelims = 1

"-----------------------------------------
" Unite.vim
" https://github.com/Shougo/unite.vim
" Unite and create user interfaces.
"-----------------------------------------
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit=100
nnoremap <silent> <Leader>ub :<C-u>Unite file buffer<CR>
nnoremap <silent> <Leader>uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> <Leader>uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <Leader>ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <Leader>uy :<C-u>Unite history/yank<CR>

"-----------------------------------------
" fugitive.vim
" https://github.com/tpope/vim-fugitive
" A Git wrapper so awsome, it should be illegal
"-----------------------------------------
nnoremap <silent> <Leader>gbl :Gblame<CR>
nnoremap <silent> <Leader>gdf :Gdiff<CR>
nnoremap <silent> <Leader>gst :Gstatus<CR>



" "===================================
" " neocomplete
" "
" " Next generation completion framework
" "===================================
" " Use neocomplete.
" let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#enable_ignore_case = 1
" " Set minimum syntax keyword length.
" let g:neocomplete#sources#syntax#min_keyword_length = 3
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" " Use fuzzy completion.
" let g:neocomplete#enable_fuzzy_completion = 1
" " Define dictionaries
" let g:neocomplete#sources#dictionary#dictionaries = {
  " \ 'default' : '',
  " \ 'vimshell' : $HOME.'/.vimshell_hist',
  " \ 'scala' : $HOME.'/.vim/dict/scala.dict',
  " \ }
" " Omni completion
" if !exists('g:neocomplete#force_omni_input_patterns')
  " let g:neocomplete#force_omni_input_patterns = {}
" endif
" let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

" " Recommended key-mappings.
" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
  " return neocomplete#close_popup() . "\<CR>"
  " " For no inserting <CR> key.
  " "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
" endfunction

" " Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" "autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" "autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


" "===================================
" " neonsnippet
" "
" " neo-snippet plugin contains neocomplete snippets source
" "===================================
" " Plugin key mappings
" imap <C-k> <Plug>(neosnippet_expand_or_jump)
" smap <C-k> <Plug>(neosnippet_expand_or_jump)
" xmap <C-k> <Plug>(neosnippet_expand_or_jump)
" " SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: "\<TAB>"

" " For snippet_complete marker.
" if has('conceal')
  " set conceallevel=2 concealcursor=i
" endif

" " load snippets
" let g:neosnippet#enable_snipmate_compatibility = 1
" let g:neosnippet#disable_runtime_snippets = {'_' : 1}
" let g:neosnippet#snippets_directory = [
  " \ '~/.vim/plugged/vim-snippets/snippets',
  " \ '~/.vim/plugged/neosnippet-snippets/neosnippets',
  " \ ]


" "===================================
" " Syntastic
" "
" " Syntax checking hacks for vim
" "===================================
" " Normally activate syntactic checking
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
" " Always stic any detected errors into the location-list
" let g:syntastic_always_populate_loc_list = 1
" " Automatically open the |location-list| (see |syntastic-error-window|) when a buffer has errors.
" let g:syntastic_auto_loc_list = 1
" " Specify the height of the location lists that syntastic opens.
" let g:syntastic_loc_list_height = 5
" " Ignore AngularJS's directives
" let g:syntastic_html_tidy_ignore_errors = [" proprietary attribute \"ng-"]
" " Run syntax checks when buffers are first loaded, as well as saving
" let g:syntastic_check_on_open = 1

" " JavaScript
" let g:syntastic_javascript_checkers = ['eslint']
" " Ruby
" let g:syntastic_ruby_checkers = ['rubocop']
" " Go: Prevent lagging when using vim-go and syntastic
" let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']


" "===================================
" " EasyMotion
" "
" " Vim motions on speed!
" "===================================
" "Disable default mappings
" let g:EasyMotion_do_mapping = 0
" " Enable smartcase
" let g:EasyMotion_smartcase = 1
" " Jump to anywhere you want by just `4` or `3` key strokes without thinking!
" " `s{char}{char}{target}`
" nmap s <Plug>(easymotion-s2)
" xmap s <Plug>(easymotion-s2)
" omap z <Plug>(easymotion-s2)  " Avoid conflict with surround.vim
" " Of course, you can map to any key you want such as `<Space>`
" " map <Space>(easymotion-s2)


" "===================================
" " vimproc
" "
" " Interactive command execution in Vim.
" "===================================
" let vimproc_updcmd = has('win64') ?
      " \ 'tools\\update-dll-mingw 64' : 'tools\\update-dll-mingw 32'


" "===================================
" " quickrun.vim
" "
" " Run commands quickly.
" "===================================
" let g:quickrun_config = {'*': {'split': 'vertical'}}
" " Use vimproc to run
" let g:quickrun_config._ = {'runner' : 'vimproc'}
" " Scala 用
" nnoremap <silent> <Leader>r :QuickRun -cmdopt ''<CR>


" "===================================
" " ghcmod.vim
" "
" " Happy Haskell programming on Vim, powered by ghc-mod
" "===================================
" autocmd FileType haskell NeoBundleSource ghcmod-vim
" au FileType hs noremap <Leader>t :GhcModType<CR>
" au FileType hs noremap <Leader>T :GhcModTypeClear<CR>


" "===================================
" " vim-indent-guides
" "
" " A Vim plugin for visually displaying indent levels in code
" "===================================
" let g:indent_guides_enable_on_vim_startup=1
" let g:indent_guides_auto_colors=0
" let g:indent_guides_guide_size=1
" autocmd VimEnter,ColorScheme * :hi IndentGuidesOdd  ctermbg=110
" autocmd VimEnter,ColorScheme * :hi IndentGuidesEven ctermbg=140



" "===================================
" " vim-go
" "
" " Go development plugin for Vim
" "===================================
" let g:go_fmt_command = "goimports"
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_interfaces = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1

" " Run go tools automatically on save
" let g:go_metalinter_autosave = 1

" " gocode
" set completeopt=menu,preview

" " Key mappings
" au FileType go nmap <Leader>r <Plug>(go-run)
" au FileType go nmap <Leader>b <Plug>(go-build)
" au FileType go nmap <Leader>t <Plug>(go-test)
" au FileType go nmap <Leader>c <Plug>(go-coverage)
" au FileType go nmap <Leader>ds <Plug>(go-def-split)
" au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
" au FileType go nmap <Leader>dt <Plug>(go-def-tab)
" au FileType go nmap <Leader>n <Plug>(go-rename)
" au FileType go nmap <Leader>gd <Plug>(go-doc)
" au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
" au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
" au FileType go nmap <Leader>s <Plug>(go-implements)
" au FileType go nmap <Leader>i <Plug>(go-info)


" "===================================
" " gotags & tagbar
" "
" " ctags-compatible tag generator for Go
" "===================================
" nmap <F8> :TagbarToggle<CR>
" let g:tagbar_type_go = {
    " \ 'ctagstype' : 'go',
    " \ 'kinds'     : [
        " \ 'p:package',
        " \ 'i:imports:1',
        " \ 'c:constants',
        " \ 'v:variables',
        " \ 't:types',
        " \ 'n:interfaces',
        " \ 'w:fields',
        " \ 'e:embedded',
        " \ 'm:methods',
        " \ 'r:constructor',
        " \ 'f:functions'
    " \ ],
    " \ 'sro' : '.',
    " \ 'kind2scope' : {
        " \ 't' : 'ctype',
        " \ 'n' : 'ntype'
    " \ },
    " \ 'scope2kind' : {
        " \ 'ctype' : 't',
        " \ 'ntype' : 'n'
    " \ },
    " \ 'ctagsbin'  : 'gotags',
    " \ 'ctagsargs' : '-sort -silent'
" \ }

" " Disable auto comment out
" autocmd Filetype * set formatoptions-=ro


" "===========================================
" " fzf
" "
" " A command line fussy finder written in Go
" "===========================================
" set runtimepath+=~/.fzf
" noremap <silent> <Leader>f :FZF<CR>


" "==========================================="
" " dash.vim
" "
" " Search Dash.app from Vim
" "===========================================
" nmap <silent> <Leader>d <Plug>DashSearch


" "===========================================
" " pt (the platinum searcher)
" "===========================================
" nnoremap <silent> <Leader>g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" if executable('pt')
  " let g:unite_source_grep_command = 'pt'
  " let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  " let g:unite_source_grep_recursive_opt = ''
  " let g:unite_source_grep_encoding = 'utf-8'
" endif


" "===========================================
" " php.vim
" "===========================================
" " $VIMRUNTIME/syntax/php.vim
" let g:php_baselib = 1
" let g:php_htmlInStrings = 1
" let g:php_noShortTags = 1
" let g:php_sql_query = 1

" " $VIMRUNTIME/syntax/sql.vim
" let g:sql_type_default = 'mysql'

" " syntax highlighting for .inc files
" au BufNewFile,BufRead *.inc set filetype=php


" "===========================================
" " rust.vim
" "===========================================
" let g:rustfmt_autosave = 1

" "===========================================
" " Racer
" "===========================================
" set hidden
" let g:racer_cmd = '$HOME/.cargo/bin/racer'
" let g:racer_experimental_completer = 1

" au FileType rust nmap gd <Plug>(rust-def)
" au FileType rust nmap gs <Plug>(rust-def-split)
" au FileType rust nmap gx <Plug>(rust-def-vertical)
" au FileType rust nmap <leader>gd <Plug>(rust-doc)



" "===========================================
" " test.vim
" "===========================================
" " Key mappings
" nmap <silent> <leader>t :TestNearest<CR>
" nmap <silent> <leader>T :TestFile<CR>
" nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>

" "===========================================
" " vim-prettier
" "===========================================
" " max line lengh that prettier will wrap on
" let g:prettier#config#print_width = 100
" " print spaces between brackets
" let g:prettier#config#bracket_spacing = 'true'
" " none|es5|all
" let g:prettier#config#trailing_comma = 'es5'
" autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql Prettier
