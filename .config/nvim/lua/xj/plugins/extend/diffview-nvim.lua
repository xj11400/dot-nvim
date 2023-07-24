return {
  {
    "sindrets/diffview.nvim",
    event = "User ZXGitFile",
    cmd = { "DiffviewOpen" },
  },
  {
    "NeogitOrg/neogit",
    optional = true,
    opts = { integrations = { diffview = true } },
  },
}
