vim.filetype.add({
  pattern = {
    -- Match files like foo.conf.tmpl, foo.toml.tmpl, etc.
    [".*hypr/.*%.conf%.tmpl"] = { "hyprlang", { priority = 10 } },
    [".*%.conf%.tmpl"] = "confini",
    [".*%.toml%.tmpl"] = "toml",
    [".*%.sh%.tmpl"] = "sh",
    [".*%.zsh%.tmpl"] = "zsh",
    [".*%.bash%.tmpl"] = "bash",
    [".*%.yaml%.tmpl"] = "yaml",
    [".*%.yml%.tmpl"] = "yaml",
    [".*%.json%.tmpl"] = "json",
    [".*%.ini%.tmpl"] = "ini",
    [".*%.py%.tmpl"] = "python",
    [".*%.lua%.tmpl"] = "lua",
    [".*%.css%.tmpl"] = "css",
  },
})
