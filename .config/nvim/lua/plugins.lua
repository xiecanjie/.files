local lazy = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy) then
  vim.opt.cmdheight = 1
  vim.notify("Installing lazy.nvim...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazy,
  })
end
vim.opt.rtp:prepend(lazy)

require("lazy").setup({
  spec = {
    {
      "marko-cerovac/material.nvim",
      opts = { async_loading = false, lualine_style = "stealth", },
      init = function()
        vim.g.material_style = "darker"
        vim.cmd("colorscheme material")
        vim.cmd("highlight Normal   guibg=none")
        vim.cmd("highlight NormalNC guibg=none")
      end,
    },

    {
      "nvim-lualine/lualine.nvim",
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      event = "VeryLazy",
      opts = { options = { globalstatus = true } },
    },

    {
      "akinsho/bufferline.nvim",
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      event = "VeryLazy",
      opts = {
        options = {
          indicator               = { style = "none" },
          show_close_icon         = false,
          show_buffer_close_icons = false,
          separator_style         = { "" },
        }
      },
      init = function()
        vim.keymap.set("n", "gb", ":BufferLinePick<CR>",       { noremap = true, silent = true, })
        vim.keymap.set("n", "gD", ":BufferLinePickClose<CR>",  { noremap = true, silent = true, })
        vim.keymap.set("n", "[b", ":BufferLineCyclePrev<CR>",  { noremap = true, silent = true, })
        vim.keymap.set("n", "]b", ":BufferLineCycleNext<CR>",  { noremap = true, silent = true, })
        vim.keymap.set("n", "[m", ":BufferLineMovePrev<CR>",   { noremap = true, silent = true, })
        vim.keymap.set("n", "]m", ":BufferLineMoveNext<CR>",   { noremap = true, silent = true, })
        vim.keymap.set("n", "[x", ":BufferLineCloseLeft<CR>",  { noremap = true, silent = true, })
        vim.keymap.set("n", "]x", ":BufferLineCloseRight<CR>", { noremap = true, silent = true, })
      end,
    },

    {
      "ggandor/leap.nvim",
      keys = {
        { "s", mode = { "n", "x", "o" }, },
        { "S", mode = { "n", "x", "o" }, },
      },
      opts = { safe_labels = {} },
      init = function()
        require("leap").add_default_mappings()
      end,
    },

    {
      "ibhagwan/fzf-lua",
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      cmd = "FzfLua",
      opts = { files = { cwd_prompt = false } },
      init = function()
        vim.keymap.set("n", "<c-P>", "<cmd>lua require('fzf-lua').files()<CR>",        { noremap = true, silent = true, })
        vim.keymap.set("n", "<c-N>", "<cmd>lua require('fzf-lua').buffers()<CR>",      { noremap = true, silent = true, })
      end,
    },

    {
      "neovim/nvim-lspconfig",
      event = "VeryLazy",
      init = function()
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
        vim.keymap.set("n", "K",  vim.lsp.buf.hover)
        vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
        vim.keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions     jump_to_single_result=true ignore_current_line=true<cr>")
        vim.keymap.set("n", "gr", "<cmd>FzfLua lsp_references      jump_to_single_result=true ignore_current_line=true<cr>")
        vim.keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations jump_to_single_result=true ignore_current_line=true<cr>")
        vim.keymap.set("n", "gy", "<cmd>FzfLua lsp_typedefs        jump_to_single_result=true ignore_current_line=true<cr>")
      end,
    },

    {
      "nvim-treesitter/nvim-treesitter", version = false,
      event = { "VeryLazy" },
      opts = { highlight = { enable = true } },
      main = "nvim-treesitter.configs",
    },

    {
      "hrsh7th/nvim-cmp",

      dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
      },

      event = "InsertEnter",

      init = function()
        local cmp = require("cmp")
        cmp.setup({
          completion = { completeopt = "menu,menuone,noinsert" },

          mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(0 - 4),
            ["<C-f>"] = cmp.mapping.scroll_docs(0 + 4),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>" ] = cmp.mapping.confirm({ select = true }),
          }),

          sources = cmp.config.sources({{ name = "nvim_lsp" }}),

          formatting = {
            format = function(entry, item)
              item.kind = " "
              return item
            end
          },

          view = {
            entries = { name = "custom", selection_order = "near_cursor", },
          },
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        require("lspconfig").gopls   .setup({ capabilities = capabilities })
        require("lspconfig").tsserver.setup({ capabilities = capabilities })
      end,
    },

    -- { import = "plugins/legacy/coc" },
  },
})
