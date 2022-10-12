vim.cmd [[
try
  colorscheme tokyonight
  " colorscheme darkplus
  " colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
