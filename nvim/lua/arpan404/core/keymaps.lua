vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness


keymap.set("i", "kl", "<ESC>") -- go to normal mode using "jk" instead of ESC key 

keymap.set("n", "<leader>nh", ":nohl<CR>") -- unselect the searched items

keymap.set("n", "x", '"_x') -- delete single character

keymap.set("n", "<leader>+", "<C-a>") -- increment number by 1
keymap.set("n", "<leader>-", "<C-x>") -- decrement number by 1

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- got to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- got to previous tab


