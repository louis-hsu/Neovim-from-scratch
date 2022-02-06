vim.cmd([[
let g:airline_theme='wombat'
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif

let g:airline_powerline_fonts=1
let g:airline_symbols.colnr='㏇'
let g:airline_symbols.linenr='㏑'
let g:airline_symbols.maxlinenr= '☰'

" Reconfigure zone Z cuz unrecognized symbol
let g:airline_section_z=airline#section#create_right(['%p%% %#__accent_bold#%{g:airline_symbols.linenr}%l/%L %{g:airline_symbols.colnr}%v%#__restore__#'])

]])
