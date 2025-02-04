local M = {}
local api = vim.api
local initialized = false
local auto_enable

function M.setup(opts)
    if initialized then
        return
    end

    opts = opts or {}
    auto_enable = opts.auto_enable == false and false or true
    -- M._config will become nil latter
    M._config = opts
    initialized = true
end

function M.bootstrap()
    if auto_enable then
        require('bqf.main').enable()
    end
end

function M.enable()
    require('bqf.main').enable()
end

function M.disable()
    require('bqf.main').disable()
end

function M.toggle()
    require('bqf.main').toggle()
end

function M.toggle_auto()
    auto_enable = auto_enable ~= true
    if auto_enable then
        api.nvim_echo({{'Enable nvim-bqf automatically', 'WarningMsg'}}, true, {})
    else
        api.nvim_echo({{'Disable nvim-bqf automatically', 'WarningMsg'}}, true, {})
    end
end

return M
