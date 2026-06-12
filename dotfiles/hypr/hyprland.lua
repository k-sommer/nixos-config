require("modules.binds")

local get_hostname = function()
    local f = io.popen("hostnamectl hostname")
    if f == nil then return "" end
    local hostname = f:read("l")
    f:close()
    return hostname
end

-- require("modules.hosts." .. get_hostname())

hl.env("HYPRCURSOR_THEME", "rose-pine")

hl.config({
    xwayland = {
        force_zero_scaling = true
    },

    general = {
		layout = "dwindle",
		gaps_in = 5,
		gaps_out = 10,  
        border_size = 0,       
    },

    decoration = {
        rounding =15, 
    },

    input = {
        numlock_by_default = true,
        touchpad = {
            natural_scroll = true;
            clickfinger_behavior = true,

        },
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
})
