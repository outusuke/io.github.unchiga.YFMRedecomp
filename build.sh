#!/bin/sh
set -e
cd "$(dirname "$0")"
ID=io.github.unchiga.YFMRedecomp
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak-builder --user --force-clean --install-deps-from=flathub --repo=repo build $ID.yml
flatpak build-bundle repo $ID.flatpak $ID --runtime-repo=https://dl.flathub.org/repo/flathub.flatpakrepo
echo "Done: $ID.flatpak"
