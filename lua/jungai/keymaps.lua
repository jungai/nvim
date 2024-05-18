vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set("n", "<leader>gs", "<cmd>Git<CR>")

keymap.set("x", "<leader>p", '"_dP')

-- not save to buffer
keymap.set("n", "x", '"_x')

-- move line
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- adding number
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- window
keymap.set("n", "<leader>w-", "<C-w>v")
keymap.set("n", "<leader>w_", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sw", ":close<CR>")
keymap.set("n", "<leader>'", ":vertical resize -5<CR>", { silent = true })
keymap.set("n", "<leader>;", ":vertical resize +5<CR>", { silent = true })

keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>fe", "<cmd>Telescope file_browser<cr>")
keymap.set("n", "<leader>fu", "<cmd>Telescope flutter commands<cr>")

-- trouble
keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<CR>", { silent = true, noremap = true })
keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", { silent = true, noremap = true })

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
keymap.set("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
