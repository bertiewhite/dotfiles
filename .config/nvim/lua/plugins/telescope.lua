return  { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for install instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },

  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
        file_browser = {
          hijack_netrw = true,
        }
      },
      defaults = {
        file_ignore_patterns = {
          "vendor"
        }
      }
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]uzzyfind [H]elp' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]uzzyfind [K]eymaps' })
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]uzzyfind [F]iles' })
    vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[F]uzzyfind [S]elect Telescope' })
    vim.keymap.set('n', '<leader>fg', builtin.grep_string, { desc = '[F]uzzyfind current [W]ord' })
    vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = '[F]uzzyfind by [G]rep' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]uzzyfind [D]iagnostics' })
    vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]uzzyfind [R]esume' })
    vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]uzzyfind Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[F] Find existing buffers' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- Also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>f/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[F]uzzyfind [/] in Open Files' })

    -- Shortcut for searching your neovim configuration files
    vim.keymap.set('n', '<leader>fn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[F]uzzyfind [N]eovim files' })

    require("telescope").load_extension("file_browser")
  end,
}
