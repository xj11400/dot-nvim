return function(_, opts)
  require("mason-lspconfig").setup(opts)
  require("xj.core.utils").event "MasonLspSetup"
end
