# fixes issue where preview isn't rendering : https://github.com/nvim-telescope/telescope.nvim/issues/1594#issuecomment-993447528
require("telescope").setup({
  defaults = {
    layout_config = {
      horizontal = {
        preview_cutoff = 0,
      },
    },
  },
})
