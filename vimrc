set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'vim-scripts/L9'
Bundle 'vim-scripts/cscope_macros.vim'
Bundle 'scrooloose/nerdtree'
"au filetype python Bundle 'vim-scripts/Pydiction'
"Bundle 'msanders/snipmate.vim'
Bundle 'SirVer/ultisnips'
Bundle 'vim-scripts/xptemplate'
"Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'Shougo/neocomplcache'
Bundle 'vim-scripts/fakeclip'
Bundle 'corntrace/bufexplorer'
Bundle 'tpope/vim-surround'
Bundle 'c9s/gsession.vim'
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'kevinw/pyflakes-vim'
"Bundle 'vim-scripts/SuperTab'
Bundle 'ervandew/supertab'
Bundle 'vim-scripts/tir_black'
"Bundle 'therealadam/vimfiles'
"Bundle 'othree/eregex.vim'
"Bundle 'vim-scripts/OmniCppComplete'
"sudo aptitude install clang libclang-dev
Bundle 'Rip-Rip/clang_complete'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/Wombat'
Bundle 'vim-scripts/molokai'
Bundle 'vim-scripts/CCTree'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/DoxygenToolkit.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'sjl/gundo.vim'
Bundle 'kingbin/vim-arduino'
Bundle 'rking/ag.vim'
"sudo apt-get install vim-gnome
"Bundle 'kana/vim-fakeclip'
Bundle 'thinca/vim-logcat'
filetype plugin indent on


nmap <leader>U :GundoToggle<cr>
let g:gundo_preview_bottom = 1
let g:gundo_preview_height = 10
let g:gundo_width = 30

cabbrev ack ack<c-\>esubstitute(getcmdline(), '^ack\>', 'Ack!', '')<cr>
if has ("Ack") 
    copen 30 
endif

" Basic Settings:
syntax on
filetype on
filetype plugin on
filetype indent on
colors tir_black
language messages zh_TW.utf-8

"set fencs=utf-8,gbk,big5,euc-jp,utf-16le
set fencs=utf-8,gbk,big5
set fenc=utf-8 enc=utf-8 tenc=utf-8
set t_ti= t_te=
set expandtab
set shiftwidth=4
set tabstop=4
set history=1000
set nomore
set laststatus=2
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P>
set statusline=%4*%<\ %1*[%F]
set statusline+=%4*\ %5*[%{&encoding}, " encoding
set statusline+=%{&fileformat}%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]%m
set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>
set ruler
set softtabstop=4
set nobackup
set cindent
set autoindent
set smartindent
set showcmd
set helplang=Cn
set hidden
set nofoldenable
set noswapfile
set number
"set mouse=nv
set hlsearch
set incsearch
set viminfo+=h
set nocp
set t_Co=256
set backspace=indent,eol,start whichwrap+=<,>,[,]
"autocmd FileType perl set keywordprg=perldoc\ -f
"copen 25
"

"進行make的設置
map <F8> :call Do_make()<CR>
function Do_make()
    set autochdir
    set makeprg=make
    execute "silent make"
    execute "copen"
endfunction

map <F9> :call Do_makei_clean()<CR>
function Do_makei_clean()
    set autochdir
    execute "silent make clean"
endfunction

"單檔gcc compile
nmap <C-c><C-c> :call Compile_gcc()<CR>
function Compile_gcc()
    if &filetype=="c"
        set autochdir
        execute "w"
        execute "!gcc -Wall -g % -o %:r"
    elseif &filetype=="cpp"
        set autochdir
        execute "w"
        execute "!g++ -Wall -g % -o %:r"
    elseif &filetype=="java"
        set autochdir
        execute "w"
        execute "!javac %:r.java"
    endif
endfunction

"單檔RUN
nmap <C-r><C-r> :call Run_gcc()<CR>
function Run_gcc()
    if &filetype=="c"
        set autochdir
        execute "! ./%:r"
    elseif &filetype=="cpp"
        set autochdir
        execute "! ./%:r"
    elseif  &filetype=="python"
        set autochdir
        execute "w !python"
    elseif  &filetype=="php"
        "sudo aptitude install php5-cli
        set autochdir
        execute "w !php"
    elseif  &filetype=="java"
        set autochdir
        execute "w !java %:r"
    endif
endfunction

imap <F2> <C-R>=strftime("JASON - [%c]")<CR>
imap jj <ESC>
"imap ,, -><C-X><C-O>

"nnoremap <F12> :TlistToggle<CR>


nmap <silent> <F12> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30

" 删除所有行未尾空格
nnoremap <F11> :%s/[ \t\r]\+$//g<cr>

nnoremap <leader>p  :NERDTreeToggle<CR>
nnoremap <leader>ff  :FufFile<CR>
nnoremap <leader>fb  :FufBuffer<CR>

"Remove the Windows ^M
noremap <leader>m  :%s/\r//g<CR>

"eregex.vim
nnoremap ,/ :M/
nnoremap ,? :M?
"nnoremap ,/ /
"nnoremap ,? ?

nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv

