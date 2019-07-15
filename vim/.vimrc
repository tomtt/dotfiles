" {{{ modelines
" vim: foldmethod=marker
" }}}

" {{{ plugins
call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'mileszs/ack.vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'vim-airline/vim-airline'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'Yggdroot/indentLine'
  Plug 'tpope/vim-surround'
  Plug 'jiangmiao/auto-pairs'
  Plug 'sickill/vim-pasta'
  Plug 'bkad/CamelCaseMotion'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'RRethy/vim-hexokinase'
  Plug 'jesseleite/vim-noh'
  Plug 'tpope/vim-markdown'
  " Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }

  " CoC plugins
  Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-jest', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}

  " javascript
  Plug 'othree/yajs.vim', { 'for': 'javascript' }
  Plug 'othree/es.next.syntax.vim'
  " this one below messes up typescript syntax
  " Plug 'maxmellon/vim-jsx-pretty'

  " typescript
  Plug 'HerringtonDarkholme/yats.vim'

  " colorschemes
  Plug 'morhetz/gruvbox'
  Plug 'rakr/vim-one'
  Plug 'mhartington/oceanic-next'
  Plug 'ayu-theme/ayu-vim'
  Plug 'NLKNguyen/papercolor-theme'
call plug#end()
" }}}

" {{{ mappings
if exists('*camelcasemotion#CreateMotionMappings')
  call camelcasemotion#CreateMotionMappings('<leader>')
endif

nnoremap <silent> <leader>ev :tabedit ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <C-f> :Ag<Space>
nnoremap <silent> <C-n> :Texplore<CR>
nnoremap <silent> <leader>ss :StripWhitespace<CR>
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>
nmap <C-k> <Plug>(coc-diagnostic-prev)
nmap <C-j> <Plug>(coc-diagnostic-next)

" the one below uses leader since vim-noh is overwriting `gd`
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <silent> K :call <SID>show_documentation()<CR>
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
nnoremap <leader>h :HexokinaseRefresh<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" for coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>f :Prettier<CR>
" }}}

" {{{ plugin settings
" highlight ALEError gui=italic guifg=#ff5443
" highlight ALEWarning gui=italic

" indentLine
autocmd Filetype json :IndentLinesDisable

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" let g:indentLine_char = '│'
let g:indentLine_char = '▏'
" let g:indentLine_char = '.'
" let g:indentLine_char = '·'

" nerd commenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" coc
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" let g:Hexokinase_virtualText = '██████'
let g:Hexokinase_refreshEvents = ['TextChanged', 'TextChangedI']
let g:Hexokinase_ftAutoload = ['*']

noremap <Plug>NohAfter zz

let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'typescript']
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
set suffixesadd+=.ts,.tsx,.js,.jsx
set nowrap
set completeopt+=menuone
set cmdheight=2
set updatetime=300

" yats.vim sets suffixes to only .ts,.tsx
autocmd BufRead * set suffixesadd+=.js,.jsx
" }}}

" {{{ colorscheme
" silent! colorscheme gruvbox
silent! colorscheme one
" silent! colorscheme OceanicNext
" silent! colorscheme PaperColor

" AirlineTheme oceanicnext

" let g:airline_theme='papercolor'
" let g:airline_theme='onedark'
" }}}
