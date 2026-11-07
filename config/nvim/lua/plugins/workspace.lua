return {
  { "LazyVim/LazyVim", opts = { colorscheme = "tokyonight-moon" } },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "moon",
      transparent = false,
      styles = { comments = { italic = false }, keywords = { italic = false } },
      -- Match the desktop's Noctalia palette, including derived UI colors.
      on_colors = function(c)
        local palette = {
          bg = "#111111", bg_dark = "#161616", bg_dark1 = "#0d0d0d",
          bg_highlight = "#252525", bg_popup = "#191919", bg_float = "#191919",
          bg_sidebar = "#111111", bg_statusline = "#191919", bg_visual = "#333333",
          bg_search = "#635039", black = "#0d0d0d", border = "#303030",
          border_highlight = "#d9ad73", fg = "#d4d4d4", fg_dark = "#a3a3a3",
          fg_sidebar = "#b8b8b8", fg_float = "#d4d4d4", fg_gutter = "#555555",
          comment = "#858585", dark3 = "#666666", dark5 = "#999999",
          blue = "#8baac4", blue0 = "#617b91", blue1 = "#89b5b1",
          blue2 = "#89b5b1", blue5 = "#89b5b1", blue6 = "#b6cfcc", blue7 = "#33414c",
          cyan = "#89b5b1", teal = "#89b5b1", green = "#a7bd8d",
          green1 = "#a7bd8d", green2 = "#89b5b1", yellow = "#d9ad73",
          orange = "#d9ad73", magenta = "#b5a0bd", magenta2 = "#b5a0bd",
          purple = "#b5a0bd", red = "#d98282", red1 = "#d98282",
          terminal_black = "#737373", error = "#d98282", warning = "#d9ad73",
          info = "#8baac4", hint = "#89b5b1", todo = "#d9ad73",
        }
        for key, value in pairs(palette) do c[key] = value end
        c.git = { add = c.green, change = c.yellow, delete = c.red, ignore = c.dark3 }
        c.diff = { add = "#243023", delete = "#382323", change = "#263038", text = "#3b4d5a" }
        c.rainbow = { c.blue, c.yellow, c.green, c.teal, c.magenta, c.purple, c.orange, c.red }
        c.terminal = {
          black = c.black, black_bright = c.terminal_black,
          red = c.red, red_bright = c.red, green = c.green, green_bright = c.green,
          yellow = c.yellow, yellow_bright = c.yellow, blue = c.blue, blue_bright = c.blue,
          magenta = c.magenta, magenta_bright = c.magenta,
          cyan = c.cyan, cyan_bright = c.cyan, white = c.fg, white_bright = "#e6e8ec",
        }
      end,
      on_highlights = function(hl, c)
        hl.CursorLine = { bg = "#1c1c1c" }
        hl.CursorLineNr = { fg = c.yellow, bold = true }
        hl.WinSeparator = { fg = c.border }
        hl.Directory = { fg = c.yellow }
        hl.FloatBorder = { fg = c.border, bg = c.bg_float }
        hl.FloatTitle = { fg = c.yellow, bg = c.bg_float, bold = true }
        hl.SnacksPickerDirectory = { fg = c.fg_dark }
        hl.SnacksPickerBorder = { fg = c.border, bg = c.bg }
        hl.SnacksPickerInputBorder = { fg = c.border, bg = c.bg }
        hl.SnacksPickerInputTitle = { fg = c.yellow, bg = c.bg, bold = true }
        hl.SnacksPickerListCursorLine = { bg = "#29251f" }
        hl.SnacksIndent = { fg = "#292929" }
        hl.SnacksIndentScope = { fg = "#665239" }
        hl.BufferLineBufferSelected = { fg = c.yellow, bg = c.bg, bold = true, italic = false }
        hl.BufferLineIndicatorSelected = { fg = c.yellow, bg = c.bg }
        hl.BufferLineFill = { bg = c.bg_dark1 }
        for _, group in pairs(hl) do
          if type(group) == "table" then group.italic = false end
        end
      end,
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local theme = require("lualine.themes._tokyonight").get()
      theme.normal.a = { bg = "#d9ad73", fg = "#111111", gui = "bold" }
      opts.options.theme = theme
      opts.options.component_separators = ""
      opts.options.section_separators = ""
    end,
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
    keys = {
      { "<leader>gD", "<cmd>DiffviewOpen<cr>", desc = "Diff del proyecto" },
      { "<leader>gQ", "<cmd>DiffviewClose<cr>", desc = "Cerrar diff" },
      { "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "Historial del archivo" },
    },
  },
}
