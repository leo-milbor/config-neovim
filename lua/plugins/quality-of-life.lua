return {
  -- Automatically add pair i.e. (), [], {}, etc.
  {
    'nvim-mini/mini.pairs',
    version = '*',
    config = function()
      require('mini.pairs').setup()
    end
  },
  -- Show indent level.
  { 'nvim-mini/mini.indentscope', version = '*' },
}
