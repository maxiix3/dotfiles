import subprocess

from i3pystatus import Status

status = Status(standalone=True)

# Displays clock like this:
# Tue 30 Jul 21:59:46
status.register("clock",
    format="%a %-d %b %H:%M:%S",)


# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)

#status.register("load")


# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
    format="{temp:.0f}°C",)



# The battery monitor has many formatting options, see README for details

# This would look like this, when discharging (or charging)
# ↓14.22W 56.15% [77.81%] 2h:41m
# And like this if full:
# =14.22W 100.0% [91.21%]
#
# This would also display a desktop notification (via dbus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
status.register("battery",
    interval=1,
    format="{status} | {consumption:.2f}W {percentage:.2f}% {remaining:%E%hh:%Mm}",
    battery_ident="BAT1",
    status={
        "DIS": "↓",
        "CHR": "↑",
        "FULL": "=",
        "DPL": "Ø",
    },)

status.register("battery",
    interval=0.01,
    format="{status} | {consumption:.2f}W {percentage:.2f}% {remaining:%E%hh:%Mm}",
    alert=True,
    battery_ident="BAT0",
    alert_percentage=7,
    status={
        "DIS": "↓",
        "CHR": "↑",
        "FULL": "=",
    },)

# Displays whether a DHCP client is running
status.register("runwatch",
    name="DHCP",
    path="/var/run/dhclient*.pid",)

# Shows the address and up/down state of eth0. If it is up the address is shown in
# green (the default value of color_up) and the CIDR-address is shown
# (i.e. 10.10.10.42/24).
# If it's down just the interface name (eth0) will be displayed in red
# (defaults of format_down and color_down)
#
# Note: the network module requires PyPI package netifaces
#status.register("network",
#    interface="eth0",
#    format_up="{v4cidr}",)

# Has all the options of the normal network and adds some wireless specific things
# like quality and network names.
#
# Note: requires both netifaces and basiciw
status.register("network",
    interface="wlp1s0",
    format_up="{essid} {quality}%",)


# Shows disk usage of /
# Format:
# 42/128G [86G]
status.register("disk",
    path="/home",
    format="{used}G/{avail}G",
    critical_limit=2,
    color="#FFFFFF",
    critical_color="#FFFFFF",)

# Shows pulseaudio default sink volume
# Note: requires libpulseaudio from PyPI
status.register("alsa",
   format="♪{volume}",
   card=1,
   color_muted="#A00000",
   mixer="Master",)


# Shows the weather of Oslo, for other locations find your location on weahter.com
# Show utf-8 icons for weather (not working now)
status.register("weather",
    location_code="NOXX0029:1:NO",
    colorize=True,
    interval=120,)

status.register("spotify",)

# Shows mpd status
# Format:
# Cloud connected▶Reroute to Remain
"""
status.register("mpd",
    format="{title}{status}{album}",
    status={
        "pause": "▷",
        "play": "▶",
        "stop": "◾",
    },)
"""



status.run()

