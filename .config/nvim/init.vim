
call plug#begin('~/.vim/plugged')

Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'kana/vim-fakeclip'
Plug 'easymotion/vim-easymotion',
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'

call plug#end()

" Basic stup
set noswapfile
set incsearch
set nowrap
set undodir=~/.vim/undodir
set undofile

nnoremap ; :
nnoremap : ;

" Remap ctrl+HJKL to arrow in Insert Mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" Map C-A to calculate expression on cursor line
inoremap <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>
nnoremap <C-A> i<C-O>diW<End><C-R>=<C-R>0<CR>

" Remap s to Easymotion 2-Word Search
map s <Plug>(easymotion-s2)

" let g:tmuxline_theme = 'iceberg'
let g:airline#extensions#tmuxline#enabled = 0

" Set default register to + which is the linux clipboard
set clipboard:unnamedplus

" Sync Windows clipboard with wsl clipboard
let s:clip = '/mnt/c/Windows/System32/clip.exe' 


if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
    augroup END
end

noremap "+p :exe 'norm a'.system('/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command Get-Clipboard')<CR>


" Remove version warning at startup
let g:go_version_warning=0

command EndOfLine normal!$

" Disable wrapping
command! -nargs=* Wrap set wrap linebreak nolist

" Goyo setup 
let g:goyo_width = 120
function! s:goyo_enter()
    execute ‘Limelight’
    let b:quitting = 0
    let b:quitting_bang = 0
    autocmd QuitPre <buffer> let b:quitting = 1
    cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
    execute ‘Limelight!’
    if b:quitting && len(filter(range(1, bufnr(‘$’)), ‘buflisted(v:val)’)) == 1
        if b:quitting_bang
            qa!
        else
            qa
        endif
    endif
endfunction
