" syntax and indentation stuff
syntax on
filetype plugin indent on
" /syntax

" sets soft tabs, 4 spaces long (but cf. below when we set a ruby-specific 2-space-long tab)
set tabstop=4
set shiftwidth=4
set expandtab
" /tab
set bs=2

filetype plugin on
" highlights search results
set hlsearch
" adds line numbers
set number
" colours the 80th column (so you don't write super long lines)
set colorcolumn=80

" creates folds based on syntax parsing
set foldmethod=syntax
" doesn't unfold when accidentally navigating to the middle of a folded block
set foldopen-=block

" runs all the stuff in your ~/.vim/bundle run path;
call pathogen#infect()

" native autocomplete
set omnifunc=syntaxcomplete#Complete

" set ruby/js tab to 2 spaces
autocmd FileType ruby,js,yml,yaml setlocal sw=2 ts=2 sts=2 expandtab

autocmd FileType jenkinsfile setlocal sw=4 ts=4 sts=4 expandtab

" highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" /trailing spaces

" automatic shebangs
augroup Shebang
     autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl># -*- coding: iso-8859-15 -*-\<nl>\"|$
     autocmd BufNewFile *.sh 0put =\"#!/bin/bash\"|$
     autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\<nl># frozen_string_literal: true\<nl>\"|$
     autocmd BufNewFile *.js 0put =\"#!/usr/bin/env node\"|$
augroup END
" /shebangs

set t_Co=256
colorscheme dracula
" nerdcomments
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1

set pastetoggle=<F2>
nnoremap <C-t> :NERDTreeToggle<CR>
let g:vimspector_enable_mappings = 'HUMAN'
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>dx :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
