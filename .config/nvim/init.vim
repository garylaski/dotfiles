map <F5> :w! \| !compile "<c-r>%" && run "<c-r>%"<CR>
map <F6> :w! \| !compile "<c-r>%"<CR>
map <F7> :w! \| !style "<c-r>%"<CR>

map <F2> :%s/YOUR NAME HERE/GARY LASKI/ge <bar> :%s/YOUR USER ID HERE (i.e. gburdell3)/\=expand($GT_USER)/ge <bar> :%s/YOUR GT ID HERE (i.e. 900000000)/\=expand($GT_ID)/ge<CR>
