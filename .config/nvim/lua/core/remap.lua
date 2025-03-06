vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--vim.api.nvim_set_keymap("n", "<leadeR>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>fb", ":Oil --float %:p:h <CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "-", ":Oil %:p:h <CR>", { noremap = true })

vim.keymap.set({"n", "t"}, '<leader>tf', function ()
   require("nvterm.terminal").toggle('float')
end)