"映射按鍵：剪切版、全選，系統有效  
vmap <C-c> "+y  
"vmap <C-x> "+x  
"nmap <C-v> "+gP  
"vmap <C-v> "+gP  
nmap <C-a> ggVG  

" ,p toggles paste mode
nnoremap ,p :set paste!<BAR>set paste?<CR>

" vim-logcat
nnoremap ,l :set filetype=logcat<CR>
nnoremap ,k :set filetype=<CR>

" :cd. change working directory to that of the current file
cmap cd. lcd %:p:h

function! SwitchSourceHeader()
  "update!
  if (expand ("%:e") == "cpp")
    find %:t:r.h
  else
    find %:t:r.cpp
  endif
endfunction

nmap ,s :call SwitchSourceHeader()<CR>

"nmap <F5> ^W_^W\|
"nmap <F6> ^W=
"imap <F5> <ESC>^W_^W\|a
"imap <F6> <ESC>^W=a
"nmap gF ^Wf

"setup doxygen：sudo apt-get install doxygen
map <F4>a  :DoxAuthor<CR>
map <F4>f  :Dox
map <F4>b  :DoxBlock<CR>
map <F4>l  :DoxLic<CR>
map <F4>c :odocClass<C-B>
map <F4>m :odocMember<C-B>

let g:DoxygenToolkit_authorName="Jason-Yao"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1

let g:NeoComplCache_DisableAutoComplete = 1
"let g:SuperTabRetainCompletionType = 2
"let g:SuperTabDefaultCompletionType = "<C-X><C-U>"

noremap <C-W><C-U> :CtrlPMRU<CR>
nnoremap <C-W>u :CtrlPMRU<CR>

let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1


if has("gdb")
    set splitright              
    set previewheight=60
    "set splitright             
    "set splitbelow
    set asm=0
    set gdbprg=gdb
    nmap <silent><LEADER>g :run macros/gdb_mappings.vim<cr>
    nmap <silent> <LEADER>v :bel 8 split gdb-variables<CR>
    let g:vimgdb_debug_file = ""
    run macros/gdb_mappings.vim
endif

colorscheme molokai
"hi Normal ctermfg=grey ctermbg=black
"hi Visual ctermfg=green ctermbg=black
"hi Search term=reverse cterm=standout ctermfg=green  ctermbg=yellow
"hi IncSearch term=reverse cterm=standout ctermfg=green ctermbg=yellow
"hi PmenuSel ctermbg=green ctermfg=Yellow

"python
"let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'

au filetype php set dictionary-=~/.vim/php_funclist.txt dictionary+=~/.vim/php_funclist.txt
au filetype php set complete-=k complete+=k

if has("autocmd")
   autocmd BufRead *.txt set tw=78
   autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal g'\"" |
      \ endif
endif

set cursorline
set cursorcolumn
highlight TabLineSel ctermfg=yellow ctermbg=darkblue cterm=bold
highlight StatusLine ctermfg=yellow ctermbg=darkblue cterm=bold
highlight LineNr ctermfg=yellow


imap <C-F11> <C-R>=strftime("%x %X")<BAR><CR>. owen_wen@htc.com.<ESC> <C-R>
nnoremap <F12> :TlistToggle<CR>
nnoremap <silent> <F3> :NERDTree<CR>


let g:ctrlp_clear_cache_on_exit = 0


fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map F :call ShowFuncName() <CR>


" Open .h if it's a cpp file, and vice versa.
function! OpenComplementFile()
  let f = expand('%')   " (1)
  let suffix = matchstr(f, '\.\a\+$')
  let pattern = suffix . "$"
  if suffix == '.h'
    let suffixes = ['.cpp', '.cc', '.mm', '.m', '.h']
    for suf in suffixes
      let target = substitute(f, pattern, suf, '')   " (2)
      if filereadable(target)
        break
      endif
    endfor
  elseif suffix == '.cpp' || suffix == '.cc' || suffix == '.m' || suffix == '.mm'
    let target = substitute(f, pattern, '.h', '')
    if !filereadable(target)
      let tmp = target
      let target = substitute(tmp, '\v(.+)\..+', 'public/\1.h', '')  " (3)
      if !filereadable(target)
        let target = substitute(tmp, '\v(.+)/(.+)\.(.+)', '\1/public/\2.h', '')
      endif
    endif
  else
    let target = ''
  endif

  if filereadable(target)
    exec 'vsplit ' target
  else
    echo "Complement file not found"
  endif
endfunction
nnoremap <silent> <F4> :call OpenComplementFile()<CR>


hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue
                
"let g:agprg="<custom-ag-path-goes-here> --column"
"
"
au FileType qf call AdjustWindowHeight(3, 20)
function! AdjustWindowHeight(minheight, maxheight)
   let l = 1
   let n_lines = 0
   let w_width = winwidth(0)
   while l <= line('$')
       " number to float for division
       let l_len = strlen(getline(l)) + 0.0
       let line_width = l_len/w_width
       let n_lines += float2nr(ceil(line_width))
       let l += 1
   endw
   exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction
