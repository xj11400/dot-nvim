return function(_, opts)
  require("which-key").setup(opts)
  require("xj.core.utils").which_key_register()
end
