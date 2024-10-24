return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"omnisharp",
					"pylsp",
					"clangd",
					"jdtls",
					"texlab",
					"html",
					"emmet_language_server",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.omnisharp.setup({
				cmd = { "dotnet", "/home/renee/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },

				-- Enables support for reading code style, naming convention and analyzer
				-- settings from .editorconfig.
				enable_editorconfig_support = true,

				-- If true, MSBuild project system will only load projects for files that
				-- were opened in the editor. This setting is useful for big C# codebases
				-- and allows for faster initialization of code navigation features only
				-- for projects that are relevant to code that is being edited. With this
				-- setting enabled OmniSharp may load fewer projects and may thus display
				-- incomplete reference lists for symbols.
				enable_ms_build_load_projects_on_demand = false,

				-- Enables support for roslyn analyzers, code fixes and rulesets.
				enable_roslyn_analyzers = false,

				-- Specifies whether 'using' directives should be grouped and sorted during
				-- document formatting.
				organize_imports_on_format = false,

				-- Enables support for showing unimported types and unimported extension
				-- methods in completion lists. When committed, the appropriate using
				-- directive will be added at the top of the current file. This option can
				-- have a negative impact on initial completion responsiveness,
				-- particularly for the first few completion sessions after opening a
				-- solution.
				enable_import_completion = false,

				-- Specifies whether to include preview versions of the .NET SDK when
				-- determining which version to use for project loading.
				sdk_include_prereleases = true,

				-- Only run analyzers against open files when 'enableRoslynAnalyzers' is
				-- true
				analyze_open_documents_only = false,
				capabilities = capabilities,
			})
			lspconfig.pylsp.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "python" },
				settings = {
					configurationSources = { "flake8" },
					formatCommand = { "black" },
					pylsp = {
						plugins = {
							-- jedi_completion = {fuzzy = true},
							-- jedi_completion = {eager=true},
							jedi_completion = {
								include_params = true,
							},
							jedi_signature_help = { enabled = true },
							jedi = {
								extra_paths = { "~/projects/work_odoo/odoo14", "~/projects/work_odoo/odoo14" },
								-- environment = {"odoo"},
							},
							pyflakes = { enabled = true },
							pylint = {args = {'--ignore=E501,E231', '-'}, enabled=true, debounce=200},
							pylsp_mypy = { enabled = false },
							pycodestyle = {
								enabled = true,
								ignore = { "E501", "E231", "E226", "E701" },
								maxLineLength = 120,
							},
							yapf = { enabled = true },
						},
					},
				},
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.texlab.setup({
				capabilities = capabilities,
			})
			lspconfig.jdtls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.emmet_language_server.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
