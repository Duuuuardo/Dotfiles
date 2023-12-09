local kind = require("user.kind")

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "custom"


local function button(sc, txt, keybind)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

  local opts = {
    position = "center",
    text = txt,
    shortcut = sc,
    cursor = 5,
    width = 24,
    align_shortcut = "right",
    hl_shortcut = "Number",
    hl = "Function",
  }
  if keybind then
    opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
  end

  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = opts,
  }
end

local buttons = {
  type = "group",
  val = {
    button("f", " " .. kind.cmp_kind.Folder .. " Explore", ":Telescope find_files<CR>"),
    button("e", " " .. kind.cmp_kind.File .. " New file", ":ene <BAR> startinsert <CR>"),
    button("s", " " .. kind.icons.magic .. " Restore", ":lua require('persistence').load()<cr>"),
    button(
      "g",
      " " .. kind.icons.git .. " Git Status",
      ":lua require('lvim.core.terminal')._exec_toggle({cmd = 'lazygit', count = 1, direction = 'float'})<CR>"
    ),
    button("r", " " .. kind.icons.clock .. " Recents", ":Telescope oldfiles<CR>"),
    button("c", " " .. kind.icons.settings .. " Config", ":e ~/.config/lvim/config.lua<CR>"),
    button("q", " " .. kind.icons.exit .. " Quit", ":q<CR>"),
  },
  opts = {
    spacing = 1,
  },
}

local section = {
  buttons = buttons,
}

lvim.builtin.alpha.custom = {
  config = {
    layout = {
      { type = "padding", val = 12 },
      section.header,
      { type = "padding", val = 2 },
      section.heading,
      section.plugin_count,
      { type = "padding", val = 1 },
      section.buttons,
      section.footer,
    },
    opts = {
      margin = 5,
    },
  }
}