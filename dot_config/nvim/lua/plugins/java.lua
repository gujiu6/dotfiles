return {
  -- ===============================
  -- Java LSP 配置 & 缩进
  -- ===============================
  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "jdtls" then
            client.server_capabilities.documentFormattingProvider = false
            local map = function(mode, lhs, rhs, desc)
              vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc })
            end
            map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
            map("n", "gr", vim.lsp.buf.references, "References")
            map("n", "K", vim.lsp.buf.hover, "Hover")
            map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
            map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
          end
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          vim.opt_local.tabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.expandtab = true
          vim.opt_local.softtabstop = 4
        end,
      })
    end,
  },
}
