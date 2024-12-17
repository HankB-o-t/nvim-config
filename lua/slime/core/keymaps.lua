vim.g.mapleader = " "

local builtin = require("telescope.builtin")
local kym = vim.keymap

-- toggle nerdtree
kym.set("n", "<F4>", ":NvimTreeToggle<CR>")
-- kym.set("n", "<leader>'", ":toggleterm")

-- change buffers
kym.set("n", "<C-j>", ":bprev<CR>")
kym.set("n", "<C-k>", ":bnext<CR>")
kym.set("n", "<C-a>", "<C-w>w")
kym.set("n", "<leader>bw", ":bwipeout<CR>")

-- split
kym.set("n", "<leader>|", "<C-w>v")
kym.set("n", "<leader>-", "<C-w>s")
kym.set("n", "<leader>se", "<C-w>=")
kym.set("n", "<leader>sx", ":close<CR>")

kym.set("n", "<C-t>", ":ToggleTerm<CR>")
kym.set("n", "<leader>nt", ":tabnew<CR>")
kym.set("n", "<leader>ct", ":tabclose<CR>")

-- telescope
kym.set("n", "<leader>ft", builtin.find_files, {})
kym.set('n', '<leader>fg', builtin.live_grep, {})
