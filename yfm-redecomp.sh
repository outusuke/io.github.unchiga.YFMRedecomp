#!/bin/sh
# The game looks for game/, languages/ and mods/ next to its binary.
cd /app/lib/yfm-redecomp || exit 1
export LD_LIBRARY_PATH="/app/lib/i386-linux-gnu:/app/lib/i386-linux-gnu/GL/default/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
if [ ! -e /lib/ld-linux.so.2 ]; then
    echo "32-bit loader missing; is Compat.i386 25.08 mounted at /app/lib/i386-linux-gnu?" >&2
    exit 1
fi
exec ./memories-pc "$@"
