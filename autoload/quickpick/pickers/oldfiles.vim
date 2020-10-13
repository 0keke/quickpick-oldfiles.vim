function! quickpick#pickers#oldfiles#show(...) abort
  call quickpick#open({
        \ 'items': v:oldfiles,
        \ 'on_accept': function('s:on_accept'),
        \})
endfunction

function! s:on_accept(data, ...) abort
    call quickpick#close()
    execute 'edit ' . a:data['items'][0]
endfunction

" vim: tabstop=2 shiftwidth=2 expandtab
