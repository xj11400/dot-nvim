local init_path = debug.getinfo(1, "S").source:sub(2)
local base_dir = init_path:match("(.*[/\\])"):sub(1, -2)

if not vim.tbl_contains(vim.opt.rtp:get(), base_dir) then
  vim.opt.rtp:append(base_dir)
end

-- logger --
local logger = require("xj.core.logger")
logger:init()
--logger:info(os.date("%Y/%m/%d %H:%M:%S"))
logger:info("------ start ------")
--
--logger:print(init_path)
--logger:print(base_dir)
--logger:print(vim.opt.rtp)
--

require("xj.core")

-- in this step 
-- 1. load temp config option. eg. temp disable or ...
-- 2. set all thing to nvim
-- require("xj.config")

-- require("xj.plugins")
-- require("xj.lsp")






















logger:info("------  end  ------")
