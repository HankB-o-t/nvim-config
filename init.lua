require("slime.plugins-setup")

require("slime.core.options")
require("slime.core.keymaps")
require("slime.core.colorscheme")

require("slime.plugins.lsp.mason")
require("slime.plugins.lsp.lspsaga")
require("slime.plugins.lsp.lspconfig")
require("slime.plugins.lsp.null-ls")
require("slime.plugins.treesitter")
require("slime.plugins.nvim-cmp")
require("slime.plugins.autopairs")
require("slime.plugins.lualine")
require("slime.plugins.nvim-tree")
require("slime.plugins.alpha-nvim")
require("bufferline").setup{
   options = {
      mode = "buffers", --buffers or tabs
      numbers = "none",
      separator_style = "slant",
      diagnostics = "nvim_lsp",

      indicator = {
        icon = "|",
        style = 'icon',
      },
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
      },
  } 
}

require("onedark").setup {
    style = 'dark', 
    transparent = true,
    --transparent = false,
    term_colors = true,
    ending_tildes = false,
    cmp_itemkind_reverse = false 
}

require("onedark").load()
