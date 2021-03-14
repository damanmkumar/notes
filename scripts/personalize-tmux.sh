#! /bin/sh

CONF="$HOME/.tmux.conf"

if [ -f $CONF ]; then
	echo "$CONF exists. This script is intended to configure"
	echo "tmux with barebones settings. Remove $CONF and"
	echo "re-run this script if you wish to proceed."
	exit 1
fi

echo "Changing prefix and prefix2..."
echo "set-option -g prefix C-a"   >> $CONF
echo "set-option -g prefix2 C-b" >> $CONF
echo "Changing default-command..."

echo "Re-binding C-a double-press to send prefix key..."
echo "" >> $CONF
echo "# re-bind C-a double-press to send prefix key" >> $CONF
echo "unbind-key C-a" >> $CONF
echo "unbind-key C-b" >> $CONF
echo "bind-key C-a send-prefix" >> $CONF
echo "bind-key C-b send-prefix -2" >> $CONF

echo "Setting scrollback limit to 100,000"
echo "set-option -g history-limit 100000" >> $CONF

echo "Setting TERM to screen-256color"
echo "set-option -g default-terminal \"screen-256color\"" >> $CONF

echo "Done."
