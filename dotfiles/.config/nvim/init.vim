"=========================================
" Plugins
"=========================================
call plug#begin('~/.local/share/nvim/plugged')

"========== General ==========
" Powerful shell implemented by vim.
Plug 'Shougo/vimshell.vim'
" Next generation completion framework
Plug 'Shougo/neosnippet'
" The standard snippets repository for neosnippet
Plug 'Shougo/neosnippet-snippets'
" Vim-SnipMate defalut snippets
Plug 'skatsuta/vim-snippets'
" Vim plugin for intensely orgasmic commenting
Plug 'tpope/vim-fugitive'
" Easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'
" Wisely add 'end' in Ruby, endfunction/endif/more in Vim script, etc
Plug 'tpope/vim-endwise'
" surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'
" Syntax checking hacks for vim
Plug 'scrooloose/nerdcommenter'
" Provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'Raimondi/delimitMate'
" Vim motions on speed!
Plug 'Lokaltog/vim-easymotion'
" Provides support for expanding abbreviations similar to emmet.
Plug 'mattn/emmet-vim'
" A Vim plugin for visually displaying indent levels in code
Plug 'nathanaelkane/vim-indent-guides'
" A Vim wrapper for running tests on different granularities
Plug 'vim-test/vim-test'
" Improved incremental searching for Vim
Plug 'haya14busa/incsearch.vim'
" fzf is a general-purpose command-line fuzzy finder.
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" Check syntax in Vim asynchronously and fix files,
" with Language Server Protocol (LSP) support
Plug 'dense-analysis/ale'

"========== Color schemes ==========
" Monokai theme
Plug 'tomasr/molokai'
" Catppuccin theme
" https://github.com/catppuccin/nvim
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
" Ayu theme
" https://github.com/Shatur/neovim-ayu
Plug 'Shatur/neovim-ayu', { 'as': 'ayu' }

"========== Language Servers ==========
" Normalize async job control api for vim and neovim.
Plug 'prabirshrestha/async.vim'
" Async autocompletion for Vim 8 and Neovim with |timers|.
Plug 'prabirshrestha/asyncomplete.vim'
" Provide Language Server Protocol autocompletion source
" for asyncomplete.vim and vim-lsp.
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Async Language Server Protocol plugin for vim8 and neovim.
Plug 'prabirshrestha/vim-lsp'
" Auto configurations for Language Servers for vim-lsp.
Plug 'mattn/vim-lsp-settings'
" Neovim plugin for GitHub Copilot
Plug 'github/copilot.vim'

"========== Golang ==========
" Vim plugin for Minimalist Gopher.
Plug 'mattn/vim-goimports', { 'for': 'go' }

"========== Rust ==========
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

"========== JavaScript ==========
" Vastly improved Javascript indentation and syntax support in Vim.
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

"========== Ruby ==========
" Vim/Ruby configuration files
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
" rails.vim: Ruby on Rails power tools
Plug 'tpope/vim-rails', { 'for': 'ruby' }

"========== Haskell ==========
" Vim configuration files for Haskell code
Plug 'kana/vim-filetype-haskell', { 'for': 'haskell' }
" A completion plugin for Haskell, using ghc-mod
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
" Vim to Haskell: A collection of vimscripts for Haskell development.
Plug 'dag/vim2hs', { 'for': 'haskell' }
" Happy Haskell programming on Vim, powered by ghc-mod
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }

"========== Systax Highlighting ==========
" TOML
Plug 'cespare/vim-toml', { 'for': 'toml' }
" Slim
Plug 'slim-template/vim-slim', { 'for': 'slim' }
" HashiCorp Configuration Language (HCL)
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
" GraphQL
Plug 'jparise/vim-graphql', { 'for': 'graphql' }

call plug#end()

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
" Set color scheme
set background=dark
colorscheme catppuccin
" Enable syntax highlighting
syntax on
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
" As much as possible of the last line in a window will be displayed
set display=lastline
" Don't extract tabs in Go file
autocmd BufRead *.go set noexpandtab
" Highlight the column
set colorcolumn=100
" Change the ruler color to a darker grey
highlight ColorColumn ctermbg=238
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
" Highlight .envrc as shell script
autocmd BufNewFile,BufRead .envrc set filetype=sh
" Highlight *.config as YAML
autocmd BufNewFile,BufRead *.config,*.dig set filetype=yaml
" Highlight Jenkinsfile
autocmd BufNewFile,BufRead Jenkinsfile set filetype=groovy
" Highlight NASM assembly files
autocmd BufNewFile,BufRead *.nas set filetype=nasm


