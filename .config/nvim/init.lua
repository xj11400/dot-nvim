--
-- nvim
-- ============================================
local ok, err = pcall(require, "xj")

if not ok then
    error(("Error loading xj...\n\n%s"):format(err))
end
