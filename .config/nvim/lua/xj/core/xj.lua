local M = {}

-- xj nvim dir
--    XJ_NVIM_DIR is $HOME/.dotfiles/nvim instead of $XDG_CONFIG
--   update path should be XJ_NVIM_DIR
function M.get_install_dir()
    local config_dir = os.getenv('XJ_NVIM_DIR')
    if not config_dir then
        return os.getenv('HOME') .. '.dotfiles/nvim'
    end
    return config_dir
end

-- update
function M.update()
    local logger = require('lua.xj.utility.logger')
    local job = require('plenary.job')
    local path = M.get_install_dir()
    local errors = {}

    job:new({
        command = 'git',
        args = {
            'pull',
            '--ff-only'
        },
        cwd = path,
        on_start = function()
            logger:log('Updating...')
        end,
        on_exit = function()
            if vim.tbl_isempty(errors) then
                logger:log('Updated! Running CosmicReloadSync...')
                M.reload_user_config_sync()
            else
                table.insert(errors, 1, 'Something went wrong! Please pull changes manually.')
                table.insert(errors, 2, '')
                logger:error('Update failed!', {
                    timeout = 30000
                })
            end
        end,
        on_stderr = function(_, err)
            table.insert(errors, err)
        end
    }):sync()
end

return M
