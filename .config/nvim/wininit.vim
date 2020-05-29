
nnoremap ; :
nnoremap : ;
nnoremap <C-s> <Leader>w

set noswapfile
set incsearch
set nowrap
" Remap HJKL to arrow in Normal Mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
inoremap <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>
"nnoremap <C-A> i<C-O>diW<End><C-R>=<C-R>0<CR>

set clipboard:unnamedplus
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/bogdan0083/vim-easymotion.git', { 'branch': 'fix/label-position' }

if exists('g:vscode')
	remap <silent><c-s> :<c-u>update<cr>
else
	"syntax on
	colorscheme gruvbox
	set background=dark
endif


" To work with VSCODE Bookmarks
" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
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
Plug 'tpope/vim-surround'
Plug 'yuttie/comfortable-motion.vim'

Plug 'flazz/vim-colorschemes', {'for':'txt'}
Plug 'tpope/vim-commentary'

Plug 'wellle/targets.vim'

Plug 'tpope/vim-sensible'
" Initialize plugin system
call plug#end()
map s dd
nnoremap s <Plug>(easymotion-s2)
