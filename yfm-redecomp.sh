#!/bin/sh
# The game looks for game/, languages/ and mods/ next to its binary.
cd /app/lib/yfm-redecomp || exit 1
if [ -e /lib/ld-linux.so.2 ]; then
    exec ./memories-pc "$@"
fi
# /lib/ld-linux.so.2 isn't always present, so call the Compat.i386 loader directly.
for ld in /usr/lib/i386-linux-gnu/ld-linux.so.2 /usr/lib32/ld-linux.so.2; do
    [ -x "$ld" ] && exec "$ld" ./memories-pc "$@"
done
echo "32-bit runtime not found. Install:" >&2
echo "  flatpak install flathub org.freedesktop.Platform.Compat.i386//25.08 org.freedesktop.Platform.GL32.default//25.08" >&2
exit 1
