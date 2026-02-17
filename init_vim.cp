" utilizando fold method como fold-marker, onde os comentários podem indicar folds
" vim:fdm=marker

" configurações básicas {{{
" não precisamos ser totalmente compatíveis com o Vi!
set nocompatible  

" habilita syntax highlight
syntax on                
" }}}

" encoding {{{
" encoding utilizado dentro do editor
set encoding=utf-8         

" encoding utilizado para os arquivos
set fileencoding=utf-8   
" }}}

" filetype {{{
" carrega plugins do filetype
filetype plugin on   

" habilita indentação do filetype
filetype indent on   
" }}}

" tabs default {{{
set tabstop=3       " número de espaços da tabulação
set softtabstop=3   " número de espaços de tabulação para edição
set shiftwidth=3    " número de espaços para usar com a indentação automática
set expandtab       " fim da guerra: use espaços ao invés de tabulações
" }}}

" visual {{{
"  número relativo da linha, salva a pátria!
set number relativenumber   

" sem ficar piscando, enche o saco
set novisualbell                          

" indenta linhas novas
set smartindent                          

" método de fold (dobras) baseado em indentação
set foldmethod=indent             

" ignora maiúsculas e minúsculas
set ignorecase                             

" destaca os termos de pesquisa que foram encontrados
set hlsearch                                 

" mostra o termo de pesquisa enquanto ele é digitado
set incsearch                               

" sempre usar linhas de status
set laststatus=2                           

" comprimento máximo do texto inserido antes de quebrar a linha
set textwidth=80                        
set colorcolumn=80

" destaca a linha que o cursor está
set cursorline	                             

" mostra os parenteses que 'casam'
set showmatch                           

" posiciona janelas divididas sempre abaixo da atual
set splitbelow	                             
" }}}

" habilita a tecla ‘líder’ como uma vírgula (,)
let mapleader=","     
