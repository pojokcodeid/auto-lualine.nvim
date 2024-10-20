local M = {}
_G.switch = function(param, case_table)
  local case = case_table[param]
  if case then
    return case()
  end
  local def = case_table["default"]
  return def and def() or nil
end

local function ambilKataDariKiri(kalimat, jumlahKata)
  local hasil = ""
  local posisiAwal = 1
  local kataKe = 0

  while kataKe < jumlahKata do
    local posisiSpasi = string.find(kalimat, " ", posisiAwal)
    if posisiSpasi then
      hasil = hasil .. string.sub(kalimat, posisiAwal, posisiSpasi - 1) .. " "
      posisiAwal = posisiSpasi + 1
    else
      hasil = hasil .. string.sub(kalimat, posisiAwal)
      break
    end
    kataKe = kataKe + 1
  end

  return hasil
end


M.setup = function(opts)
  -- definisikan lsp progress
  local data_ok, lspprogress = pcall(require, "lsp-progress")
  if data_ok then
    lspprogress.setup({
      client_format = function(client_name, spinner, series_messages)
        return #series_messages > 0
            and (spinner .. " " .. ambilKataDariKiri(table.concat(series_messages, ", "), 4) .. "...")
          or nil
      end,
      format = function(client_messages)
        local sign = ""
        return #client_messages > 0
            and (sign .. " " .. ambilKataDariKiri(table.concat(client_messages, " "), 4) .. "...")
          or sign
      end,
    })
  end
  -- check config for theme
  local component = require("auto-lualine.settings.lualine_component")
  local colors = component.colors
  local set_theme = "auto"
  local bubbles_theme
  local color = opts.setColor or "auto"
  local theme_option = opts.setOption or "rounded"
  component.setShowMode(opts.setMode or 0)
  switch(color, {
    ["tokyonight"] = function()
      set_theme = "auto"
    end,
    ["tokyonight-night"] = function()
      set_theme = "auto"
    end,
    ["tokyonight-storm"] = function()
      set_theme = "auto"
    end,
    ["tokyonight-day"] = function()
      set_theme = "auto"
    end,
    ["tokyonight-moon"] = function()
      set_theme = "auto"
    end,
    ["dracula"] = function()
      local clr = require("dracula").colors()
      colors.blue = clr.green
      colors.black = clr.black
      colors.cyan = clr.yellow
      set_theme = "bubbles_theme"
    end,
    ["Eva-Dark"] = function()
      colors.skyblue_1 = "#598DEF"
      colors.grey = "#3b4261"
      colors.blue = "#98C379"
      colors.cyan = "#B0B7C3"
      colors.yellow = "#EF973A"
      colors.green1 = "#56B7C3"
      colors.red = "#E06C75"
      set_theme = "bubbles_theme"
    end,
    ["Eva-Dark-Italic"] = function()
      colors.skyblue_1 = "#598DEF"
      colors.grey = "#3b4261"
      colors.blue = "#98C379"
      colors.cyan = "#B0B7C3"
      colors.yellow = "#EF973A"
      colors.green1 = "#56B7C3"
      colors.red = "#E06C75"
      set_theme = "bubbles_theme"
    end,
    ["Eva-Dark-Bold"] = function()
      colors.skyblue_1 = "#598DEF"
      colors.grey = "#3b4261"
      colors.blue = "#98C379"
      colors.cyan = "#B0B7C3"
      colors.yellow = "#EF973A"
      colors.green1 = "#56B7C3"
      colors.red = "#E06C75"
      set_theme = "bubbles_theme"
    end,
    default = function()
      set_theme = "auto"
    end,
  })

  bubbles_theme = component.bubbles_theme(colors)
  if set_theme == "auto" then
    bubbles_theme = vim.fn.fnamemodify("auto", ":t")
  end

  local gettheme = require("auto-lualine.settings.lualine_template")
  local theme = gettheme.rounded(bubbles_theme)
  if theme_option == "rounded" then
    theme = gettheme.rounded(bubbles_theme)
  elseif theme_option == "roundedall" then
    theme = gettheme.roundedall(bubbles_theme)
  elseif theme_option == "square" then
    theme = gettheme.square(bubbles_theme)
  elseif theme_option == "transparent" then
    theme = gettheme.square(component.transparent(colors))
  elseif theme_option == "triangle" then
    theme = gettheme.triangle(bubbles_theme)
  elseif theme_option == "parallelogram" then
    theme = gettheme.parallelogram(bubbles_theme)
  elseif theme_option == "default" then
    theme = {}
  end
  require("lualine").setup({
    options = theme.options,
    sections = theme.sections,
    inactive_sections = theme.inactive_sections,
    tabline = theme.tabline,
    extensions = theme.extensions,
  })
end

return M
