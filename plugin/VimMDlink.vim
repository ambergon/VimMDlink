if !has("python3")
    finish
endif
if exists('g:loaded_mdlink')
    finish
endif
let g:loaded_mdlink = 1

":MDlink
command! -range MDlink call VimMDlink#get_title(<line1>,<line2>)

":MDlinkCard
command! -range MDlinkCard call VimMDlink#get_card(<line1>,<line2>)

