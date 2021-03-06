vim.o.completeopt = "menuone,noselect"

require('compe').setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  -- The source option is required if you want to enable but others can be omitted.
  source = {
    path = true,
    buffer = false,
    calc = false,
    nvim_lsp = true,
    nvim_lua = false,
    vsnip = false,
    ultisnips = false,
    luasnip = true,
  },
}

vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", { expr = true })
vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", { expr = true })
vim.api.nvim_set_keymap("i", "<C-e>", "compe#close({ 'keys': '<C-e>'})", { expr = true })

