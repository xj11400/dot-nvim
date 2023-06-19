return {
    "phaazon/hop.nvim",
    -- event = "BufReadPost",
    keys = {
        { "gsl", "<cmd>HopLine<cr>",  mode = { "n" }, desc = "Hop Line" },
        { "gsr", "<cmd>HopChar1<cr>", mode = { "n" }, desc = "Hop Char" },
    },
    config = true,

}
