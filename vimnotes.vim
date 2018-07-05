" Rejestry:
" 
" "ayy	yank to register [a]
" "ap	paste from register [a]
" insert mode: Ctrl-r a		paste from register [a]
" qa	record macro to register [a]
" @a	exec macro from register [a]
" "*yy	copy to Windows clipboard (works on msys)
" :let @+=@% - copy current file path register ["%] to clipboard ["+]
" ": recent executed command - @: repeats last command f.e. :s/foo/bar/
" :let @W='i;'	insert ; at the end
netrw tree
	v - vertical split file
	t - open file in new tab
	<CR> - horizontal split
