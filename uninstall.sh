#!/bin/bash

flatpak remove --delete-data studio.affinity.Affinity
rm -rf .flatpak-builder builddir repo
