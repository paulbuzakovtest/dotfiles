local N = {}

function N.setup()
	local  v = vim

    v.cmd("autocmd!")
    v.opt.number = true
	v.opt.title = true
	v.opt.autoindent = true
	v.opt.smartindent = true
	v.opt.hlsearch = true
	v.opt.backup = false
	v.opt.showcmd = true
	v.opt.cmdheight = 1
	v.opt.laststatus = 2
	v.opt.expandtab = true
	v.opt.scrolloff = 10
	v.opt.shell = 'fish'
	v.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
	v.opt.inccommand = 'split'
	v.opt.ignorecase = true
	v.opt.smarttab = true
	v.opt.breakindent = true
	v.opt.shiftwidth = 4
	v.opt.tabstop = 4
	v.opt.wrap = false
	v.opt.backspace = { 'start', 'eol', 'indent' }
	v.opt.path:append { '**' }
	v.opt.wildignore:append { '*/node_modules/*' }

    v.termguicolors = true

	v.cmd([[let &t_Cs = "\e[4:3m"]])
	v.cmd([[let &t_Ce = "\e[4:0m"]])
	v.api.nvim_create_autocmd("InsertLeave", {
		pattern = '*',
		command = "set nopaste"
	})

--    v.opt.swapfile = false

    v.opt.clipboard = "unnamedplus"
	v.opt.formatoptions:append { 'r' }

	local ts_group = v.api.nvim_create_augroup("TelescopeOnEnter", { clear = true })
    v.api.nvim_create_autocmd({ "VimEnter" }, {
        callback = function()
            local first_arg = v.v.argv[3]
            if first_arg and v.fn.isdirectory(first_arg) == 1 then
                v.cmd(":bd 1")
                require("telescope.builtin").find_files({ search_dirs = { first_arg } })
            end
        end,
        group = ts_group,
    })

end

return N