"=========================================
" Status Line
"=========================================
" Format: file name (file path)     [Git(branch)][+][vim][file encoding][line ending][row, column]
" Ref: http://hail2u.net/blog/software/optimize-vim-statusline.html
set statusline=%{expand('%:p:t')}\ %<\(%{expand('%:p:h')}\)%=\ %{fugitive#statusline()}%m%r%y%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}[%3l,%3c]


"=========================================
" Key Mappings
"=========================================
" Default to display line upward/downward
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap h <Left>
nnoremap l <Right>

" Open foldings by l
if has('folding')
  nnoremap <expr> l foldlevel(line('.')) ? "\<Right>zo" : "\<Right>"
endif
" Use Ctrl-S for saving, also in insert mode
noremap  <C-S> :update<CR>
inoremap <C-S> <C-O>:update<CR>
vnoremap <C-S> <C-C>:update<CR>

"-----------------------------------------
" NERD Commenter
" https://github.com/scrooloose/nerdcommenter
" Vim plugin for intensely orgasmic commenting
"-----------------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

"-----------------------------------------
" fugitive.vim
" https://github.com/tpope/vim-fugitive
" A Git wrapper so awsome, it should be illegal
"-----------------------------------------
nnoremap <silent> <Leader>gc :Git commit<CR>
nnoremap <silent> <Leader>gd :Git diff<CR>
nnoremap <silent> <Leader>gs :Git status<CR>
nnoremap <silent> <Leader>gw :Gwrite<CR>

"-----------------------------------------
" Neonsnippet
" https://github.com/Shougo/neosnippet.vim
" The Neosnippet plug-In adds snippet support to Vim.
"-----------------------------------------
" Plugin key mappings
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Disable all runtime snippets
let g:neosnippet#disable_runtime_snippets = {'_' : 1}
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory = [
  \ '~/.vim/plugged/vim-snippets/snippets',
  \ '~/.vim/plugged/neosnippet-snippets/neosnippets',
  \ ]

"-----------------------------------------
" Asynchronous Lint Engine (ALE)
" https://github.com/w0rp/ale
" Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration
"-----------------------------------------
" Configure linters
let g:ale_linters = {
  \ 'typescript': ['eslint'],
  \ 'javascript': ['eslint'],
  \ 'python': ['flake8'],
  \ 'go': ['golangci-lint'],
  \ }
" Configure fixers
let g:ale_fixers = {
  \ 'c': ['clang-format'],
  \ 'cpp': ['clang-format'],
  \ 'go': ['goimports'],
  \ 'typescript': ['prettier', 'eslint'],
  \ 'javascript': ['prettier', 'eslint'],
  \ 'json': ['prettier'],
  \ 'python': ['isort', 'black'],
  \ 'terraform': ['terraform'],
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ }
" Fix files when saving them
let g:ale_fix_on_save = 1

" Configuration for golangci-lint
" Disable the default --enable-all option
let g:ale_go_golangci_lint_options = ''
" Check the whole Go package instead of only the current file
let g:ale_go_golangci_lint_package = 1

"-----------------------------------------
" EasyMotion
" https://github.com/easymotion/vim-easymotion
" Vim motions on speed!
"-----------------------------------------
" Disable default mappings
let g:EasyMotion_do_mapping = 0
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" Jump to anywhere you want by just `4` or `3` key strokes without thinking!
" `s{char}{char}{target}`
nmap s <Plug>(easymotion-overwin-f2)
" Move to char
map  <Leader>ef <Plug>(easymotion-bd-f)
nmap <Leader>ef <Plug>(easymotion-overwin-f)
" Move to line
map <Leader>el <Plug>(easymotion-bd-jk)
nmap <Leader>el <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>ew <Plug>(easymotion-bd-w)
nmap <Leader>ew <Plug>(easymotion-overwin-w)

"-----------------------------------------
" incsearch.vim
" https://github.com/haya14busa/incsearch.vim
" Improved incremental searching for Vim
"-----------------------------------------
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"-----------------------------------------
" Indent Guides
" https://github.com/nathanaelkane/vim-indent-guides
" A Vim plugin for visually displaying indent levels in code
"-----------------------------------------
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
let g:indent_guides_guide_size=1
autocmd VimEnter,ColorScheme * :hi IndentGuidesOdd  ctermbg=237
autocmd VimEnter,ColorScheme * :hi IndentGuidesEven ctermbg=239

"-----------------------------------------
" vim-lsp
" https://github.com/prabirshrestha/vim-lsp
" Async Language Server Protocol plugin for vim8 and neovim.
"-----------------------------------------
nmap <silent> <Leader>la :LspCodeAction<CR>
nmap <silent> <Leader>ld :LspDefinition<CR>
nmap <silent> <Leader>li :LspImplementation<CR>
nmap <silent> <Leader>lh :LspHover<CR>
nmap <silent> <Leader>lr :LspReferences<CR>
nmap <silent> <Leader>ln :LspRename<CR>
nmap <silent> <Leader>ls :LspSignatureHelp<CR>
nmap <silent> <Leader>lt :LspTypeDefinition<CR>

let g:asyncomplete_popup_delay = 200
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_text_edit_enabled = 1

"-----------------------------------------
" vim-lsp-settings
" https://github.com/mattn/vim-lsp-settings
" Auto configurations for Language Servers for vim-lsp.
"-----------------------------------------
let g:lsp_settings_filetype_vue = ['typescript-language-server', 'volar-server']

"-----------------------------------------
" test.vim
" https://github.com/vim-test/vim-test
" Run your tests at the speed of thought
"-----------------------------------------
" Test strategy
"   - neovim: runs test commands with :terminal in a split window
let test#strategy = "neovim"

" Key mappings
nmap <silent> <Leader>tn :TestNearest<CR>
nmap <silent> <Leader>tf :TestFile<CR>
nmap <silent> <Leader>ts :TestSuite<CR>
nmap <silent> <Leader>tl :TestLast<CR>
nmap <silent> <Leader>tv :TestVisit<CR>

"-----------------------------------------
" rust.vim
" https://github.com/rust-lang/rust.vim
" This is a Vim plugin that provides Rust file detection, syntax highlighting, formatting, Syntastic integration, and more.
"-----------------------------------------
let g:rustfmt_autosave = 1

"-----------------------------------------
" fzf
" https://github.com/junegunn/fzf
" https://github.com/junegunn/fzf.vim
" A command line fussy finder written in Go
"-----------------------------------------
noremap <silent> <Leader>ff :Files<CR>
noremap <silent> <Leader>fb :Buffers<CR>
noremap <silent> <Leader>fr :Rg<CR>
noremap <silent> <Leader>fl :Lines<CR>
noremap <silent> <Leader>fbl :BLines<CR>
noremap <silent> <Leader>fh :History<CR>
" Command history
noremap <silent> <Leader>fch :History:<CR>
" Search history
noremap <silent> <Leader>fsh :History/<CR>
