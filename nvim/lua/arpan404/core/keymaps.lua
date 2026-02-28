vim.g.mapleader = " " -- set leader key to space

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>") -- go to normal mode using "jk" instead of ESC key 

keymap.set("n", "<leader>nh", ":nohl<CR>") -- unselect the searched items

keymap.set("n", "x", '"_x') -- delete single character without copying it to register

keymap.set("n", "<leader>+", "<C-a>") -- increment number by 1
keymap.set("n", "<leader>-", "<C-x>") -- decrement number by 1

-- Window navigation
keymap.set("n", "<leader>wh", "<C-w>h") -- move to left window
keymap.set("n", "<leader>wj", "<C-w>j") -- move to window below
keymap.set("n", "<leader>wk", "<C-w>k") -- move to window above
keymap.set("n", "<leader>wl", "<C-w>l") -- move to right window

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

keymap.set("n", "<leader>r", "<C-r>") -- redo

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find text
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find current word
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- show open buffers

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- find current file in tree

-- Treesitter incremental selection
keymap.set("n", "gnn", "<cmd>lua require'nvim-treesitter.incremental_selection'.init_selection()<CR>") -- initialize selection
keymap.set("n", "grn", "<cmd>lua require'nvim-treesitter.incremental_selection'.node_incremental()<CR>") -- increment to the next node
keymap.set("n", "grc", "<cmd>lua require'nvim-treesitter.incremental_selection'.scope_incremental()<CR>") -- increment to the next scope
keymap.set("n", "grm", "<cmd>lua require'nvim-treesitter.incremental_selection'.node_decremental()<CR>") -- decrement to the previous node

-- Treesitter text objects
keymap.set("o", "af", "<cmd>lua require'nvim-treesitter.textobjects'.select.select_textobject('@function.outer')<CR>") -- select outer part of a function
keymap.set("o", "if", "<cmd>lua require'nvim-treesitter.textobjects'.select.select_textobject('@function.inner')<CR>") -- select inner part of a function
keymap.set("o", "ac", "<cmd>lua require'nvim-treesitter.textobjects'.select.select_textobject('@class.outer')<CR>") -- select outer part of a class
keymap.set("o", "ic", "<cmd>lua require'nvim-treesitter.textobjects'.select.select_textobject('@class.inner')<CR>") -- select inner part of a class


-- LSP based functionalities
keymap.set("n", "K", vim.lsp.buf.hover, {buffer= 0})
keymap.set("n", "gy", vim.lsp.buf.type_definition, {buffer=0})
