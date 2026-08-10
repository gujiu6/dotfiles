return {
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    keys = {
      { "<leader>cs", function() require("nvim-silicon").clip() end, mode = "v", desc = "截图到剪贴板" },
      { "<leader>cS", function() require("nvim-silicon").file() end, mode = "v", desc = "截图保存文件" },
    },
    opts = {
      theme              = "Dracula",
      background         = "#94e2d5",
      font = "JetBrainsMono NF=34;Noto Sans CJK SC=34",
      no_window_controls = false,
      shadow_blur_radius = 16,
      shadow_offset_x    = 8,
      shadow_offset_y    = 8,
      pad_horiz          = 80,
      pad_vert           = 100,
      no_line_number     = false,
      output             = function()
        local lang = vim.bo.filetype
        local fname = vim.fn.expand("%:t:r")
        return "/home/gujiu/Project/Pic/" .. "(" .. lang .. ")" .. fname  .. ".png"
      end,
    },
  },
}
