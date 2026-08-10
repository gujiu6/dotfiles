local envs = {
    base = "/home/gujiu/miniconda3/bin/python",
    CTF   = "/home/gujiu/miniconda3/envs/CTF/bin/python",
}

local current = "re"

vim.g.python3_host_prog = envs[current]

-- 切换函数
local function switch_env(name)
    if envs[name] then
        current = name
        vim.g.python3_host_prog = envs[name]
        vim.notify("Python env → " .. name)
    else
        vim.notify("Env not found")
    end
end

-- 快捷键
vim.keymap.set("n", "<leader>pb", function() switch_env("base") end, {desc="base"})
vim.keymap.set("n", "<leader>pc", function() switch_env("CTF") end, {desc="CTF"})
