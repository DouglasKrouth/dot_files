local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- Requies ripgrep : https://github.com/BurntSushi/ripgrep
vim.keymap.set('n', '<leader>ps', function()
builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
local telescope = require('telescope')
telescope.setup {
pickers = {
find_files = {
hidden = true
}
},
defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".venv"
    }
  }
}
