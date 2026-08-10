-- ~/.config/nvim/lua/plugins/yazi.lua
return {
  {
    "mikavilpas/yazi.nvim",
    version = "*",            -- 使用最新版
    event = "VeryLazy",       -- 惰性加载
    keys = {
      { "<leader>y", "<cmd>Yazi<CR>", desc = "Open Yazi File Manager" },
    },
    opts = {
      open_for_directories = false,         -- 是否自动替换 netrw
      open_multiple_tabs = false,           -- 每个 split 是否创建 Tab
      change_neovim_cwd_on_close = false,   -- 关闭后是否切换 CWD
      keymaps = {
        show_help = "<F1>",                 -- F1 显示帮助
        open_file = "<CR>",
        open_file_vsplit = "<c-v>",
        open_file_split = "<c-x>",
        open_file_tab = "<c-t>",
        send_to_quickfix_list = "<c-q>",
        grep_in_directory = "<c-s>",
        replace_in_directory = "<c-g>",
        cycle_buffers = "<tab>",
      },
      clipboard_register = "*",             -- 默认剪贴板
    },
  },
}
