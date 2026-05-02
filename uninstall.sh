#!/bin/bash

rm -rf ~/.var/app/studio.affinity.Affinity/data/wineprefix/
rm -rf builddir repo

flatpak remove -y --delete-data studio.affinity.Affinity 2>/dev/null
