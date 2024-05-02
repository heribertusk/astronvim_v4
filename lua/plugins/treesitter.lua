-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "lua",
      "vim",
      "php",
      "vue",
      "javascript",
      "typescript",
      "css",
      "scss",
      -- add more arguments for adding more treesitter parsers
    })
    -- add support to laravel-blade
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "blade",
    }

    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "blade" })
  end,
}
