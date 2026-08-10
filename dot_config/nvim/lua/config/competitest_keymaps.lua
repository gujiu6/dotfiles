local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map(
  "n",
  "<leader>cda",
  ":lua codeforce_start()<CR>:CompetiTest receive persistently<CR>",
  vim.tbl_extend("force", opts, { desc = "CompetiTest：原神启动" })
)

-- 新增 / 编辑 / 删除 测试用例
map(
  "n",
  "<leader>cdn",
  ":CompetiTest add_testcase<CR>",
  vim.tbl_extend("force", opts, { desc = "CompetiTest：添加新测试用例" })
)
map(
  "n",
  "<leader>cde",
  ":CompetiTest edit_testcase<CR>",
  vim.tbl_extend("force", opts, { desc = "CompetiTest：编辑测试用例" })
)
-- 直接编辑指定编号的测试用例（可在命令行里替换数字）
-- 使用示例：:CompetiTest edit_testcase 2

map(
  "n",
  "<leader>cdd",
  ":CompetiTest delete_testcase<CR>",
  vim.tbl_extend("force", opts, { desc = "CompetiTest：删除测试用例" })
)
-- 也可用：:CompetiTest delete_testcase 1

-- 运行 / 测试
map(
  "n",
  "<leader>cdt",
  ":CompetiTest run<CR>",
  vim.tbl_extend("force", opts, { desc = "CompetiTest：运行" })
)
-- 清理编译产物（若插件实现清理命令）
map(
  "n",
  "<leader>cdx",
  ":CompetiTest clean<CR>",
  vim.tbl_extend("force", opts, { desc = "CompetiTest：清理临时/编译产物（若支持）" })
)
-- 打开 / 显示 UI（显示 testcases 界面）
map(
  "n",
  "<leader>cdu",
  ":CompetiTest show_ui<CR>",
  vim.tbl_extend("force", opts, { desc = "CompetiTest：显示测试用例 UI" })
)
map(
  "n",
  "<leader>cds",
  ":lua competitest_solve()<CR>",
  vim.tbl_extend("force", opts, { desc = "CompetiTest：问题已解决" })
)

local solve_back = nil

function competitest_solve()
  local current_file = vim.fn.expand("%:p") -- 当前文件的绝对路径
  if current_required_file == "" or not vim.fn.filereadable(current_file) then
    vim.notify("Error: No file is currently opened or file is not readable.", vim.log.levels.ERROR)
    return
  end

  local current_dir = vim.fn.expand("%:p:h") -- 当前文件所在目录
  local solve_dir = current_dir .. "/Solve"

  -- 如果 Solve 目录不存在，则创建
  if not vim.fn.isdirectory(solve_dir) then
    local success = vim.fn.mkdir(solve_dir, "p")
    if success == 0 then
      vim.notify("Error: Failed to create Solve directory.", vim.log.levels.ERROR)
      return
    end
  end

  local filename = vim.fn.expand("%:t") -- 当前文件名（不含路径）
  local target_path = solve_dir .. "/" .. filename

  -- 移动文件到 Solve 目录
  local result = vim.fn.rename(current_file, target_path)
  if result ~= 0 then
    vim.notify("Error: Failed to move file to Solve directory.", vim.log.levels.ERROR)
    return
  end

  -- 设置 solve_back 为原文件名（不含路径）
  solve_back = filename

  -- 打开新位置的文件
  -- vim.cmd("edit " .. vim.fn.fnameescape(target_path))

  vim.cmd("bdelete!") -- 强制删除缓冲区

  vim.notify("CompetiTest：问题已解决", vim.log.levels.INFO)
end

function competitest_solve_back()
  if not solve_back then
    vim.notify("Error: No previous move operation recorded.", vim.log.levels.ERROR)
    return
  end

  local current_file = vim.fn.expand("%:p")
  local current_dir = vim.fn.expand("%:p:h") -- 应该是 .../Solve

  -- 确保当前在 Solve 目录下（可选校验）
  if vim.fn.fnamemodify(current_dir, ":t") ~= "Solve" then
    vim.notify("Warning: Current file is not in a Solve directory. Proceeding anyway.", vim.log.levels.WARN)
  end

  local original_dir = vim.fn.fnamemodify(current_dir, ":h") -- Solve 的父目录
  local original_path = original_dir .. "/" .. solve_back

  -- 移回原位置
  local result = vim.fn.rename(current_file, original_path)
  if result ~= 0 then
    vim.notify("Error: Failed to move file back to original location.", vim.log.levels.ERROR)
    return
  end

  -- 清空 solve_back
  solve_back = nil

  -- 打开原位置的文件
  vim.cmd("edit " .. vim.fn.fnameescape(original_path))

  vim.notify("File moved back to original location.", vim.log.levels.INFO)
end

-- 简洁速查表（可选，按需注释）：
-- <leader>cda : 开始刷题
-- <leader>cdn : 新增测试用例
-- <leader>cde : 编辑测试用例
-- <leader>cdd : 删除测试用例
-- <leader>cdt : 运行（可能触发编译）
