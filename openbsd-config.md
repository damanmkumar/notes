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

### References
[1] https://gibbel.us/openbsd/trackpoint.html
