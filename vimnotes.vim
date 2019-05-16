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

	:difft	-	use current window in diff
	:windo difft - do it for all windows

	gu	- make lowercase
	gU	- make uppercase

	# Motions

	#cursor in the window High Middle Low - DONT CHANGE THE SCREEN
	H	M	L
	
	
	#current line in window Top, Middle, Bottom	- DONT CHANGE THE COURSOR POSITION
	zt zz zb
	ctrl-y ctrl-e - fine tune


	ctrl-U	H  ctrl-B
	ctrl-Y	M  ctrl-E
	ctrl-D	L  ctrl-F

	gf - to to file
	ctrl-^ switch buffer - go to last

