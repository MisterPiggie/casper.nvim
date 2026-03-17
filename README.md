# casper.nvim

Neovim plugin that automatically applies your Ghostty terminal theme to Neovim.

## Requirements

- Neovim 0.8+
- Ghostty terminal

## Installation

### lazy.nvim
```lua
{
    "MisterPiggie/casper.nvim",
    config = function()
        require("casper").setup()
    end,
}
```

## How it works

casper.nvim reads your Ghostty config to find the active theme, parses the theme file from `/usr/share/ghostty/themes/` and applies the colors to Neovim highlight groups.

## Notes

- Only activates when running inside Ghostty terminal
- Disables treesitter highlight and LSP semantic tokens to ensure consistent colors
