local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  handlers = {
    ["textDocument/publishDiagnostics"] = function() end,
  },
})
