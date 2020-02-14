if exists('g:quickpick_oldfiles')
    finish
endif
let g:quickpick_oldfiles = 1

command! Poldfiles call quickpick#pickers#oldfiles#show()

