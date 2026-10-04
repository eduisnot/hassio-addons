#!/bin/sh
echo "Starting Kiwix-serve..."
exec kiwix-serve --port=8080 /share/kiwix/*.zim
