local gset = vim.api.nvim_set_var

-- disable default keymaps
gset('gitgutter_map_keys', 0)

gset('gitgutter_enabled', 1)
gset('gitgutter_sign_added', '+')
gset('gitgutter_sign_modified', '>')
gset('gitgutter_sign_removed', '-')
gset('gitgutter_sign_removed_first_line', '^')
gset('gitgutter_sign_modified_removed', '<')
gset('gitgutter_highlight_lines', 1)
gset('gitgutter_sign_priority', 1)
