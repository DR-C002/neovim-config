-- Initialize lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Leader Key Settings (Space bar)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Core Options
vim.opt.number = true             -- Enable line numbers
vim.opt.relativenumber = true     -- Enable relative line numbers
vim.opt.fillchars = { vert = "│", eob = " " } -- Solid vertical split line
vim.opt.termguicolors = true      -- 24-bit RGB colors
vim.opt.signcolumn = "yes"        -- Prevent layout shift

-- System Clipboard Sync
vim.opt.clipboard = "unnamedplus" -- Sync copy/paste with OS clipboard

-- Custom Red & Yellow Theme for Lualine Status Bar
local red_yellow_theme = {
  normal = {
    a = { fg = "#000000", bg = "#FF2A6D", bold = true },
    b = { fg = "#FFD700", bg = "#2D1B2D" },
    c = { fg = "#FFFFFF", bg = "NONE" },
  },
  insert = {
    a = { fg = "#000000", bg = "#FFD700", bold = true },
    b = { fg = "#FF2A6D", bg = "#2D1B2D" },
  },
  visual = {
    a = { fg = "#000000", bg = "#FF79C6", bold = true },
    b = { fg = "#FFD700", bg = "#2D1B2D" },
  },
  replace = {
    a = { fg = "#000000", bg = "#FF5555", bold = true },
    b = { fg = "#FFD700", bg = "#2D1B2D" },
  },
  command = {
    a = { fg = "#000000", bg = "#A300FF", bold = true },
    b = { fg = "#FFD700", bg = "#2D1B2D" },
  },
  inactive = {
    a = { fg = "#888888", bg = "#1F1F1F" },
    b = { fg = "#888888", bg = "#1F1F1F" },
    c = { fg = "#888888", bg = "NONE" },
  },
}

-- Plugins Configuration
require("lazy").setup({
  -- Dashboard / Start Screen
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        "                                                      ",
        "  ███╗   ██╗███████╗██████╗ ██╗   ██╗██╗███╗   ███╗  ",
        "  ████╗  ██║██╔════╝██╔══██╗██║   ██║██║████╗ ████║  ",
        "  ██╔██╗ ██║█████╗  ██║  ██║██║   ██║██║██╔████╔██║  ",
        "  ██║╚██╗██║██╔══╝  ██║  ██║╚██╗ ██╔╝██║██║╚██╔╝██║  ",
        "  ██║ ╚████║███████╗██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  ",
        "  ╚═╝  ╚═══╝╚══════╝╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  ",
        "                                                      ",
      }

      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
        dashboard.button("e", "  New File", ":ene <BAR> startinsert<CR>"),
        dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
        dashboard.button("g", "  Find Text", ":Telescope live_grep<CR>"),
        dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
      }

      dashboard.section.footer.val = { "⚡ Neovim Configured for High Performance" }

      alpha.setup(dashboard.opts)
    end,
  },

  -- High-contrast Fancy Color Palette
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
        on_highlights = function(hl, c)
          hl["Include"] = { fg = "#FF2A6D", bold = true }
          hl["@keyword.directive"] = { fg = "#FF2A6D", bold = true }
          hl["@keyword.directive.define"] = { fg = "#FF2A6D", bold = true }
          
          hl["Function"] = { fg = "#00BFFF", bold = true }
          hl["@function"] = { fg = "#00BFFF", bold = true }
          hl["@function.call"] = { fg = "#00BFFF", bold = true }
          hl["@function.builtin"] = { fg = "#00BFFF", bold = true }
          
          hl["Type"] = { fg = "#A300FF", bold = true }
          hl["@type"] = { fg = "#A300FF", bold = true }
          hl["@type.builtin"] = { fg = "#A300FF", bold = true }
          
          hl["Keyword"] = { fg = "#A300FF", bold = true }
          hl["@keyword"] = { fg = "#A300FF", bold = true }
          
          hl["String"] = { fg = "#D97706", bold = true }
          hl["@string"] = { fg = "#D97706", bold = true }
          
          hl["Number"] = { fg = "#FFD700", bold = true }
          hl["@number"] = { fg = "#FFD700", bold = true }
          
          hl["@variable"] = { fg = "#FF5555", bold = true }
          hl["@variable.parameter"] = { fg = "#FFD700", italic = true }
          
          hl.WinSeparator = { fg = "#FF2A6D", bg = "NONE" }
          hl.NvimTreeWinSeparator = { fg = "#FF2A6D", bg = "NONE" }
        end,
      })
      vim.cmd("colorscheme tokyonight")
    end,
  },

  -- File Icons
  { "nvim-tree/nvim-web-devicons", lazy = false },

  -- File Tree (NvimTree)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 30, side = "left" },
        renderer = {
          highlight_git = true,
          icons = {
            show = { file = true, folder = true, folder_arrow = true, git = true },
          },
        },
      })
      vim.keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle File Tree" })
    end,
  },

  -- Top Bar (Bufferline)
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          style_preset = require("bufferline").style_preset.minimal,
          diagnostics = "nvim_lsp",
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "left",
              separator = true,
            }
          },
        }
      })
    end,
  },

  -- Bottom Status Line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = red_yellow_theme,
          component_separators = { left = "│", right = "│" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
        },
      })
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>e", builtin.find_files, { desc = "Search ALL files" })
      vim.keymap.set("n", "<leader>w", builtin.live_grep, { desc = "Search code inside files" })
      vim.keymap.set("n", "<c-p>", builtin.git_files, { desc = "Search Git files only" })
    end,
  },

  -- Auto-completion Engine & Snippets
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
            else fallback() end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  -- LSP Support (clangd for C)
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("mason").setup()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "bashls" },
        automatic_installation = true,
        handlers = {
          function(server_name)
            if vim.lsp.config then
              vim.lsp.config[server_name] = { capabilities = capabilities }
              vim.lsp.enable(server_name)
            else
              require("lspconfig")[server_name].setup({ capabilities = capabilities })
            end
          end,
        },
      })
    end,
  },

  -- Syntax Highlighting (Treesitter)
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "bash", "dockerfile", "json" },
        highlight = { enable = true },
      })
    end,
  },

  -- Toggle Terminal (Space + t)
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 15,
        open_mapping = [[<leader>t]],
        direction = "horizontal",
        shade_terminals = false,
      })
    end,
  },
})

-- Fast Window & Buffer Closing Keymap
vim.keymap.set("n", "Q", ":q<CR>", { silent = true, desc = "Close window / Quit tab" })

-- Top Bar Buffer Navigation Keymaps
vim.keymap.set("n", "H", ":BufferLineCyclePrev<CR>", { silent = true, desc = "Go to left buffer" })
vim.keymap.set("n", "L", ":BufferLineCycleNext<CR>", { silent = true, desc = "Go to right buffer" })
vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { silent = true, desc = "Close current buffer" })

-- Splitting Shortcuts & Navigation
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { silent = true, desc = "Vertical Split" })
vim.keymap.set("n", "<leader>s", ":split<CR>", { silent = true, desc = "Horizontal Split" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

-- Force Background Transparency Overrides
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local hl_groups = {
      "Normal", "NormalNC", "Terminal", "NvimTreeNormal", "NvimTreeNormalNC",
      "SignColumn", "NvimTreeSignColumn", "TelescopeNormal", "TelescopeBorder",
      "NvimTreeWinSeparator", "WinSeparator"
    }
    for _, group in ipairs(hl_groups) do
      vim.cmd(string.format("highlight %s guibg=NONE ctermbg=NONE", group))
    end
  end,
})
