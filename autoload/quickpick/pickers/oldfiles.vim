function! quickpick#pickers#oldfiles#show(...) abort
    let initial_colorscheme = get(g:, 'colors_name', 'default')
    let id = quickpick#create({
        \   'on_change': function('s:on_change'),
        \   'on_accept': function('s:on_accept'),
        \   'items': v:oldfiles
        \ })
    call quickpick#show(id)
    return id
endfunction

function! s:on_change(id, action, searchterm) abort
    let searchterm = tolower(trim(a:searchterm))
    let items = empty(trim(searchterm)) ? v:oldfiles : filter(copy(v:oldfiles), {index, item-> stridx(tolower(item), searchterm) > -1})
    call quickpick#set_items(a:id, items)
endfunction

function! s:on_accept(id, action, data) abort
    call quickpick#close(a:id)
    execute 'edit ' . a:data['items'][0]
endfunction
