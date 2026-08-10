-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "c", "cpp", "md", "txt", "c.snippets", "cpp.snippets" },
  callback = function()
    vim.b.autoformat = true
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})






-- vim.api.nvim_create_autocmd("BufNewFile", {
--   pattern = vim.fn.expand("~/Project/Problem/") .. "/*.cpp",
--   callback = function()
--     local template = vim.fn.expand("~/Project/Problem/") .. "/Tem/template.cpp"
--     if vim.fn.filereadable(template) == 1 then
--       local lines = vim.fn.readfile(template)
--       vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
--       print("Template inserted")
--     end
--   end,
-- })
