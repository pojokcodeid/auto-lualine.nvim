## preview
### roundedall
![home!](img.png)
### rounded
![home!](rounded.png)
### paralelgram
![home!](paralelgram.png)
### square
![home!](square.png)
### transparant
![home!](transparant.png)
### triangle
![home!](triangle.png)
### default
![home!](default.png)
# auto-lsp.nvim
- auto-lualine.nvim is an automatic configuration for lualine.nvim
# Instalation
- Lazy
```lua
return {
  {
    "pojokcodeid/auto-lualine.nvim",
    event = { "InsertEnter", "BufRead", "BufNewFile" },
    dependencies = { "nvim-lualine/lualine.nvim" },
    config = function()
      local lualine = require("auto-lualine")
      -- tokyonight, tokyonight-night, tokyonight-storm, tokyonight-day, tokyonight-moon
      -- gruvbox-baby (default)
      -- sonokai, sonokai_atlantis,
      -- sonokai_andromeda,sonokai_shusia,sonokai_maia,sonokai_espresso
      -- material, material_deepocean, material_palenight, material_lighter, material_darker
      -- onedark, onedark_vivid, onedark_dark
      -- nord
      -- catppuccin, catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
      -- dracula
      -- nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox
      -- github_dark, github_dark_default, github_dark_colorblind, github_dark_dimmed
      -- solarized-osaka
      -- darcula-dark
      -- juliana
      -- Eva-Dark, Eva-Dark-Italic, Eva-Dark-Bold
      local color = "auto"
      -- rounded
      -- roundedall
      -- square
      -- triangle
      -- parallelogram
      -- transparent
      -- default
      local options = "roundedall"
      -- 0 = on full text mode info,
      -- 1 = on initial mode + logo
      -- 2 = logo only
      -- 3 = initial only
      -- 4 = off
      local show_mode = 0
      lualine.setup(color, options, show_mode)
    end,
  },
}
```
