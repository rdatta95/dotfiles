""" Color settings
set background=dark

""" set colorscheme
if 0 == 1                                                       " dummy case for easy re-ordering
    colorscheme blue
elseif filereadable(expand("~/.vim/colors/gruvbox.vim"))        " gruvbox: 
    colorscheme gruvbox
elseif filereadable(expand("~/.vim/colors/twilight256.vim"))    " twilight256: 
    colorscheme twilight256
else                                                            " default
    colorscheme industry
endif

""" set diff mode colorscheme
if &diff
    if 0 == 1                                                   " dummy case for easy re-ordering
        colorscheme blue
    elseif filereadable(expand("~/.vim/colors/gruvbox.vim"))    " gruvbox: 
        colorscheme gruvbox
    else                                                        " default
        colorscheme industry
    endif
endif

""" Syntax enable
syntax enable           " enable syntax processing

""" Spaces and tab settings
set tabstop=4           " Number of spaces <tab> counts for.
set shiftwidth=4
set expandtab           " TAB expansion
set smartindent

""" Display settings
set number
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
" hi CursorLine term=NONE cterm=NONE ctermbg=DarkGrey ctermfg=Black
hi clear CursorLine
hi CursorLine gui=underline cterm=underline term=underline
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching brackets 

""" Code Folding
set foldmethod=syntax   " fold the code based on syntax
autocmd BufNewFile,BufRead * normal zR

""" Search settings
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase

""" Setting the statusline
set laststatus=2        " showing the status line always
set statusline=
set statusline+=\%f                                             " showing file path with respect to current directory
set statusline+=\%r                                             " showing read-only status as [RO]
set statusline+=\%m                                             " showing modified status as [+]
set statusline+=%=                                              " separation between left and right column
set statusline+=\%y                                             " showing file type in buffer as [vim]
set statusline+=\[%{&fileencoding?&fileencoding:&encoding}\]    " showing file encoding
set statusline+=\[%{&fileformat}\]                              " showing file format
set statusline+=\[%l:%c\]                                       " showing line number and column
set statusline+=\[%p%%]                                         " show line percentage

""" Highlight lines in red which go over 80 characters
highlight ColorColumn ctermbg=7 guibg=#aaaaaa
""" highlight ColorColumn ctermbg=233 guibg=#aaaaaa
""" let &colorcolumn="81,121"

""" moving lines up/down with ctrl + shift + up/down
nnoremap <C-S-Up> :m-2<CR>
nnoremap <C-S-Down> :m+<CR>
inoremap <C-S-Up> <Esc>:m-2<CR>
inoremap <C-S-Down> <Esc>:m+<CR>

""" show trailing whitespace
" set list
set listchars=tab:>-,trail:·,nbsp:·

""" Show function name
fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map <S-f> :call ShowFuncName() <CR>
