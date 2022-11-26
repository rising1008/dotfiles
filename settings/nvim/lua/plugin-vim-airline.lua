-- local setup, vfiler = pcall(require, 'vim-airline')
-- if not setup then
--   print('skip the setup process of vim-airline')
--   return
-- end

local gset = vim.api.nvim_set_var
-- 'vim-airline-themes' --------------------------------------------
gset('airline_theme', 'iceberg')

-- 'configuration' --------------------------------------------
gset('airline_symbols_ascii', 1)
gset('airline#extensions#tabline#enabled', 1)
gset('airline#extensions#branch#empty_message', '')
gset('airline#extensions#branch#format', 1)
gset('airline#extensions#whitespace#mixed_indent_algo', 1)
gset('airline_powerline_fonts', 1)
