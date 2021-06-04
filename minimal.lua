require('lv-globals')
vim.cmd('luafile '..CONFIG_PATH..'/lv-settings.lua')

-- TODO is there a way to do this without vimscript
vim.cmd('source '..CONFIG_PATH..'/vimscript/functions.vim')

require('settings')
require('lv-gitblame')
require('plugins')
