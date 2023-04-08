local keymap=vim.keymap

vim.g.mapleader=" "
keymap.set("n", "<leader>pv",vim.cmd.Ex)

--move lines
keymap.set('v','J',":m '>+1<CR>gv=gv")
keymap.set('v','K',":m '<-2<CR>gv=gv")

--preserve pasted word
keymap.set('x','<leader>p','\"_dP')

--paste into system keyboard
keymap.set('n','<leader>y','\"+y')
keymap.set('v','<leader>y','\"+y')

--map kj to escape
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true })

-- Map Ctrl+s to save file
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<C-o>:w<CR><Esc>', { noremap = true, silent = true })

-- indent and save using ctrl+i
vim.api.nvim_set_keymap('n','<C-i>', '<Esc>:normal gg=G<CR> ', { noremap = true })

