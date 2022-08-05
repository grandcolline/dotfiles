local wezterm = require 'wezterm';
return {
  font = wezterm.font(
    'JetBrainsMonoNL Nerd Font Mono',
    {
      weight = 'Regular',
      -- weight = 'Thin',
    }
  ),
  font_size = 15.0,
  -- color_scheme = "Ayu Mirage",
  colors = {
    background = "#16171E",
    foreground = "#D1D2D3",
    ansi = {
      "#242627", -- black
      "#D77C79", -- red
      "#7F833D", -- green
      "#D7A24D", -- yellow
      "#516A88", -- blue
      "#714E76", -- magenta
      "#4E7D78", -- cyan
      "#B7BBB7", -- white
    },
    brights = {
      "#4c4c4c", -- black
      "#D77C79", -- red
      "#7B7F26", -- green
      "#D7A24D", -- yellow
      "#405F74", -- blue
      "#714E76", -- magenta
      "#4E7D78", -- cyan
      "#B7BBB7", -- white
    },
    cursor_bg     = '#B7BBB7',
    cursor_border = '#B7BBB7'
  },
  -- window_background_opacity = 0.95,
  hide_tab_bar_if_only_one_tab = true,

  -- フォントサイズ変更時にウィンドウサイズも変更されないようにする
  adjust_window_size_when_changing_font_size = false,
}
