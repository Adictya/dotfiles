let g:go_version_warning=0

let s:clip = '/mnt/c/Windows/System32/clip.exe' 
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
    augroup END
end

noremap "+p :exe 'norm a'.system('/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command Get-Clipboard')<CR>

nnoremap ; :
nnoremap : ;
set noswapfile
set incsearch

command EndOfLine normal!$

command! -nargs=* Wrap set wrap linebreak nolist

set clipboard:unnamedplus

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

colorscheme gruvbox
set background=dark

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)

Plug 'kana/vim-fakeclip'

Plug 'junegunn/goyo.vim'

Plug 'junegunn/limelight.vim'

Plug 'tpope/vim-surround'

Plug 'yuttie/comfortable-motion.vim'

Plug 'tpope/vim-commentary'

Plug 'wellle/targets.vim'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

Plug 'morhetz/gruvbox'

call plug#end()

