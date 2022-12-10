vim.opt.laststatus    = 1
vim.opt.termguicolors = true
vim.opt.cursorline    = true
vim.opt.signcolumn    = "no"

vim.opt.autowrite     = true
vim.opt.swapfile      = false
vim.opt.writebackup   = false

vim.opt.smartindent   = true
vim.opt.shiftwidth    = 4
vim.opt.tabstop       = 4
vim.opt.softtabstop   = 4
vim.opt.expandtab     = true

vim.opt.ignorecase    = true
vim.opt.wrap          = false

vim.opt.encoding      = "utf-8";
vim.opt.fileencodings = "ucs-bom,utf-8,gb18030,default,latin1"
vim.opt.formatoptions:append({ m = true, B = true, })

vim.opt.updatetime    = 300

vim.opt.grepprg       = "rg --vimgrep --smart-case --hidden"
vim.opt.grepformat    = "%f:%l:%c:%m"

require("plugins")

require("material").setup({ async_loading = false })
vim.g.material_style = "darker"
vim.cmd("colorscheme material")
vim.cmd("highlight Normal   guibg=none")
vim.cmd("highlight NormalNC guibg=none")

vim.g.yats_host_keyword = 0
