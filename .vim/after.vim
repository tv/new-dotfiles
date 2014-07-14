if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
  "let g:solarized_termcolors=256
  let g:solarized_termcolors=16
  color solarized
endif

set splitright

let g:tlist_javascript_settings = 'javascript;s:string;a:array;o:object;f:function'
let g:JSLintHighlightErrorLine = 1
let g:used_javascript_libs = 'underscore,angularjs'

set title

set fillchars+=vert:\|
"hi VertSplit ctermbg=NONE ctermfg=NONE term=NONE
"hi NonText ctermbg=s:g_back ctermfg=NONE term=NONE
"
"
" Code folding
set foldmethod=syntax
autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

" F5 for stripping whitespaces
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>


" Tidy json
"function JSONFormat()
    "%!python -m json.tool
"endfunction

"command %!python -m json.tool JSONFormat

" Detect markdown
au BufRead,BufNewFile *.md set filetype=mkd
au BufRead,BufNewFile *.go set filetype=go


" Fixed something, cant remember what
set t_kN=[6;*~
set t_kP=[5;*~
set nocp

so ~/dotfiles/.vim/plugins/tern/vim/tern.vim

" common {
    " Remove trailing whitespaces with F5
    nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
    " Move lines up and down with alt+hjkl
    nnoremap <C-S-j> :m .+1<CR>==
    nnoremap <C-S-k> :m .-2<CR>==
    inoremap <C-S-j> <Esc>:m .+1<CR>==gi
    inoremap <C-S-k> <Esc>:m .-2<CR>==gi
    vnoremap <C-S-j> :m '>+1<CR>gv=gv
    vnoremap <C-S-k> :m '<-2<CR>gv=gv
" }
"
" nerdtree {
    let NERDTreeQuitOnOpen = 1
    map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
" }


" ctrlp {
    let g:ctrlp_working_path_mode = 2
    nnoremap <silent> <D-t> :CtrlP<CR>
    nnoremap <silent> <D-r> :CtrlPMRU<CR>

    let g:ctrlp_root_markers = ['.ctrlp', '.gitignore']

    if executable("ag")

        " Use ag if available
        let g:gackprg = 'ag --nogroup --nocolor --column'
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
        let g:ctrlp_use_caching = 0

    else

        " fallback
        let g:ctrlp_user_command = {
            \ 'types': {
                \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
            \ 'fallback': 'find %s -type f'
        \ }

        " Ignore node_modules and stuff
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$\|node_modules\|git\|DS_Store',
            \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
        \ }

    endif
" }


" Tabularize {
    nmap <Leader>a& :Tabularize /&<CR>
    vmap <Leader>a& :Tabularize /&<CR>
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
" }

" Vim undo {
    set undofile
    set undodir=~/.vimundo/
" }

" Fugitive {
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
" }

" Disable arrow keys {
    noremap  <Up> ""
    noremap! <Up> <Esc>
    noremap  <Down> ""
    noremap! <Down> <Esc>
    noremap  <Left> ""
    noremap! <Left> <Esc>
    noremap  <Right> ""
    noremap! <Right> <Esc>
" }

" NeoSnippet {
    " Plugin key-mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)

    " SuperTab like snippets behavior.
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    " For snippet_complete marker.
    if has('conceal')
      set conceallevel=2 concealcursor=i
    endif
" }

" Syntastic {

"   html {
        let g:syntastic_mode_map={ 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['html'] }
"   }
" }
" Go {
"   keys {
        au FileType go nmap <Leader>gd <Plug>(go-doc)
        au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
        au FileType go nmap <leader>r <Plug>(go-run)
        au FileType go nmap <leader>b <Plug>(go-build)
        au FileType go nmap <leader>t <Plug>(go-test)
"   }
"
" }
