#!/bin/bash

if ! command -v flatpak-builder &>/dev/null; then
  if command -v dnf &>/dev/null; then
    echo "Installing dependencies..."
    sudo dnf install -y flatpak flatpak-builder
  elif command -v apt-get &>/dev/null; then
    echo "Installing dependencies..."
    sudo apt-get install -y flatpak flatpak-builder
  else
    echo "flatpak-builder not found. Please install it and run this script again."
    exit 1
  fi
fi
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Fill in manifest template
cp studio.affinity.Affinity.template.yaml studio.affinity.Affinity.yaml
sed -i "s|\$HOME|$HOME|g" studio.affinity.Affinity.yaml

# Build and install (this will take a while)
flatpak-builder --force-clean --user --install-deps-from=flathub --install builddir studio.affinity.Affinity.yaml
