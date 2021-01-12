#! /bin/sh

if ! pgrep tmux 1>/dev/null 2>&1 ; then
	echo "tmux not running... retry running script from within tmux"
	exit 1
fi

CONF="$HOME/.tmux.conf"

if [ -f $CONF ]; then
	echo "$CONF exists. This script is intended to configure"
	echo "tmux with barebones settings. Remove $CONF and"
	echo "re-run this script if you wish to proceed."
	exit 1
fi

echo "Creating $CONF..."
tmux show -g | sed 's/^/set-option -g /' | cat > $CONF

echo "Changing prefix and prefix2..."
sed -i 's/^.* prefix .*$/set-option -g prefix C-a/' $CONF
sed -i 's/^.* prefix2 .*$/set-option -g prefix2 C-b/' $CONF
echo "Changing default-command..."
sed -i 's/^.* default-command .*$/set-option -g default-command ""/' $CONF

echo "Re-binding double-press to send prefix key..."
echo "" >> $CONF
echo "# re-bind double-press to send prefix key" >> $CONF
echo "unbind-key C-a" >> $CONF
echo "unbind-key C-b" >> $CONF
echo "bind-key C-a send-prefix" >> $CONF
echo "bind-key C-b send-prefix -2" >> $CONF

echo "Setting scrollback limit to 100,000"
echo "set-option -g history-limit 100000" >> $CONF

echo "Done."
