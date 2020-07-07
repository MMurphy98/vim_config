let mapleader=" "
syntax on

set number
set cursorline
set wrap
set showcmd
set wildmenu

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

noremap K 5k
noremap	J 5j
noremap	= nzz
noremap	- Nzz
noremap <LEADER><CR> :nohlsearch<CR>

map S :w<CR>
map s <nop>
map R :source $MYVIMRC<CR>
map Q :q<CR>





call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
Plug 'Valloric/YouCompleteMe' " Undo Tree Plug 'mbbill/undotree/'

" Other visual enhancement
Plug 'itchyny/vim-cursorword'
Plug'dracula/vim',{ 'as': 'dracula' }

" Other useful utilities
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim' " distraction free writing mode
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'fadein/vim-FIGlet'

call plug#end()


" ------------- configuration ------------------------------
let g:airline_theme='bubblegum'

map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>


map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>h <C-w>h


map <LEADER><up> :res +5<CR>
map <LEADER><down> :res -5<CR>
map <LEADER><left> :vertical resize -5<CR>
map <LEADER><right> :vertical resize +5<CR>

map tl :tabe<CR>
map t= :+tabnext<CR>
map t- :-tabnext<CR>

set nocompatible
filetype on
filetype indent on 
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

let g:airline_solarized_bg='dark'

nmap mf :vsp 
nmap ch :cd ~\Desktop<CR>

" for copy and paste from clipboard
map <LEADER>y "+y
map <LEADER>p "+p


"""" NERDTree
map tt :NERDTreeToggle<CR>
"""" Goyo
map <LEADER>gy :Goyo<CR>

"""" vim-signiture
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }





"--------------------------------------------
let g:mkdp_browser = 'firefox'


"""" markdown snippits

autocmd Filetype markdown inoremap ,m <Esc>:!s<Enter>
autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,b ****<++><Esc>F*hi
autocmd Filetype markdown inoremap ,n <Enter>---<Enter><Enter>
autocmd Filetype markdown inoremap ,i **<++><Esc>F*i
autocmd Filetype markdown inoremap ,d ``<++><Esc>F`i
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,p ![](<++>)<++> <Esc>F[a
autocmd Filetype markdown inoremap ,P ![]()<++> <Esc>F(a D:/pictures/.png<Esc>F.i<C-r>=strftime("%m%d%H%M")<Enter><Esc>$i


autocmd Filetype markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,e $$ <++><Esc>F$i
autocmd Filetype markdown inoremap ,E $$<Enter><Enter>$$<Enter><++><Esc>02ki
autocmd Filetype markdown inoremap ,u <u></u><++><Esc>F/hi
autocmd Filetype markdown inoremap ,n <Enter>&nbsp;<Enter>

""" some Latex snippits
autocmd Filetype markdown inoremap \f \frac{}{<++>} <++><Esc>Fc2li
autocmd Filetype markdown inoremap \p \part{} <++><Esc>Ft2li
autocmd Filetype markdown inoremap ,s _{} <++><Esc>F{li
autocmd Filetype markdown inoremap ,w ^{} <++><Esc>F{li
autocmd Filetype markdown inoremap \s \sqrt{} <++><Esc>F{li
autocmd Filetype markdown inoremap \i \int_{}^{<++>}{<++>} <++><Esc>Ft3li
autocmd Filetype markdown inoremap \a \sum_{}^{<++>}{<++>} <++><Esc>Fm3li
autocmd Filetype markdown inoremap \dp \prod_{}^{<++>}{<++>} <++><Esc>Fd3li
autocmd Filetype markdown inoremap { {} <++><Esc>F}i
autocmd Filetype markdown inoremap [ [] <++><Esc>F]i
autocmd Filetype markdown inoremap ( () <++><Esc>F)i

map <LEADER>m :MarkdownPreview<CR>

"" some math signs
autocmd Filetype markdown inoremap \al \Leftarrow<Space>
autocmd Filetype markdown inoremap \ar \Rightarrow<Space>

autocmd Filetype markdown inoremap \au \Uparrow<Space>
autocmd Filetype markdown inoremap \ad \Downarrow<Space>
autocmd Filetype markdown inoremap \ga \alpha<Space>
autocmd Filetype markdown inoremap \gb \beta<Space>
autocmd Filetype markdown inoremap \gg \gamma<Space>
autocmd Filetype markdown inoremap \gd \delta<Space>
autocmd Filetype markdown inoremap \gD \Delta<Space>
autocmd Filetype markdown inoremap \ge \epsilon<Space>
autocmd Filetype markdown inoremap \gz \zeta<Space>
autocmd Filetype markdown inoremap \gt \theta<Space>
autocmd Filetype markdown inoremap \gT \Theta<Space>
autocmd Filetype markdown inoremap \gl \lambda<Space>
autocmd Filetype markdown inoremap \gm \mu<Space>
autocmd Filetype markdown inoremap \gx \xi<Space>
autocmd Filetype markdown inoremap \gr \rho<Space>
autocmd Filetype markdown inoremap \gs \sigma<Space>
autocmd Filetype markdown inoremap \gS \Sigma<Space>
autocmd Filetype markdown inoremap \gp \phi<Space>
autocmd Filetype markdown inoremap \gP \Phi<Space>
autocmd Filetype markdown inoremap \gy \psi<Space>
autocmd Filetype markdown inoremap \gY \Psi<Space>
autocmd Filetype markdown inoremap \go \omega<Space>
autocmd Filetype markdown inoremap \gO \Omega<Space>

