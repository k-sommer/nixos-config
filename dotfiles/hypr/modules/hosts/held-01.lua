hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "auto",
    scale = 2,
    transform = 1,
})

hl.config({
    cursor = {
        no_hardware_cursor = 1,
    },

    input = {
        touchdevice.transform = 1,
    },
})