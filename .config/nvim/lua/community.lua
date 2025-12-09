-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- packs
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.markdown" },

  -- import/override with your plugins folder
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.scrolling.mini-animate" },
  { import = "astrocommunity.register.nvim-neoclip-lua" },
  { import = "astrocommunity.terminal-integration.flatten-nvim" },
  { import = "astrocommunity.terminal-integration.toggleterm-manager-nvim" },
  { import = "astrocommunity.indent.mini-indentscope" },

  --
  -- { import = "astrocommunity." },
  { import = "astrocommunity.code-runner.overseer-nvim" },
  { import = "astrocommunity.lsp.lsp-lens-nvim" },
  -- { import = "astrocommunity.keybinding.hydra-nvim" },
  --
  -- { import = "astrocommunity.note-taking.obsidian-nvim" },
  -- { import = "astrocommunity.note-taking.neorg" },

  { import = "astrocommunity.recipes.ai" },
}
