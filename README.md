# dot-nvim

Configure Neovim with [AstroNvim](https://astronvim.com/)

## File Structure

```
nvim/
├── README.md
├── .neoconf.json
├── neovim.yml
├── .stylua.toml
├── init.lua
├── selene.toml
└── lua/
    ├── plugins/
    ├── configs/
    ├── astro/
    ├── community.lua
    ├── polish.lua
    ├── logger.lua
    └── lazy_setup.lua
```

For AstroNvim configurations:
- `astro/`: Directory for AstroNvim configurations
- `community.lua`: AstroNvim community configurations
- `lazy_setup.lua`: Setup file for the Lazy plugin manager
- `polish.lua`: This will run last in the setup process

Custom configurations:
- `plugins/`: Directory for custom plugin configurations
- `configs/`: Directory for general Neovim configurations
- `logger.lua`: Logger module for debugging purposes
