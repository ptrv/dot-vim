" .vimrc
" author: ptrv <mail@petervasil.net>

" Preamble {{{

lang en_US.UTF-8

set nocompatible                  " Must come first because it changes other options.

filetype off
call pathogen#incubate()
call pathogen#helptags()
syntax on                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.
" }}}

" basics ---------------------------------------------------------------- {{{
set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest,list:full    " Complete files like a shell.

set cursorline

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=4                    " Global tab width.
set shiftwidth=4                 " And again, related.
"set tabstop=2                    " Global tab width.
"set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

"set relativenumber
"set undofile

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" Or use vividchalk
" colorscheme topfunky-light
" colorscheme default
colorscheme github

set autochdir " always switch to the current file directory

set history=1000
" }}}

" mappings {{{

let mapleader=","
let maplocalleader="\\"

map <silent> <unique> <Leader>cr <Plug>RooterChangeToRootDirectory

map <Leader>O :MRU<Enter>
map <Leader>o :TRecentlyUsedFiles<Enter>

map <Leader><tab> :Scratch<Enter>

"map <Leader>be :BufExplorer<Enter>

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby set foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
" autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" Mappings
vmap > >gv
vmap < <gv
" vmap <Tab> >gv
" vmap <S-Tab> <gv

imap <Tab> <C-N>

map <C-S-left> :bp<Enter>
map <C-S-right> :bn<Enter>

map <S-Enter> O<Esc>j
map <C-CR> o<Esc>k

" Keep search matches in the middle of the window and pulse the line when moving
" to them.
nnoremap n nzzzv
nnoremap N Nzzzv

inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Ack for the last search.
nnoremap <silent> <leader>? :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

" Substitute
nnoremap <leader>s :%s//<left>

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" " Fix linewise visual selection of various text objects
" nnoremap VV V
" nnoremap Vit vitVkoj
" nnoremap Vat vatV
" nnoremap Vab vabV
" nnoremap VaB vaBV

" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

nnoremap <leader>a <Esc>:Ag!<cr>

nnoremap <leader>q gqip
nnoremap <leader>v V`]

nnoremap <leader>wv <C-w>v<C-w>l
nnoremap <leader>ws <C-w>s<C-w>j

" Source
vnoremap <leader>S y:execute @@<cr>
nnoremap <leader>S ^vg_y:execute @@<cr>

" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

nnoremap <leader><space> :noh<cr>
" nnoremap <tab> %

map <leader>cd :cd %:p:h<CR>:pwd<CR>

" vimdiff movement
nmap <F7> [czz 
nmap <F8> ]czz
"nmap <F2> do
""nmap <F3> dp

" Quick editing --------------------------------------------------------- {{{

"nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>ev :e $HOME/.vim/vimrc<cr>

" nnoremap <leader>ev <C-w>v<C-w>j:e $MYVIMRC<cr>
" nnoremap <leader>es <C-w>v<C-w>j:e ~/.vim/snippets/<cr>
" nnoremap <leader>eo <C-w>v<C-w>j:e ~/Dropbox/Org<cr>4j
" nnoremap <leader>eg <C-w>v<C-w>j:e ~/.gitconfig<cr>
" nnoremap <leader>eh <C-w>v<C-w>j:e ~/.hgrc<cr>
" nnoremap <leader>ez <C-w>v<C-w>j:e ~/.zshrc<cr>
nnoremap <leader>eg :e ~/.gitconfig<cr>
nnoremap <leader>eh :e ~/.hgrc<cr>
nnoremap <leader>ez :e ~/.zshrc<cr>

" }}}

map <Leader>md :%!markdown --html4tags<cr>

" vnoremap Y Y`><esc>

" vimdiff current vs git head (fugitive extension)
nnoremap <Leader>gd :Gdiff<cr> 
" switch back to current file and closes fugitive buffer
nnoremap <Leader>gD :diffoff!<cr><c-w>h:bd<cr>

" nmap <F12> :Gstatus<cr>

" Text bubbling --------------------------------------------------------- {{{

" Bubble single line
" nmap <C-Up> ddkP
" nmap <C-Down> ddp
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
" vmap <C-Up> xkP`[V`]
" vmap <C-Down> xp`[V`]
vmap <C-Up> [egv
vmap <C-Down> ]egv

" }}}

" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <leader>] :bn<CR>
nnoremap <silent> <leader>[ :bp<CR>

" if has("gui_macvim")
"   macmenu &File.New\ Tab key=<nop>
"   map <D-t> <Plug>PeepOpen
" end

" }}}

" abbreviations--------------------------------------------------------- {{{

ab teh the

iab <expr> ttstamp strftime("[%Y-%m-%d %H:%T]")
" iab <expr> dddate strftime("[%Y-%m-%d %a]")

" }}}

" window stuff ---------------------------------------------------------- {{{

" " from gary berhard
" set winwidth=84
" " We have to have a winheight bigger than we want to set winminheight. But if
" " we set winheight to be huge before winminheight, the winminheight set will
" " fail.
" set winheight=5
" set winminheight=5
" set winheight=999
 
" }}}

" functions {{{

if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
ruby << EOF
  def open_uri
    re = %r{(?i)\b((?:[a-z][\w-]+:(?:/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))}

    line = VIM::Buffer.current.line

    if url = line[re]
      system("open", url)
      VIM::message(url)
    else
      VIM::message("No URI found in line.")
    end
  end
EOF
    elseif s:uname == "Linux\n"
ruby << EOF
  def open_uri
    re = %r{(?i)\b((?:[a-z][\w-]+:(?:/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))}

    line = VIM::Buffer.current.line

    if url = line[re]
      system("xdg-open", url)
      VIM::message(url)
    else
      VIM::message("No URI found in line.")
    end
  end
EOF
    endif
endif

if !exists("*OpenURI")
  function! OpenURI()
    :ruby open_uri
  endfunction
endif
map <Leader>b :call OpenURI()<CR>

" Shell ------------------------------------------------------------------- {{{

function! s:ExecuteInShell(command) " {{{
    let command = join(map(split(a:command), 'expand(v:val)'))
    let winnr = bufwinnr('^' . command . '$')
    silent! execute  winnr < 0 ? 'botright vnew ' . fnameescape(command) : winnr . 'wincmd w'
    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap nonumber
    echo 'Execute ' . command . '...'
    silent! execute 'silent %!'. command
    silent! redraw
    silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>:AnsiEsc<CR>'
    silent! execute 'nnoremap <silent> <buffer> q :q<CR>'
    silent! execute 'AnsiEsc'
    echo 'Shell command ' . command . ' executed.'
endfunction " }}}
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)
nnoremap <leader>! :Shell 

" }}}

" Whitespace {{{
function ShowSpaces(...)
    let @/='\v(\s+$)|( +\ze\t)'
    let oldhlsearch=&hlsearch
    if !a:0
        let &hlsearch=!&hlsearch
    else
        let &hlsearch=a:1
    end
    return oldhlsearch
endfunction

function TrimSpaces() range
    let oldhlsearch=ShowSpaces(1)
    execute a:firstline.",".a:lastline."substitute ///gec"
    let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <F12>     :ShowSpaces 1<CR>
nnoremap <S-F12>   m`:TrimSpaces<CR>``
vnoremap <S-F12>   :TrimSpaces<CR>
" }}}

" }}}

" misc ------------------------------------------------------------------ {{{

if has("win32")
  "Windows options here
else
    if has("unix")
        let s:uname = system("uname")
        if s:uname == "Darwin\n"
            "Mac options here
            set shell=/usr/local/bin/zsh
        elseif s:uname == "Linux\n"
            set runtimepath+=/usr/local/share/vim/addons
        endif
    endif
endif
 
let g:yankring_history_dir = '$HOME/.vim/tmp'

" Syntastic {{{
let g:syntastic_check_on_open=1
" }}}


" TagList {{{
let Tlist_Ctags_Cmd='/usr/local/bin/ctags' 
let Tlist_Show_Menu = 1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 40
" }}}

" let g:SuperTabDefaultCompletionType = '<c-n>'

" }}}

" filetype-specific stuff ----------------------------------------------- {{{

augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    " au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl set filetype=glsl

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff <wouter@blub.net>
augroup encrypted
    au!
    " First make sure nothing is written to ~/.viminfo while editing
    " an encrypted file.
    autocmd BufReadPre,FileReadPre *.gpg set viminfo=
    " We don't want a swap file, as it writes unencrypted data to disk
    autocmd BufReadPre,FileReadPre *.gpg set noswapfile
    " Switch to binary mode to read the encrypted file
    autocmd BufReadPre,FileReadPre *.gpg set bin
    autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
    autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null
    " Switch to normal mode for editing
    autocmd BufReadPost,FileReadPost *.gpg set nobin
    autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
    autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")
    " Convert all text to encrypted text before writing
    autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
    " Undo the encryption so we are back in the normal text, directly
    " after the file has been written.
    autocmd BufWritePost,FileWritePost *.gpg u

augroup END

" }}}
