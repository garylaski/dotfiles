set path+=**
set tabstop=4
set shiftwidth=4
set expandtab

let g:netrw_banner=0
map <F5> :w! \| !compile "<c-r>%" && run "<c-r>%"<CR>
map <F6> :w! \| !compile "<c-r>%"<CR>
map <F7> :w! \| !style "<c-r>%"<CR>

map <F2> :%s/YOUR NAME HERE/GARY LASKI/ge <bar> :%s/YOUR USER ID HERE (i.e. gburdell3)/\=expand($GT_USER)/ge <bar> :%s/YOUR GT ID HERE (i.e. 900000000)/\=expand($GT_ID)/ge <bar> :%s/LIST ALL COLLABORATORS YOU WORKED WITH HERE/NONE/ge <bar> :%s/LIST ALL NON-COURSE RESOURCES YOU CONSULTED HERE/GOODRICH TEXTBOOK<CR>
