let mapleader = "\<Space>"
call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" {{{
    source ~/AppData/Local/nvim/fzf_config.vim
" }}}
Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nmap <leader>a :Ack<space> 

Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'FooSoft/vim-argwrap'
autocmd FileType julia let b:argwrap_tail_comma=1
nnoremap <silent> <leader>e :ArgWrap<CR>

" Expand the ability to use text-object operations.
Plug 'jeanCarloMachado/vim-toop'

Plug 'kana/vim-textobj-user'
"{{{
  call textobj#user#plugin(
\   'runblock',
\   {
\       'block': {
\           'pattern' : ['#<<', '#>>'], 
\           'select-a': 'ao',
\           'select-i': 'io',
\       }
\   })
"}}}

Plug 'machakann/vim-highlightedyank'

if !exists('g:vscode') 
    Plug 'korsbo/srcery-vim'
    Plug 'tpope/vim-commentary'
    " {{{
      nnoremap <leader>c :Commentary 
      autocmd FileType julia setlocal commentstring=#\ %s
    " }}}
endif 

call plug#end()

if !exists('g:vscode') 
    " syntax enable " Turn on syntax highlighting  
set termguicolors
" colorscheme monokai
colorscheme srcery
endif 

if exists('g:vscode')
  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine
end

set number
set relativenumber
set hidden " Leave hidden buffers open  
set history=100 
set colorcolumn=92
set cursorline


autocmd FileType julia setlocal commentstring=#\ %s

" make Y yank from cursor to end of line
nnoremap Y y$

" Switch between tabs
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt

map <Up> g<Up>
map <Down> g<Down>

command! R e ~/.nvimrc

iabbrev teh the
iabbrev Teh The
iabbrev lenght length
iabbrev Lenght Length


set clipboard=unnamed,unnamedplus


" command! W w
" command! Q q
" command! Wq wq
" command! WQ wq


" (t)ill -> (j)ump
noremap j t
noremap J T
noremap t j
noremap T J

nnoremap t gj
vnoremap t gj
nnoremap k gk
vnoremap k gk

if exists('g:vscode') 
  nnoremap k :<C-u>call VSCodeCall('cursorMove', { 'to': 'up', 'by': 'wrappedLine', 'value': v:count ? v:count : 1 })<CR>
  nnoremap t :<C-u>call VSCodeCall('cursorMove', { 'to': 'down', 'by': 'wrappedLine', 'value': v:count ? v:count : 1 })<CR>
endif

noremap <C-f> <C-d>

"=============== source vimrc if saved =============
augroup VimReload
  autocmd!
  autocmd BufWritePost ~/AppData/Local/nvim/init.vim source ~/AppData/Local/nvim/init.vim
augroup END

