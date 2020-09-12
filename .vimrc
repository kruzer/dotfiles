"source $VIMRUNTIME/defaults.vim 
" SETTINGS FOR VUNDLE:
" 
set nocompatible              " be iMproved, required
filetype off                 " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'wikitopian/hardmode'
" Typescript
Plugin 'leafgarland/typescript-vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"

let g:UltiSnipsEditSplit="vertical"

call vundle#end()            " required
filetype plugin indent on    " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Status Line:
"colorscheme apprentice
set background=dark
colorscheme fu
set laststatus=2
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

"
" My Settings:
syntax on
" umożliwia zmiane bufora bez zapisu starego
set hidden
"set term=xterm-256color

" Line Numbers:
set number relativenumber
"augroup numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END

" Search down into subfolders - tab completion
set path+=**
" Display all matching files when we tab complete
set wildmenu 
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>
"noremap h <NOP>
"noremap l <NOP>
"noremap k <NOP>
"noremap j <NOP>
" Tweaks for browsing
let g:netrw_banner=0	" disable banner
let g:netrw_browse_split=4	" open in prior window
let g:netrw_altv=1		" open split to the right
let g:netrw_liststyle=3		" treeview
let g:netrw_winsize=22

" put .files.swp into tmp folder
set directory^=$HOME/.vim/tmp//
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" TabStops
" 'tabstop' changes the width of the TAB character, plain and simple.
" 'shiftwidth' affects what happens when you press >>, << or ==. It also
" affects how automatic indentation works.
"
set shiftwidth=2
set tabstop=2
"set colorcolumn=81

" automatycznie ustawione dla komentarzy git'a
autocmd FileType gitcommit set textwidth=72
autocmd FileType gitcommit set colorcolumn=73
set list
"set listchars=tab:»\ ,trail:.,extends:\#,nbsp:.
set hlsearch
set incsearch
"set listchars=tab:>·,trail:~,extends:>,precedes:<
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
"set list
hi NonText ctermfg=8 guifg=#4a4a59
hi SpecialKey ctermfg=16 guifg=#4a4a59
map <F9> :w<CR>:make -C build<CR>
map <F10> :make test -C build<CR>
map <F3> :resize +1<CR>
map <F4> :resize -1<CR>
