return {
  {
    "davidmh/mdx.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "markdown",
        "markdown_inline",
        "tsx",
        "jsx",
        "javascript",
        "typescript",
      })
    end,
  },
  -- MDX language server (@mdx-js/language-server); mason auto-installs it.
  -- Bundles its own TypeScript handling, so it works alongside tsgo.
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        mdx_analyzer = {
          filetypes = { "mdx" },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        mdx = { "prettier" },
      },
    },
  },
}
