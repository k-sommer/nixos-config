local function updateMonitorLayout()
    local monitors = hl.get_monitors()
    local hdmiConnected = false

    for _, m in ipairs(monitors) do
        if m.name == "HDMI-A-1" then
            hdmiConnected = true;
            break
        end
    end

    if hdmiConnected then
        hl.monitor({ output = "DP-1", disabled = true, })
        hl.monitor({ output = "DP-2", disabled = true, })
        hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@120", })
    else
        hl.monitor({ output = "DP-1", mode = "2560x1440@144", position = "auto", disabled = false; })
        hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "auto-right", disabled = false, })
    end
end

updateMonitorLayout()

hl.on("monitor.added", function(monitor)
    if monitor.name == "HDMI-A-1" then
        updateMonitorLayout()
    end
end)

hl.on("monitor.removed", function(monitor)
    if monitor.name == "HDMI-A-1" then
        updateMonitorLayout()
    end
end)
