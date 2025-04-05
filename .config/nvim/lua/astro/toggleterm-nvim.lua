return {
  "akinsho/toggleterm.nvim",
  specs = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local astro = require("astrocore")

        -- ranger
        if vim.fn.executable("ranger") == 1 then
          maps.n["<Leader>tr"] = {
            function() astro.toggle_term_cmd { cmd = "ranger", direction = "float" } end,
            desc = "ToggleTerm Ranger",
          }
        end

      end,
    },
  },
}