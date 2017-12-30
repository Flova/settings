set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'yggdroot/indentline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


Plugin 'wincent/command-t'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'

Plugin 'godlygeek/tabular'
Plugin 'valloric/youcompleteme'


Plugin 'lervag/vimtex'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'

"autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on    " required
filetype on                  " required
"execute pathogen#infect()

" Everything will break if you remove solarized!!!!111elf!
"colorscheme solarized
"set background=dark
" colorscheme thinkpad

set grepprg=grep\ -nH\ $*

" custom tex compilation command
command T !~/.vim/build_tex.py %:t

let g:flake8_show_quickfix=0  " don't show
let g:airline_powerline_fonts = 1

let g:indentLine_setConceal = 0

set number

set tabstop=2
set shiftwidth=4
set expandtab
set autoindent
set mouse=a

set laststatus=2
set clipboard=unnamedplus

" Keymaps
nmap <F3> :call Flake8()<CR>
nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F2> :CommandT<CR>


syntax on

" highlight current line
"set cursorline
"hi CursorLine cterm=None ctermbg=253


" spell checking
"setlocal spell spelllang=en_us


" disable ycm for python  (in favor of jedi)
let g:ycm_filetype_blacklist = {'python': 1}

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/bin/python2'
" let g:ycm_autoclose_preview_window_after_completion=1
" nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" let g:ycm_key_invoke_completion = '<C-n>'


" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_flake8_args = '--ignore=D203'

" indentline config
" marks Tablevels
"
let g:indentLine_color_gui = '#A4E57E' " GVim
let g:indentLine_color_term = 244 " Vim
let g:indentLine_char = '┆'

au BufNewFile,BufRead *.py
  \let g:indentLine_enabled = 1


" Use Return and Delete keys in normal mode like in insert mode
"
function! Delete_key(...)
  let line=getline (".")
  if line=~'^\s*$'
    execute "normal dd"
    return
  endif
  let column = col(".")
  let line_len = strlen (line)
  let first_or_end=0
  if column == 1
    let first_or_end=1
  else
    if column == line_len
      let first_or_end=1
    endif
  endif
  execute "normal i\<DEL>\<Esc>"
  if first_or_end == 0
    execute "normal l"
  endif
endfunction
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
