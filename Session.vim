let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/asteroids_game
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 ~/asteroids_game
badd +3 asteroid.py
badd +23 main.py
badd +43 player.py
badd +1 shot.py
badd +13 constants.py
badd +20 asteroidfield.py
argglobal
%argdel
$argadd ~/asteroids_game
edit player.py
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 19 + 23) / 46)
exe 'vert 1resize ' . ((&columns * 93 + 94) / 188)
exe '2resize ' . ((&lines * 24 + 23) / 46)
exe 'vert 2resize ' . ((&columns * 93 + 94) / 188)
exe '3resize ' . ((&lines * 21 + 23) / 46)
exe 'vert 3resize ' . ((&columns * 94 + 94) / 188)
exe '4resize ' . ((&lines * 22 + 23) / 46)
exe 'vert 4resize ' . ((&columns * 94 + 94) / 188)
argglobal
balt asteroid.py
setlocal foldmethod=manual
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 43 - ((9 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 43
normal! 017|
lcd ~/asteroids_game
wincmd w
argglobal
if bufexists(fnamemodify("~/asteroids_game/shot.py", ":p")) | buffer ~/asteroids_game/shot.py | else | edit ~/asteroids_game/shot.py | endif
if &buftype ==# 'terminal'
  silent file ~/asteroids_game/shot.py
endif
setlocal foldmethod=manual
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 8 - ((7 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 8
normal! 0
lcd ~/asteroids_game
wincmd w
argglobal
if bufexists(fnamemodify("~/asteroids_game/main.py", ":p")) | buffer ~/asteroids_game/main.py | else | edit ~/asteroids_game/main.py | endif
if &buftype ==# 'terminal'
  silent file ~/asteroids_game/main.py
endif
balt ~/asteroids_game/constants.py
setlocal foldmethod=manual
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 30 - ((10 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 30
normal! 09|
lcd ~/asteroids_game
wincmd w
argglobal
if bufexists(fnamemodify("~/asteroids_game/constants.py", ":p")) | buffer ~/asteroids_game/constants.py | else | edit ~/asteroids_game/constants.py | endif
if &buftype ==# 'terminal'
  silent file ~/asteroids_game/constants.py
endif
balt ~/asteroids_game/asteroid.py
setlocal foldmethod=manual
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 13 - ((11 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 13
normal! 027|
lcd ~/asteroids_game
wincmd w
3wincmd w
exe '1resize ' . ((&lines * 19 + 23) / 46)
exe 'vert 1resize ' . ((&columns * 93 + 94) / 188)
exe '2resize ' . ((&lines * 24 + 23) / 46)
exe 'vert 2resize ' . ((&columns * 93 + 94) / 188)
exe '3resize ' . ((&lines * 21 + 23) / 46)
exe 'vert 3resize ' . ((&columns * 94 + 94) / 188)
exe '4resize ' . ((&lines * 22 + 23) / 46)
exe 'vert 4resize ' . ((&columns * 94 + 94) / 188)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
