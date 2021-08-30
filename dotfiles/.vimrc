""" Color Settings
syntax enable       " enable syntax processing
colorscheme elflord

""" disable syntax highlighting when opened in diff mode
""" this is to solve the issue of hard to read texts with similar diff colors
if &diff
    syntax off
endif 

""" Spaces and Tabs
set smartindent

""" Display Settings
set number	        " line number
set showcmd         " show command in bottom bar
set showmatch       " highlight matching brackets

""" show trailing whitespace
" set list
set listchars=tab:>-,trail:·,nbsp:·

""" Cursor line
set cursorline      " highlight current line
hi clear CursorLine 
hi CursorLine gui=underline cterm=underline term=underline
" hi CursorLine term=NONE cterm=NONE ctermbg=DarkGrey ctermfg=Black

""" Search Settings
set ignorecase      " ignore case
set incsearch       " search as characters are entered
set hlsearch        " highlight matches

""" Autocomplete Settings
set wildmenu        " visual autocomplete for command menu

""" Code Folding
set foldmethod=syntax                   " fold the code based on syntax
autocmd BufNewFile,BufRead * normal zR

""" Setting the statusline
set laststatus=2        " showing the status line always
set statusline=
set statusline+=\%f                                             " showing file path with     respect to current directory
set statusline+=\%r                                             " showing read-only stat    us as [RO]
set statusline+=\%m                                             " showing modified statu    s as [+]
set statusline+=%=                                              " separation between lef    t and right column
set statusline+=\%y                                             " showing file type in b    uffer as [vim]
set statusline+=\[%{&fileencoding?&fileencoding:&encoding}\]    " showing file encoding
set statusline+=\[%{&fileformat}\]                              " showing file format
set statusline+=\[%l:%c\]                                       " showing line number an    d column
set statusline+=\[%p%%]                                         " show line percentage

""" moving lines up/down [Command --> ctrl + shift + up/down]
nnoremap <C-S-Up> :m-2<CR>
nnoremap <C-S-Down> :m+<CR>
inoremap <C-S-Up> <Esc>:m-2<CR>
inoremap <C-S-Down> <Esc>:m+<CR>

""" Show function name [Command --> shift + f]
fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map <S-f> :call ShowFuncName() <CR> 