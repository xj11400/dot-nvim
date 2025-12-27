return {
  "akinsho/toggleterm.nvim",
  specs = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local astro = require "astrocore"

        function parseInput(input)
          local pos, cmd

          if input:match "^\\" then
            if input:match "^\\h" or input:match "^\\v" then
              local firstPart, remainder = input:match "^(%S+)%s*(.*)"
              if firstPart == "\\h" then
                pos = "horizontal"
              elseif firstPart == "\\v" then
                pos = "vertical"
              end
              cmd = remainder
            else
              error("Invalid command: input must start with '\\h' or '\\v', not '" .. input:match "^%S+" .. "'")
            end
          else
            pos = "float"
            cmd = input
          end

          return pos, cmd
        end

        maps.n["<Leader>tc"] = {
          function()
            local input = vim.fn.input "[\\h\\v] cmd: "
            local pos, cmd = parseInput(input)
            astro.toggle_term_cmd { cmd = cmd, direction = pos }
          end,
          desc = "ToggleTerm cmd",
        }
      end,
    },
  },
}
