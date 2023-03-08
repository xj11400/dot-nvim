-- modules
local modules = {
    -- editor
    'xj.config.editor',

    -- plugins
    'xj.core.plugin',
    'xj.plugin',

    -- commands
    'xj.config.commands',

    -- lsp
    'xj.lsp',

    -- custom
    'xj.custom.editor',

    -- load mappings only after editor configs are loaded
    'xj.config.mappings'
}

-- load modules
for _, mod in ipairs(modules) do
    local ok, err = pcall(require, mod)
    -- xj.custom files may or may not be present
    if not ok and not mod:find('xj.custom') then
        error(('Error loading %s...\n\n%s'):format(mod, err))
    end
end
