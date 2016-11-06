" http://qiita.com/ahiruman5/items/4f3c845500c172a02935

set encoding=utf-8
scriptencoding utf-8

set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決
set autoindent
set smartindent

set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number " 行番号を表示
set cursorline " カーソルラインをハイライト

" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

set showmatch " 括弧の対応関係を一瞬表示する
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

" バックスペースキーの有効化
set backspace=indent,eol,start

" クリップボードからペースト時のインデント無効化設定
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"
    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif 

call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet.vim'
" 静的解析
NeoBundle 'scrooloose/syntastic'

" メソッド定義元へのジャンプ
NeoBundle 'szw/vim-tags'

" 自動で閉じる
NeoBundle 'tpope/vim-endwise'

NeoBundle 'vim-scripts/twilight'
NeoBundle 'thinca/vim-ref'
NeoBundleLazy 'clausreinke/typescript-tools', {
			\ 'build' : 'npm install -g',
			\ 'autoload' : {
			\   'filetypes' : ['typescript'] }
			\}
NeoBundleLazy 'leafgarland/typescript-vim', {
			\'autoload' : {
			\'filetypes' : ['typescript'] }
			\}
NeoBundleLazy 'jason0x43/vim-js-indent', {
			\ 'autoload' : {
			\   'filetypes' : ['javascript', 'typescript', 'html'],
			\}}

NeoBundleLazy 'marcus/rsense', {
      \ 'autoload': {
      \   'filetypes': 'ruby',
      \ },
      \ }

let g:js_indent_typescript = 1
let g:rsenseUseOmniFunc = 1

" 挿入モードでTABを挿入するとき、代わりに適切な数の空白を使う
set expandtab



call neobundle#end()

" ファイル形式の検出の有効化する
" ファイル形式別プラグインのロードを有効化する
" ファイル形式別インデントのロードを有効化する
filetype plugin indent on
