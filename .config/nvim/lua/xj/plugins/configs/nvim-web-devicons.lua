-- TODO: remove unnecessary file in XXXNvim v4
return function(_, opts)
  require("nvim-web-devicons").set_default_icon(require("xj.core.utils").get_icon "DefaultFile", "#6d8086", "66")
  require("nvim-web-devicons").set_icon(opts)
end
