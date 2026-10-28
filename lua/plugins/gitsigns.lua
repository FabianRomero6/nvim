return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
      local gs = require('gitsigns')
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      map('n', ']c', function()
        if vim.wo.diff then vim.cmd.normal({ ']c', bang = true }) else gs.nav_hunk('next') end
      end, 'Next git [C]hange')
      map('n', '[c', function()
        if vim.wo.diff then vim.cmd.normal({ '[c', bang = true }) else gs.nav_hunk('prev') end
      end, 'Previous git [C]hange')

      map('n', '<leader>hs', gs.stage_hunk, 'Git [H]unk [S]tage')
      map('n', '<leader>hr', gs.reset_hunk, 'Git [H]unk [R]eset')
      map('n', '<leader>hp', gs.preview_hunk, 'Git [H]unk [P]review')
      map('n', '<leader>hb', gs.blame_line, 'Git [H]unk [B]lame line')
      map('n', '<leader>hd', gs.diffthis, 'Git [H]unk [D]iff against index')
      map('n', '<leader>tb', gs.toggle_current_line_blame, '[T]oggle git [B]lame')
    end,
  },
}
