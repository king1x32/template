-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.scriptencoding = "utf-8"

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }

  if vim.fn.has("wsl") == 1 then
    vim.g.clipboard = {
      name = "win32yank-wsl",
      copy = {
        ["+"] = "win32yank.exe -i --crlf",
        ["*"] = "win32yank.exe -i --crlf",
      },
      paste = {
        ["+"] = "win32yank.exe -o --lf",
        ["*"] = "win32yank.exe -o --lf",
      },
      cache_enabled = 1,
    }
  end
  if vim.g.os == "Linux" then
    vim.g.clipboard = {
      name = 'termux-clipboard',
      copy = {
         ["+"] = "termux-clipboard-set",
         ["*"] = "termux-clipboard-set",
       },
      paste = {
         ["+"] = "termux-clipboard-get",
         ["*"] = "termux-clipboard-get",
      },
      cache_enabled = 1,
    }
  end

vim.cmd [[
  " for detecting OS
  if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
      let g:os = "Windows"
    else
      let g:os = substitute(system('uname'), '\n', '', '')
    endif
  endif

  " important option that should already be set!
  set hidden

  " available options:
  " * g:split_term_style
  " * g:split_term_resize_cmd
  function! TermWrapper(command) abort
    if !exists('g:split_term_style') | let g:split_term_style = 'horizontal' | endif
    if g:split_term_style ==# 'vertical'
      let buffercmd = 'vnew'
    elseif g:split_term_style ==# 'horizontal'
      let buffercmd = 'new'
    else
      echoerr 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'' but is currently set to ''' . g:split_term_style . ''')'
      throw 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'')'
    endif
    exec buffercmd
    if exists('g:split_term_resize_cmd')
      exec g:split_term_resize_cmd
    endif
    exec 'term ' . a:command
    exec 'setlocal nornu nonu'
    exec 'startinsert'
    autocmd BufEnter <buffer> startinsert
  endfunction

  command! -nargs=0 CompileAndRun call TermWrapper(printf('g++ -std=c++17 %s && ./a.out', expand('%')))
  command! -nargs=1 -complete=file CompileAndRunWithFile call TermWrapper(printf('g++ -std=c++17 %s && ./a.out < %s', expand('%'), <q-args>))
  autocmd FileType cpp nnoremap <leader>mc :CompileAndRun<CR>

  " For those of you that like to use -o and a specific outfile executable
  " (i.e., xyz.cpp makes executable xyz, as opposed to a.out
  " This C++ toolkit gives you commands to compile and/or run in different types
  " of terminals for your own preference.
  augroup CppToolkit
    autocmd!
    if g:os == 'Darwin'
      autocmd FileType cpp nnoremap <leader>mt :!g++ -std=c++17 -o %:r % && open -a Terminal './%:r'<CR>
    endif
    autocmd FileType cpp nnoremap <leader>mb :!g++ -std=c++17 -o %:r % && ./%:r<CR>
    autocmd FileType cpp nnoremap <leader>mr :!./%:r.out<CR>
  augroup END

  " Search && replace selected text
  vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

  " options
  " choose between 'vertical' and 'horizontal' for how the terminal window is split
  " (default is horizontal)
  let g:split_term_style = 'horizontal'

  " add a custom command to resize the terminal window to your preference
  " (default is to split the screen equally)
  let g:split_term_resize_cmd = 'resize 8'
  " (or let g:split_term_resize_cmd = 'vertical resize 40')
]]

-- Automatically deletes all trailing whitespace and newlines at end of file on save.
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\n\+\%$//e]],
})

vim.opt.path:append({"**"})
vim.opt.wildignore:append({"*/node_modules/*"})
vim.opt.formatoptions:append({"r"})
