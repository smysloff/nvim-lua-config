-- :help options
local options = {

	--aleph = 224,
	--allowrevins = off,
	--ambiwidth = "single",
	--autochdir = off,
	--arabic = off,
	--arabicshape = on,
	--autoindent = on,
	--autoread = on,
	--autowrite = off,
	--autowriteall = off,
	--background = "dark",
	--backspace = "indent,eol,start",
	--backup = off,
	--backupcopy = "auto",
	--backupdir = ".,$XDG_STATE_HOME/nvim/backup//",
	--backupext = "~",
	--backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*",
	--belloff = "all",
	--binary = off,
	--bomb = off,
	--breakat = " ^I!@*-+;:,./?",
	--breakindent = off,

	backup = false,                                -- creates a backup file
	clipboard = "unnamedplus",                     -- allows neovim to access the system clipboard
	cmdheight = 1,                                 -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" },       -- mostly just for cmp
	conceallevel = 0,                              -- so that `` is visible in markdown files
	cursorline = false,                            -- highlight the current line
	expandtab = true,                              -- convert tabs to spaces
	fileencoding = "utf-8",                        -- the encoding written to a file
	guifont = "monospace:h17",                     -- the font used in graphical neovim applications
	hlsearch = true,                               -- highlight all matches on previous search pattern
	ignorecase = true,                             -- ignore case in search patterns
	mouse = "a",                                   -- allow the mouse to be used in neovim
	number = true,                                 -- set numbered lines
	numberwidth = 4,                               -- set number column width to 2 {default 4}
	pumheight = 10,                                -- pop up menu height
	relativenumber = true,                         -- set relative numbered lines
	scrolloff = 8,                                 -- is one of my fav
	shiftwidth = 4,                                -- the number of spaces inserted for each indentation
	showmode = true,                               -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2,                               -- always show tabs
	sidescrolloff = 8,
	signcolumn = "yes",                            -- always show the sign column, otherwise it would shift the text each time
	smartcase = true,                              -- smart case
	smartindent = true,                            -- make indenting smarter again
	splitbelow = true,                             -- force all horizontal splits to go below current window
	splitright = true,                             -- force all vertical splits to go to the right of current window
	swapfile = false,                              -- creates a swapfile
	tabstop = 4,                                   -- insert 2 spaces for a tab
	termguicolors = true,                          -- set term gui colors (most terminals support this)
	timeoutlen = 1000,                             -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true,                               -- enable persistent undo
	updatetime = 300,                              -- faster completion (4000ms default)
	wrap = false,                                  -- display lines as one long line
	writebackup = false,                           -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- indention 2 space in some filetypes
local fileTypesIndentGroup = vim.api.nvim_create_augroup(
	"FileTypesIndent",
	{ clear = true }
)
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		'html',
		'javascript',
		'typescript',
	},
	callback = function() 
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end,
	group = fileTypesIndentGroup
})
