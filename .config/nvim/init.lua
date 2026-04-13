-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Suppress Neovim >0.11 lspconfig deprecation warnings 
vim.g.lspconfig = {
  _suppress_deprecation_warning = true
}

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = false

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Show [D]iagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open [D]iagnostic [Q]uickfix list' })

-- File Explorer keymap
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle File [E]xplorer' })

-- Bufferline keymaps
vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev buffer' })
vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup({

  -- GITSIGNS (Git Integration)
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- WHICH-KEY (Keybinding Popup)
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },
    },
  },

  -- GIT HUB COPILOT
  { 'github/copilot.vim' },

  -- TELESCOPE (Fuzzy Finder)
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('telescope').setup {
        defaults = {
          mappings = {
            i = { ['<c-enter>'] = 'to_fuzzy_refine' },
          },
        },
      }

      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Master keymap panorama: searchable overview of ALL keybindings
      vim.keymap.set('n', '<leader>?', builtin.keymaps, { desc = '[?] Panoramica Comandi' })
    end,
  },

  -- LSP CONFIGURATION
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },
      -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          map('K', vim.lsp.buf.hover, 'Hover Documentation')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        end,
      })

      -- Enhanced Capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- DEFINING LSPS (Requested by User)
      local servers = {
        clangd = {},         -- C/C++
        rust_analyzer = {},  -- Rust
        ts_ls = {},          -- JavaScript/TypeScript
        bashls = {},         -- Bash
        intelephense = {},   -- PHP
        lua_ls = {           -- Lua
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              diagnostics = { globals = { 'vim' } },
            },
          },
        },
      }

      require('mason').setup()

      local ensure_installed = vim.tbl_keys(servers or {})
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            
            -- Prevent deprecation warnings internally
            local lspconfig = require('lspconfig')
            lspconfig[server_name].setup(server)
          end,
        },
      }
    end,
  },

  -- AUTOCOMPLETION
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-y>'] = cmp.mapping.confirm { select = true },
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },

  -- THEME
  {
    "ankushbhagats/pastel.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      palette = "pastelglow",
      style = {
        transparent = false,
      },
    },
    config = function(_, opts)
      require("pastel").setup(opts)
      vim.cmd.colorscheme("pastelglow")

      -- Enhance selection legibility and contrast based on user request
      local pink = "#f5b8c6"
      local text = "#3d2f47"
      local select = "#f7d9e5"

      vim.api.nvim_set_hl(0, "CursorLine", { bg = select })
      vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = pink, fg = text, bold = true })
      vim.api.nvim_set_hl(0, "Visual", { bg = pink, fg = text, bold = true })
      vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = pink, fg = text, bold = true })
      vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#8f2d3a", bold = true })

      -- High contrast overrides for code readability (Lavender, Mint, Yellow, Blue)
      local hc_lavender = "#6a3fb5"
      local hc_blue = "#1a5fb4"
      local hc_mint = "#1e8b54"
      local hc_yellow = "#a87103"

      -- Treesitter Syntax Overrides
      vim.api.nvim_set_hl(0, "@keyword", { fg = hc_lavender, bold = true })
      vim.api.nvim_set_hl(0, "@keyword.import", { fg = hc_lavender, italic = true })
      vim.api.nvim_set_hl(0, "@keyword.export", { fg = hc_lavender, bold = true })
      vim.api.nvim_set_hl(0, "@keyword.return", { fg = hc_yellow, bold = true })
      vim.api.nvim_set_hl(0, "@function", { fg = hc_blue, bold = true })
      vim.api.nvim_set_hl(0, "@function.builtin", { fg = hc_blue, italic = true })
      vim.api.nvim_set_hl(0, "@method", { fg = hc_blue })
      vim.api.nvim_set_hl(0, "@type", { fg = hc_yellow, bold = true })
      vim.api.nvim_set_hl(0, "@string", { fg = hc_mint })
      vim.api.nvim_set_hl(0, "@variable", { fg = text })
      vim.api.nvim_set_hl(0, "@property", { fg = text })
      vim.api.nvim_set_hl(0, "@punctuation", { fg = text })

      -- Standard Syntax Overrides (Fallback)
      vim.api.nvim_set_hl(0, "Statement", { fg = hc_lavender, bold = true })
      vim.api.nvim_set_hl(0, "Conditional", { fg = hc_lavender, bold = true })
      vim.api.nvim_set_hl(0, "Function", { fg = hc_blue, bold = true })
      vim.api.nvim_set_hl(0, "String", { fg = hc_mint })
      vim.api.nvim_set_hl(0, "Type", { fg = hc_yellow, bold = true })
    end,
  },

  -- TREESITTER (Syntax Highlighting)
  {
    'nvim-treesitter/nvim-treesitter',
    tag = "v0.9.3",
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile', 'VeryLazy' },
    main = 'nvim-treesitter.configs', 
    opts = {
      ensure_installed = { 'bash', 'c', 'cpp', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', 'rust', 'javascript', 'typescript', 'php' },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
  },

  -- WEB DEVICONS
  { 'nvim-tree/nvim-web-devicons', lazy = true },

  -- LUALINE (Status Bar)
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'auto',
        globalstatus = true,
      },
    },
  },

  -- BUFFERLINE (Tab Bar)
  {
    'akinsho/bufferline.nvim',
    event = "VeryLazy",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        always_show_bufferline = true,
        separator_style = "slope",
        diagnostics = "nvim_lsp",
      },
    },
  },

  -- NVIM-TREE (File Explorer)
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      filters = { dotfiles = false },
      view = { width = 30 },
    },
  },

})
