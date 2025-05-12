-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      opts = {
        ensure_installed = {
          "yaml",
        },
        sync_install = true,
        auto_install = true,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      },
    },
    { "tpope/vim-vinegar" },
    { "nvim-tree/nvim-web-devicons", opts = {} },
    { "prichrd/netrw.nvim", opts = {} },
    { "tpope/vim-sensible" },
    { "junegunn/goyo.vim" },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { 
    missing = true,
    colorscheme = { "habamax" } 
  },
  -- Output options for headless mode
  headless = {
    -- show the output from process commands like git
    process = true,
    -- show log messages
    log = true,
    -- show task start/end
    task = true,
    -- use ansi colors
    colors = true,
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

vim.cmd.colorscheme "catppuccin"

-- Start Goyo on startup
vim.cmd("autocmd VimEnter * Goyo 80%")