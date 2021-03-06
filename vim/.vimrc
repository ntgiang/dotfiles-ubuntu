" vim home
let s:vim_home=expand("~/.vim")

"*****************************************************************************
" vim-plug install packages
"*****************************************************************************
" install vim-plug
let s:bundle_home=s:vim_home."/bundle"
let s:plug_tool_home=s:bundle_home."/vim-plug"
if !isdirectory(s:plug_tool_home."/.git")
    silent exec "!mkdir -p ".s:bundle_home
    silent exec "!git clone https://github.com/jwhitley/vim-plug.git ".s:plug_tool_home
    let s:bootstrap=1
endif
exec "set rtp+=".s:plug_tool_home
call plug#begin(s:bundle_home)

" let vim-plug manage itself
Plug 'jwhitley/vim-plug'

" control
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'simnalamburt/vim-mundo'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-vinegar'
Plug 'krisajenkins/vim-pipe'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'

" auto complete
Plug 'Valloric/YouCompleteMe', {'do': 'python2 install.py'}
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
Plug 'scrooloose/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" editor
Plug 'scrooloose/nerdcommenter'
Plug 'hlissner/vim-multiedit'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'vim-scripts/Smart-Tabs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'djoshea/vim-autoread'
Plug 'tmhedberg/matchit'
Plug 'osyo-manga/vim-over'
Plug 'hlissner/vim-multiedit'
Plug 'sjl/gundo.vim'

" csv
Plug 'chrisbra/csv.vim'

" hex
Plug 'fidian/hexmode'

" nodejs
Plug 'moll/vim-node'
Plug 'sidorares/node-vim-debugger'

" jade
Plug 'digitaltoad/vim-jade'

" javascript
Plug 'walm/jshint.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'

" html
Plug 'othree/html5-syntax.vim'
Plug 'othree/html5.vim'

" css
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'

" markdown
Plug 'gabrielelana/vim-markdown'

" git
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'renyard/vim-git-flow-format'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit', { 'branch': 'next' }

" rest tool
Plug 'diepm/vim-rest-console'

" search
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'rking/ag.vim'
Plug 'gabesoft/vim-ags'

" theme
Plug 'altercation/vim-colors-solarized'

if exists("s:bootstrap") && s:bootstrap
    unlet s:bootstrap
    autocmd VimEnter * PlugInstall
endif
call plug#end()


"*****************************************************************************
" basic setup
"*****************************************************************************
" encoding
" set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" map control keys
" let mapleader=','
nnoremap ; :

" fix backspace indent
set backspace=indent,eol,start

" enable hidden buffers
set hidden

" directories for swp files
set nobackup
set noswapfile

" undo settings
exec "set undodir=".s:vim_home."/undofiles"
set undofile

" turn off compatible with vi
set nocompatible

" show line number
set number

" terminal
" set shell=zsh
" tnoremap <Esc> <C-\><C-n>

" always show status bar
set laststatus=2

" turn on syntax
syntax on

" vim color
set t_Co=256

" hightlight current line
" set cursorline

" better scrolling
set ttyfast
set lazyredraw

" hightlight matched pair
set showmatch

" hide mode (normal, insert)
set noshowmode

" interval update time
set updatetime=250

" copy to clipboard
vnoremap <leader>y  "+y
nnoremap <leader>Y  "+yg_
nnoremap <leader>y  "+y
nnoremap <leader>yy "+yy

" paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" search
set grepprg=ag\ --nogroup\ --nocolor
set hlsearch
set ignorecase

" theme
" colorscheme colorsbox-material

" buffers
nnoremap <silent><tab> :bnext<CR>
nnoremap <silent><s-tab> :bprevious<CR>
" nnoremap <silent><leader>bq :BD<CR>
nnoremap <C-w> :bwipeout<CR>
nnoremap <silent><leader>bn :enew<CR>
nnoremap <silent><leader>abq :bufdo bd<CR>

" set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" load ftplugins and indent files
filetype plugin indent on
filetype indent on

" switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" useful mapping keys
nnoremap <buffer> k gk
nnoremap <buffer> j gj
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" show preview windows at bottom
function! PreviewDown()
   if !&previewwindow
       silent! wincmd P
   endif
   if &previewwindow
       silent! wincmd J
       silent! wincmd p
   endif
endf
au BufWinEnter * call PreviewDown()

" session automatically load and save session on start/exit.
function! MakeSession()
    if g:sessionfile != ""
        echo "Saving."
        if (filewritable(g:sessiondir) != 2)
            exe "silent !mkdir -p ".g:sessiondir
            redraw!
        endif
        exe "mksession! ".g:sessionfile
    endif
endfunction
function! LoadSession()
    if argc() == 0
        let g:sessiondir = s:vim_home."/sessions".getcwd()
        let g:sessionfile = g:sessiondir."/session.vim"
        if (filereadable(g:sessionfile))
            exe "source ".g:sessionfile
        else
            echo "No session loaded."
        endif
    else
        let g:sessionfile = ""
        let g:sessiondir = ""
    endif
endfunction
au VimEnter * nested :call LoadSession()
au VimLeave * :call MakeSession()

" toggle vexplore
fun! VexToggle()
    if exists("t:vex_buf_nr")
        call VexClose()
    else
        call VexOpen()
    endif
