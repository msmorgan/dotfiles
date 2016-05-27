set shortmess+=I
set laststatus=2
set mouse=a

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'

call vundle#end()

filetype plugin indent on
syntax on

set number
set relativenumber

set softtabstop=4
set shiftwidth=4
set expandtab

set listchars=tab:>-,trail:~,eol:$,extends:>,precedes:<,nbsp:%
noremap <F11> :set list!<CR>

set encoding=utf-8
set guifont=Roboto\ Mono\ for\ Powerline\ 10
let g:Powerline_symbols='fancy'
let g:airline_powerline_fonts=1

augroup filetype
    au! BufRead,BufNewFile *.ll     set filetype=llvm
    au! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END

" Append modeline after last line in buffer.
" " Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" " files.
function! AppendModeline()
    if (&expandtab)
        let l:modeline = printf(" vim: set et sts=%d sw=%d tw=%d :",
                               \&softtabstop, &shiftwidth, &textwidth)
    else
        let l:modeline = printf(" vim: set noet ts=%d sw=%d tw=%d :",
                               \&tabstop, &shiftwidth, &textwidth)
    endif
    let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
    call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" vim: set et sts=4 sw=4 tw=78 :
