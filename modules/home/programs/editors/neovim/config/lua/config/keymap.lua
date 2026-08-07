vim.keymap.set('n', '<Space>', '<Nop>', { silent = true })
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "use h to move!!"<cr>')
vim.keymap.set('n', '<right>', '<cmd>echo "use l to move!!"<cr>')
vim.keymap.set('n', '<up>', '<cmd>echo "use k to move!!"<cr>')
vim.keymap.set('n', '<down>', '<cmd>echo "use j to move!!"<cr>')
