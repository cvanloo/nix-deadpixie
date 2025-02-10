unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Welcome to the current millennium
set nocompatible
"set termguicolors
set term=xterm-256color
"set term=xterm-true-color
set t_Co=256
set t_ut=
syntax on
set showcmd

function! s:tweak_simple_dark_colors()
    hi NonText ctermfg=8 ctermbg=Black guibg=Black
    hi SpecialKey ctermfg=8 ctermbg=Black guibg=Black
    ""hi ColorColumn ctermfg=240 ctermbg=black gui=NONE
    "hi ColorColumn ctermfg=234 ctermbg=231 gui=NONE
    ""hi ColorColumn ctermfg=234 ctermbg=black guifg=#1a1a1a guibg=Black

    hi ColorColumn cterm=NONE ctermfg=NONE ctermbg=233 gui=NONE guifg=NONE guibg=#0a0a0a
endfunction

autocmd! ColorScheme simple-dark call s:tweak_simple_dark_colors()

"colorscheme badwolf
colorscheme simple-dark

let mapleader=' '
nnoremap <leader>pv :Ex<CR>
nnoremap <leader>nh :nohl<CR>
xnoremap <leader>p "_dP
nnoremap <C-j> :cnext<CR>zz
nnoremap <C-k> :cprev<CR>zz
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" LINE NUMBERS:
set rnu nu
set colorcolumn=80,120
set cursorline
"hi CursorLine cterm=NONE ctermbg=17 ctermfg=NONE
"hi CursorLineNr term=bold cterm=bold ctermfg=012 gui=bold
"hi CursorLineNr term=bold cterm=bold gui=bold

" AUTOCOMPLETION:
"set path+=**
set path=**
set wildmenu

" GENERAL:
set smartindent autoindent
set incsearch hlsearch " :nohlsearch
set hidden

" INVISIBLE CHARS:
"let &listchars="eol:↲,tab: ,space:·,lead:·,trail:~,extends:>,precedes:<,"
"set listchars=eol:↲,tab:\ ,space:·,lead:\·,trail:~,extends:>,precedes:<,
set listchars=eol:↲,tab:󰌒\ ,space:·,lead:·,trail:·,extends:»,precedes:«,
set list

" SNIPPETS:
nnoremap ,html :-1read $HOME/.vim/skeleton/html<CR>5jf>a

imap <C-l> λ
imap <C-e> ◊

map <C-\> :wa<CR> :make<CR>

command! MakeTags !ctags -R .

set tabstop=4 shiftwidth=4 expandtab
set scrolloff=8 sidescrolloff=8
set conceallevel=3
set spelllang=de,en,cjk spell " cjk doesn't actually add spell checking, only suppresses errors

command! MakeTags !ctags -R .

if has('gui_running')
    nnoremap <silent> <Esc> :
else
    augroup escape_mapping
        autocmd TermResponse * nnoremap <Esc> :
    augroup END
end
