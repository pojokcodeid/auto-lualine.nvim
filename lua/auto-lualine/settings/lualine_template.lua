local M = {}

local component = require("auto-lualine.settings.lualine_component")
local treesitter = component.treesitter
local lsp_info = component.lsp_info
local diagnostics = component.diagnostics
local diff = component.diff
local spaces = component.spaces
local get_branch = component.get_branch
local lsp_progress = {}
local data_ok, lspprogress = pcall(require, "lsp-progress")
if data_ok then
  lsp_progress = lspprogress.progress
end
local codeium = component.codeium

M.filetype = {
  "TelescopePrompt",
  "packer",
  "alpha",
  "dashboard",
  "NvimTree",
  "Outline",
  "DressingInput",
  "toggleterm",
  "lazy",
  "mason",
  "neo-tree",
  "startuptime",
  "crunner",
  "lspinfo",
  "mysql",
  "dbui",
  "dbout",
  "keymaps_table",
}

M.rounded = function(colorscheme)
  local mode = component.mode_rounded
  return {
    options = {
      theme = colorscheme,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = M.filetype,
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {
        mode,
      },
      lualine_b = { get_branch },
      lualine_c = { diff, lsp_info, lsp_progress },
      lualine_x = { diagnostics, spaces, codeium, treesitter, "filetype" },
      lualine_y = { "progress" },
      lualine_z = {
        { "location", separator = { right = " " }, padding = 1 },
      },
    },
    inactive_sections = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "location" },
    },
    tabline = {},
    extensions = {},
  }
end

M.roundedall = function(colorscheme)
  local mode = component.mode_roundedall
  return {
    options = {
      theme = colorscheme,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = M.filetype,
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {
        mode,
      },
      lualine_b = { get_branch },
      lualine_c = { diff, lsp_info, lsp_progress },
      lualine_x = { diagnostics, spaces, codeium, treesitter, "filetype" },
      lualine_y = { "progress" },
      lualine_z = {
        { "location", separator = { right = " ", left = "" }, padding = 1 },
      },
    },
    inactive_sections = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "location" },
    },
    tabline = {},
    extensions = {},
  }
end

M.triangle = function(colorscheme)
  local mode = component.mode_triangle
  return {
    options = {
      theme = colorscheme,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = M.filetype,
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {
        mode,
      },
      lualine_b = { get_branch },
      lualine_c = { diff, lsp_info, lsp_progress },
      lualine_x = { diagnostics, spaces, codeium, treesitter, "filetype" },
      lualine_y = { "progress" },
      lualine_z = {
        { "location", separator = { right = " ", left = "" }, padding = 1 },
      },
    },
    inactive_sections = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "location" },
    },
    tabline = {},
    extensions = {},
  }
end

M.parallelogram = function(colorscheme)
  local mode = component.mode_parallelogram
  return {
    options = {
      theme = colorscheme,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = M.filetype,
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {
        mode,
      },
      lualine_b = { get_branch },
      lualine_c = { diff, lsp_info, lsp_progress },
      lualine_x = { diagnostics, spaces, codeium, treesitter, "filetype" },
      lualine_y = { "progress" },
      lualine_z = {
        { "location", separator = { right = " ", left = "" }, padding = 1 },
      },
    },
    inactive_sections = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "location" },
    },
    tabline = {},
    extensions = {},
  }
end

M.square = function(colorscheme)
  local mode = component.mode_square
  return {
    options = {
      theme = colorscheme,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = M.filetype,
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {
        mode,
      },
      lualine_b = { get_branch },
      lualine_c = { diff, lsp_info, lsp_progress },
      lualine_x = { diagnostics, spaces, codeium, treesitter, "filetype" },
      lualine_y = { "progress" },
      lualine_z = {
        { "location", separator = { right = " " }, padding = 1 },
      },
    },
    inactive_sections = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "location" },
    },
    tabline = {},
    extensions = {},
  }
end

return M
