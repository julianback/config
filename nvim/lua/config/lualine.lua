
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
    },
    --lualine_c = {'filename'},
    lualine_c = {
      'filename',
      {
        'diagnostics',
        sources = {'nvim_lsp'},
        symbols = {error = ' ', warn = ' ', info = ' '},
      }
    },
    lualine_x = {
      {
        'diff',
        colored = true, -- displays diff status in color if set to true
        -- all colors are in format #rrggbb
        color_added = '#73daca', -- changes diff's added foreground color
        color_modified = '#e0af68', -- changes diff's modified foreground color
        color_removed = '#f7768e', -- changes diff's removed foreground color
        -- color_removed = nil,
        symbols = {added = '+', modified = '~', removed = '-'} -- changes diff symbols
      },
      'encoding',
      'fileformat',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
