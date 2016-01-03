set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif 

call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet.vim'

NeoBundle 'vim-scripts/twilight'
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
let g:js_indent_typescript = 1


call neobundle#end()
filetype plugin indent on
