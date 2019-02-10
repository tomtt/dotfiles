" {{{ modelines
" vim: foldmethod=marker:nofoldenable
" }}}

" {{{ settings
filetype plugin indent on
syntax on

if (has("termguicolors"))
  set termguicolors
endif

set cursorline
set number
set incsearch
set hlsearch
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set background=dark
set list listchars=tab:→\ ,
set suffixesadd=.ts,.tsx
set nowrap
" }}}

" {{{ plugin settings
if executable('ag')
  let g:ackprg = 'ag --vimgsep'
endif

" let g:indentLine_char = '│'
let g:indentLine_char = '▏'
" let g:indentLine_char = '.'
" let g:indentLine_char = '·'

" nerd commenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" ale (linting)
let g:ale_fix_on_save = 0
let g:ale_sign_column_always = 1
let g:ale_completion_enabled = 1
let g:ale_sign_error = '✘'
" let g:ale_sign_warning = '¿'
" let g:ale_sign_warning = '☡'
let g:ale_sign_warning = '⚡'
let g:ale_linters = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'typescript': ['eslint'],
  \ }
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['eslint'],
  \ }
" \ 'typescript': ['eslint', 'tslint'],
let g:ale_echo_msg_error_str = 'error'
let g:ale_echo_msg_warning_str = 'warning'
let g:ale_echo_msg_format = '%linter% %severity%: %s %(code)%'

" deoplete
let g:deoplete#enable_at_startup = 1

" nvim-typescript
let g:nvim_typescript#type_info_on_hold = 1
let g:nvim_typescript#signature_complete = 1
" }}}

" {{{ plugins
call plug#begin('~/.vim/plugged')
  Plug 'w0rp/ale'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'mileszs/ack.vim'
  Plug 'scrooloose/nerdcommenter'
  " Plug 'sheerun/vim-polyglot'
  Plug 'vim-airline/vim-airline'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'Yggdroot/indentLine'
  Plug 'tpope/vim-surround'
  Plug 'jiangmiao/auto-pairs'
  Plug 'sickill/vim-pasta'
  Plug 'bkad/CamelCaseMotion'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'airblade/vim-gitgutter'

  " ts
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }

  " colorschemes
  Plug 'morhetz/gruvbox'
  Plug 'rakr/vim-one'
  Plug 'mhartington/oceanic-next'
call plug#end()
" }}}

" {{{ mappings
call camelcasemotion#CreateMotionMappings('<leader>')

nnoremap <silent> <leader>ev :tabedit ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-f> :Ag<Space>
nnoremap <silent> <C-n> :Texplore<CR>
nnoremap <silent> <leader>ss :StripWhitespace<CR>
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>
nmap <C-k> <Plug>(ale_previous_wrap)
nmap <C-j> <Plug>(ale_next_wrap)
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" }}}

" {{{ extra plugin configuration
highlight ALEError gui=italic guifg=#ff5443
highlight ALEWarning gui=italic

" indentLine
autocmd Filetype json :IndentLinesDisable
" }}}

" {{{ colorscheme
" colorscheme gruvbox
" colorscheme one
colorscheme OceanicNext
" }}}

