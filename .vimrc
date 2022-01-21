"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
"cntl-e NERDTreeを開く
nnoremap <silent><C-e> :NERDTreeToggle<CR>
"クリップボード
set clipboard+=unnamed


" 見た目系
"カーソルが何行目の何列目に置かれているか
set ruler
" 行番号を表示
set number
" set relativenumber
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
nnoremap <C-a> ^
nnoremap <C-s> $
nnoremap <C-k> d$
nnoremap <CR> A<CR><ESC>
nnoremap ; :
noremap ; :
nnoremap Q <Nop>
nnoremap <Space> %
inoremap <C-f> <Right>
inoremap <C-B> <Left>


"テーマ変更
" colorscheme alduin 
" set background=dark
colorscheme iceberg
syntax on
set t_Co=256
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" インデントに色付け
" let g:indent_guides_enable_on_vim_startup = 1
" hi IndentGuidesOdd  ctermbg=black
" hi IndentGuidesEven ctermbg=darkgrey
" let g:indent_guides_auto_colors = 0
" set ts=4 sw=4 et
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1

augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END


" 言語ごとにServerが実行されたらする設定を関数化
function! s:configure_lsp() abort
  setlocal omnifunc=lsp#complete   " オムニ補完を有効化
  " LSP用にマッピング
  nnoremap <buffer> <C-]> :<C-u>LspDefinition<CR>
  nnoremap <buffer> gd :<C-u>LspDefinition<CR>
  nnoremap <buffer> gD :<C-u>LspReferences<CR>
  nnoremap <buffer> gs :<C-u>LspDocumentSymbol<CR>
  nnoremap <buffer> gS :<C-u>LspWorkspaceSymbol<CR>
  nnoremap <buffer> gQ :<C-u>LspDocumentFormat<CR>
  vnoremap <buffer> gQ :LspDocumentRangeFormat<CR>
  nnoremap <buffer> K :<C-u>LspHover<CR>
  nnoremap <buffer> <F1> :<C-u>LspImplementation<CR>
  nnoremap <buffer> <F2> :<C-u>LspRename<CR>
endfunction
let g:lsp_diagnostics_enabled = 0  " 警告やエラーの表示はALEに任せるのでOFFにする

" todoリストを簡単に入力する
abbreviate tl - [ ]

" todoリストのon/offを切り替える
nnoremap <buffer> <Leader><Leader> :call ToggleCheckbox()<CR>

function! ToggleCheckbox()
  let l:line = getline('.')
  if l:line =~ '^\-\s\[\s\]'
    let l:result = substitute(l:line, '^-\s\[\s\]', '- [x]', '')
    call setline('.', l:result)
  elseif l:line =~ '^\-\s\[x\]'
    let l:result = substitute(l:line, '^-\s\[x\]', '- [ ]', '')
    call setline('.', l:result)
  end
endfunction

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'epilande/vim-react-snippets'
Plugin 'sheerun/vim-polyglot'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'simeji/winresizer'
Plugin 'tpope/vim-markdown'
" Plugin 'Shougo/vimproc.vim'
Plugin 'joonty/vdebug.git'

call vundle#end()
filetype plugin indent on

"　その他のカスタム設定を以下に書く
let g:airline_theme = 'bubblegum'
let g:winresizer_start_key = '<C-Q>'

let g:user_emmet_settings = {
\  'variables' : {
\    'lang' : "ja"
\    },
\
\  'html' : {
\    'indentation' : '  ',
\    'snippets' : {
\      'html': "<!DOCTYPE html>\n"
\        ."<html lang=\"${lang}\">\n"
\        ."<head>\n"
\        ."\t<meta charset=\"${charset}\">\n"
\        ."\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"
\        ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n"
\        ."\t<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css\" integrity=\"sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk\" crossorigin=\"anonymous\">\n"
\        ."\t<title></title>\n"
\        ."\t<link rel=\"stylesheet\" href=\"css/style.css\">\n"
\        ."</head>\n"
\        ."<body>\n\n\n"
\        ."\t${child}\n"
\        ."\t<script src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js\" integrity=\"sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj\" crossorigin=\"anonymous\"></script>\n"
\        ."\t<script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js\" integrity=\"sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo\" crossorigin=\"anonymous\"></script>\n"
\        ."\t<script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js\" integrity=\"sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI\" crossorigin=\"anonymous\"></script>\n"
\        ."</body>\n"
\        ."</html>",
\    }
\  },
\}

" Plugin key-mappings.
" snippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"set snippet file dir
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/,~/.vim/snippets'

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" ========Vdebug======== "
let g:vdebug_options= {
\    "port" : 9000,
\    "server" : 'localhost',
\    "on_close" : 'detach',
\    "break_on_open" : 0,
\    "remote_path" : "",
\    "debug_window_level" : 0,
\    "debug_file_level" : 0,
\    "debug_file" : "",
\    "path_maps" : {
\       '/var/www/html' : '/Users/haradakazunari/docker/htdocs',
\    },
\    "window_arrangement" : ["DebuggerWatch", "DebuggerStack"]
\}
