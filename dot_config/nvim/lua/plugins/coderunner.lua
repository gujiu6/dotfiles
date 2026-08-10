#仅编译
local function build_only()
  local ft = vim.bo.filetype
  local file = vim.fn.expand("%:t")
  local dir = vim.fn.expand("%:p:h")
  local name = vim.fn.expand("%:t:r")
  local cmds = {
    c    = string.format("cd %s && mkdir -p Output && gcc %s -std=c23 -O2 -Wall -o Output/%s", dir, file, name),
    cpp  = string.format("cd %s && mkdir -p Output && g++ %s -std=c++23 -O2 -Wall -o Output/%s", dir, file, name),
    rust = string.format("cd %s && cargo build", dir),
    java = string.format("cd %s && mkdir -p Output && javac -d Output %s", dir, file),
  }
  local cmd = cmds[ft]
  if not cmd then
    vim.notify("不支持的文件类型: " .. ft, vim.log.levels.WARN)
    return
  end
  vim.fn.jobstart(cmd, {
    on_exit = function(_, code)
      if code == 0 then
        vim.notify("编译成功", vim.log.levels.INFO)
      else
        vim.notify("编译失败，退出码: " .. code, vim.log.levels.ERROR)
      end
    end,
  })
end

return {
  "CRAG666/code_runner.nvim",
  opts = {
    mode = "term",
    focus = true,
    startinsert = true,
    filetype = {
      python = function()
        return vim.g.python3_host_prog .. " -u $fileName"
      end,

      go = "cd $dir && go run $fileName",

      sh = "cd $dir && bash $fileName",

      rust = "cd $dir && cargo run",

      php = "cd $dir && php $fileName | tee /dev/tty | wl-copy",

      c = "cd $dir && mkdir -p Output && gcc $fileName -std=c23 -O2 -Wall -o Output/$fileNameWithoutExt && ./Output/$fileNameWithoutExt",

      cpp = "cd $dir && mkdir -p Output && g++ $fileName -std=c++23 -O2 -Wall -o Output/$fileNameWithoutExt && ./Output/$fileNameWithoutExt",

      java = "cd $dir && mkdir -p Output && javac -d Output $fileName && java -cp Output $fileNameWithoutExt",
    },
  },
  keys = {
    { "<leader>rb", build_only, desc="仅编译"},
    { "<leader>rf", ":RunFile<CR>", desc = "编译并运行" },
  },
}
