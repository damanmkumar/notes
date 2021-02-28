# Ways in which I've configured my OpenBSD install

### ksh(1)

Since there is no login shell while using a Window Manager, `~/.profile`
is never really run. `ksh(1)` executes the file specified by the `ENV`
environment variable. So, set it to `~/.kshrc` in `/etc/X11/xenodm/Xsession`.

### Touchpad and TrackPoint

To disable the touchpad, add the following statement to `/etc/wsconsctl.conf`:  
```
mousepad.tp.disable=1
```

To be able to scroll using the TrackPoint, add the following to
`/etc/X11/xenodm/Xsession` [1]:  
```
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation" 1
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Button" 2
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Axes" 6 7 4 5
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Inertia" 1
```

### Network configuration

We want to choose the ethernet interface when available, and fallback on  
WiFi otherwise. To do so, we create a virtual trunk interface, and  
configure it as follows:

`/etc/hostname.trunk0`:  
```
# we want the interface to failover to wireless
# when a wired connection is unavailable
# em0 should be the "master" interface/port
trunkproto failover trunkport em0 trunkport iwn0
dhcp
```

The ethernet and WiFi interfaces are configured as:

`/etc/hostname.em0`:  
```
up
```

`/etc/hostname.iwn0`:  
```
join "ESSID" wpakey "key" # passed to ifconfig
...
up
```

### References
[1] https://gibbel.us/openbsd/trackpoint.html
