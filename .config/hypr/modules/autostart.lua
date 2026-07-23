
hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("lxpolkit")
    hl.exec_cmd("hyprsunset")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("sleep 2; hyprctl dispatch focusmonitor HDMI-A-1; snappy-switcher --daemon >/tmp/snappy-switcher.log 2>&1")
end)