endf
fun! VexOpen()
    let g:netrw_browse_split=4    " open files in previous window
    let vex_width = 25
    execute "Vexplore " . getcwd()
    let t:vex_buf_nr = bufnr("%")
    wincmd H
    call VexSize(vex_width)
endf
fun! VexClose()
    let cur_win_nr = winnr()
    let target_nr = ( cur_win_nr == 1 ? winnr("#") : cur_win_nr )
    1wincmd w
    close
    unlet t:vex_buf_nr
    execute (target_nr - 1) . "wincmd w"
    call NormalizeWidths()
endf
fun! VexSize(vex_width)
    execute "vertical resize" . a:vex_width
    set winfixwidth
    call NormalizeWidths()
endf
fun! NormalizeWidths()
    let eadir_pref = &eadirection
    set eadirection=hor
    set equalalways! equalalways!
    let &eadirection = eadir_pref
endf
map <silent><leader><F3> :call VexToggle()<CR>
let g:netrw_liststyle=3         " thin (change to 3 for tree)
let g:netrw_banner=0            " no banner
let g:netrw_altv=1              " open files on right
let g:netrw_preview=1           " open previews vertically

" don't wrap line
" set nowrap

" tab options
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" list
set list

"*****************************************************************************
" plugins configuration
"*****************************************************************************
" NERDTree
noremap <silent><F2> :NERDTreeToggle<CR>
nnoremap <silent><leader><F2> :NERDTreeFind<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" close all open buffers on entering a window if the only buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
        if bufwinnr(t:NERDTreeBufName) != -1
            if winnr("$") == 1
                q
            endif
        endif
    endif
endfunction
" close nerdtree on selection of a file
let NERDTreeQuitOnOpen=1
" Focus tree on the file opened
autocmd BufEnter * lcd %:p:h

" tagbar
map <F8> :TagbarToggle<CR>

" airline
let g:airline_extensions = []
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#format = 'Git_flow_branch_format'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:bufferline_echo = 0

" ctrlp
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_use_caching = 0
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>bl :CtrlPBuffer<CR>
" Show open files
noremap <leader>l :CtrlPBuffer<CR>
" Show history
noremap <leader>h :CtrlPMRUFiles<CR>
" Show tags
noremap <leader>t :CtrlPTag<CR>
"let g:ctrlp_map = '<leader>e'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_dont_split = 'NERD_tree_2'

" tern on vim
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1
let g:tern_map_keys = 1
au FileType javascript nmap <buffer> td  :TernDef<cr>
au FileType javascript nmap <buffer> tb  :TernDocBrowse<cr>
au FileType javascript nmap <buffer> tt  :TernType<cr>
au FileType javascript nmap <buffer> to  :TernDoc<cr>
au FileType javascript nmap <buffer> tpd :TernDefPreview<cr>
au FileType javascript nmap <buffer> tsd :TernDefSplit<cr>
au FileType javascript nmap <buffer> ttd :TernDefTab<cr>
au FileType javascript nmap <buffer> tr  :TernRefs<cr>
au FileType javascript nmap <buffer> tR  :TernRename<cr>

" youcompleteme
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion = 4

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1

" jshint
" enable/disable
nnoremap <F1> :SyntasticToggleMode<CR>

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" :h g:incsearch#auto_nohlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" fuzzy incsearch
map z/  <Plug>(incsearch-easymotion-/)
map z?  <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)

" incsearch.vim x fuzzy x vim-easymotion
function! s:config_easyfuzzymotion(...) abort
    return extend(copy({
    \    'converters': [incsearch#config#fuzzy#converter()],
    \    'modules': [incsearch#config#easymotion#module()],
    \    'keymap': {"\<CR>": '<Over>(easymotion)'},
    \    'is_expr': 0,
    \    'is_stay': 1
    \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

" gundo
nnoremap <silent><F5> :GundoToggle<CR>
let g:gundo_right = 1

" better-whitespaces
autocmd BufWritePre * StripWhitespace

" git
noremap <leader>ga  :Gwrite<CR>
noremap <leader>gR  :Gread<CR>
noremap <leader>gc  :Gcommit<CR>
noremap <leader>gca :Gcommit --amend<CR>
noremap <leader>gsh :Gpush<CR>
noremap <leader>gll :Gpull<CR>
noremap <leader>gs  :Gstatus<CR>
noremap <leader>gb  :Gblame<CR>
noremap <leader>gd  :Gvdiff<CR>
noremap <leader>gr  :Gremove<CR>

" easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" ctrlsf
nmap f/ <Plug>CtrlSFPrompt
vmap f/ <Plug>CtrlSFVwordPath
nmap <silent><F3> :CtrlSFToggle<CR>

" indent
set list lcs=tab:\¦\ " need a space here

" rest
let g:vrc_cookie_jar = '/tmp/vrc_cookie_jar'

" neco-ghc
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:necoghc_enable_detailed_browse = 1
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Change Conceal Behaviour (I like to show quotes around stuff just like text)
let g:indentLine_noConcealCursor=""
let g:indentLine_concealcursor = 'vc'
let g:indentLine_conceallevel = 0


" For speed
let loaded_matchparen=1 " Don't load matchit.vim (paren/bracket matching)
set noshowmatch         " Don't match parentheses/brackets
set nocursorline        " Don't paint cursor line
set nocursorcolumn      " Don't paint cursor column
set scrolljump=8        " Scroll 8 lines at a time at bottom/top
let html_no_rendering=1 " Don't render italic, bold, links in HTML

