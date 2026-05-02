This is an unofficial installer for Affinity v3 for Linux
with support for hardware acceleration.

## Install

Run the following in your terminal:
```
git clone https://github.com/adil192/affinity-for-linux
cd affinity-for-linux
./install.sh
```

If you want to uninstall in the future, run `./uninstall.sh`.

## Hardware acceleration

To get hardware acceleration, you need to install and setup OpenCL on your system.

These instructions are for Fedora, tested on Fedora 44.
If you're not using Fedora, consult your distro's documentation for instructions.

1. Add yourself to the render and video groups:
   ```bash
   sudo usermod -a -G render,video $LOGNAME
   ```
2. Enable RPM Fusion repos:
   ```bash
   sudo dnf install \
     https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
     https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
   ```
3. Install the drivers for your GPU.
   - Intel: `sudo dnf install mesa-libOpenCL intel-opencl intel-compute-runtime`
   - AMD: `sudo dnf install mesa-libOpenCL rocm`
   - Nvidia: Install the [nvidia drivers](https://rpmfusion.org/Howto/NVIDIA).
4. Reboot.

Hardware acceleration should be automatically enabled in Affinity.
If it's still not working, consult
[Fedora's Heterogeneous Computing docs](https://fedoraproject.org/wiki/SIGs/HC)
or the bigger knowledge base at
[seapear/AffinityOnLinux](https://github.com/seapear/AffinityOnLinux).

## Credits

Based on guides and work from
[seapear/AffinityOnLinux](https://github.com/seapear/AffinityOnLinux) and
[ryzendew/Linux-Affinity-Installer](https://github.com/ryzendew/Linux-Affinity-Installer/blob/main/AffinityScripts/Affinityv3.sh).
The biggest difference with my script is that all the setup is done in a flatpak
environment to make the process easier and more reproducible.

This project has no affiliation with Serif, Canva, or Affinity. All trademarks are property of their respective owners.

It also has no affiliation with
[seapear/AffinityOnLinux](https://github.com/seapear/AffinityOnLinux) or 
[ryzendew/Linux-Affinity-Installer](https://github.com/ryzendew/Linux-Affinity-Installer/blob/main/AffinityScripts/Affinityv3.sh).
