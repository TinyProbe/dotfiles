" Vim filetype indent file
" Language: Zig
" Upstream: https://github.com/ziglang/zig.vim

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

if (!has("cindent") || !has("eval"))
  finish
endif

" setlocal cindent

" cinkeys: controls what keys trigger indent formatting
" 0{ -> {
" 0} -> }
" 0) -> )
" 0] -> ]
" !^F -> make CTRL-F (^F) reindent the current line when typed
" o -> when <CR> or `o` is used
" O -> when the `O` command is used
" setlocal cinkeys=0{,0},0),0],!^F,o,O

" L0 -> 0 indent for jump labels (i.e. case statement in c).
" j1 -> indenting for "javascript object declarations"
" J1 -> see j1
" w1 -> starting a new line with `(` at the same indent as `(`
" m1 -> if `)` starts a line, match its indent with the first char of its
"       matching `(` line
" (s -> use one indent, when starting a new line after a trailing `(`
" setlocal cinoptions=L0,m1,(s,j1,J1,l1

setlocal indentexpr=GetZigIndent(v:lnum)

let b:undo_indent = "setlocal cindent< cinkeys< cinoptions< indentexpr<"

" additional customizing by tiny.
" edit this what ever you want.
" --------------------------------
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4 " choice your tab size.
setlocal cindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=:0,=s,l1,g0,N-s,E-s,i2s,+2s,(0,U1,W2s,k2s,m1,j1,J1
" --------------------------------

function! GetZigIndent(lnum)
  let curretLineNum = a:lnum
  let currentLine = getline(a:lnum)

  " cindent doesn't handle multi-line strings properly, so force no indent
  if currentLine =~ '^\s*\\\\.*'
    return -1
  endif

  let prevLineNum = prevnonblank(a:lnum-1)
  let prevLine = getline(prevLineNum)

  " for lines that look like
  "   },
  "   };
  " try treating them the same as a }
  if prevLine =~ '\v^\s*},$'
    if currentLine =~ '\v^\s*};$' || currentLine =~ '\v^\s*}$'
      return indent(prevLineNum) - &shiftwidth
    endif
    " return indent(prevLineNum-1) - &shiftwidth
  endif
  " if currentLine =~ '\v^\s*},$'
  "   return indent(prevLineNum) - &shiftwidth
  " endif
  " if currentLine =~ '\v^\s*};$'
  "   return indent(prevLineNum) - &shiftwidth
  " endif


  " cindent doesn't handle this case correctly:
  " switch (1): {
  "   1 => true,
  "       ~
  "       ^---- indents to here
  if prevLine =~ '.*=>.*,$' && currentLine !~ '.*}$'
    return indent(prevLineNum)
  endif

  return cindent(a:lnum)
endfunction
