-- Initialize Configuration
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- fonts
config.font = wezterm.font("JetBrains Mono")
config.font_size = 19

-- blurrr
config.window_background_opacity = 0.85
config.macos_window_background_blur = 1
config.initial_rows = 45
config.initial_cols = 180
config.window_decorations = "RESIZE"

-- colors
-- config.color_scheme = "kanagawabones"
config.color_scheme = "Tokyo Night"

-- tab
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = false
config.use_fancy_tab_bar = false

wezterm.on("format-tab-title", function(tab, _, _, _, hover)
    local background = config.colors.brights[1]
    local foreground = config.colors.foreground

    if tab.is_active then
        background = config.colors.brights[7]
        foreground = config.colors.background
    elseif hover then
        background = config.colors.brights[8]
        foreground = config.colors.background
    end

    local title = tostring(tab.tab_index + 1)
    return {
        { Foreground = { Color = background } },
        { Text = "█" },
        { Background = { Color = background } },
        { Foreground = { Color = foreground } },
        { Text = title },
        { Foreground = { Color = background } },
        { Text = "█" },
    }
end)
return config
