return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    spec = {
      { '<leader>s', group = '[S]earch' },
      { '<leader>h', group = 'Git [H]unk' },
      { '<leader>t', group = '[T]oggle' },
    },
  },
}
