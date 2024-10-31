-- This is a statueline plugin.

return {
  'rebelot/heirline.nvim',
  dependencies = { 'Zeioth/heirline-components.nvim' },
  -- You can optionally lazy-load heirline on UiEnter
  -- to make sure all required plugins and colorschemes are loaded before setup
  event = 'UiEnter',
  opts = function()
    -- show tabline when buffers >=2
    -- this is the default function used to retrieve buffers
    local get_bufs = function()
      return vim.tbl_filter(
        function(bufnr) return vim.api.nvim_get_option_value('buflisted', { buf = bufnr }) end,
        vim.api.nvim_list_bufs()
      )
    end

    -- initialize the buflist cache
    local buflist_cache = {}

    -- setup an autocmd that updates the buflist_cache every time that buffers are added/removed
    vim.api.nvim_create_autocmd({ 'VimEnter', 'UIEnter', 'BufAdd', 'BufDelete' }, {
      callback = function()
        vim.schedule(function()
          local buffers = get_bufs()
          for i, v in ipairs(buffers) do
            buflist_cache[i] = v
          end
          for i = #buffers + 1, #buflist_cache do
            buflist_cache[i] = nil
          end

          -- check how many buffers we have and set showtabline accordingly
          if #buflist_cache > 1 then
            vim.o.showtabline = 2 -- always
          elseif vim.o.showtabline ~= 1 then -- don't reset the option if it's already at default value
            vim.o.showtabline = 1 -- only when #tabpages > 1
          end
        end)
      end,
    })

    -- UI
    local lib = require('heirline-components.all')
    return {
      opts = {
        disable_winbar_cb = function(args) -- We do this to avoid showing it on the greeter.
          local is_disabled = not require('heirline-components.buffer').is_valid(args.buf)
            or lib.condition.buffer_matches({
              buftype = { 'terminal', 'prompt', 'nofile', 'help', 'quickfix' },
              filetype = {
                'NvimTree',
                'neo%-tree',
                'dashboard',
                'Outline',
                'aerial',
                'rnvimr',
                'yazi',
              },
            }, args.buf)
          return is_disabled
        end,
      },
      tabline = { -- UI upper bar
        lib.component.tabline_conditional_padding(),
        lib.component.tabline_buffers(),
        lib.component.fill({ hl = { bg = 'tabline_bg' } }),
        lib.component.tabline_tabpages(),
      },
      winbar = { -- UI breadcrumbs bar
        init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        fallthrough = false,
        -- Winbar for terminal, neotree, and aerial.
        {
          condition = function() return not lib.condition.is_active() end,
          {
            lib.component.neotree(),
            lib.component.compiler_play(),
            lib.component.fill(),
            lib.component.compiler_redo(),
            lib.component.aerial(),
          },
        },
        -- Regular winbar
        {
          lib.component.neotree(),
          lib.component.compiler_play(),
          lib.component.fill(),
          lib.component.breadcrumbs(),
          lib.component.fill(),
          lib.component.compiler_redo(),
          lib.component.aerial(),
        },
      },
      statuscolumn = { -- UI left column
        init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        lib.component.foldcolumn(),
        lib.component.numbercolumn(),
        lib.component.signcolumn(),
      } or nil,
      statusline = { -- UI statusbar
        hl = { fg = 'fg', bg = 'bg' },
        lib.component.mode(),
        lib.component.git_branch(),
        lib.component.git_diff(),
        lib.component.diagnostics(),
        lib.component.fill(),
        lib.component.cmd_info(),
        lib.component.fill(),
        lib.component.lsp(),
        lib.component.file_info(),
        lib.component.compiler_state(),
        lib.component.virtual_env(),
        lib.component.nav(),
        lib.component.mode({ surround = { separator = 'right' } }),
      },
    }
  end,
  config = function(_, opts)
    local heirline = require('heirline')
    local heirline_components = require('heirline-components.all')

    -- Setup
    heirline_components.init.subscribe_to_events()
    heirline.load_colors(heirline_components.hl.get_colors())
    heirline.setup(opts)
  end,
}
