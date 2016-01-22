# RuggedPOD Firmware

[![Build Status](https://travis-ci.org/RuggedPOD/ruggedpod-firmware.svg?branch=master)](https://travis-ci.org/RuggedPOD/ruggedpod-firmware)

This is tooling to automate the RuggedPOD firmware creation. It consists in creating
a linux image with everything installed to power the RuggedPOD administration. It mainly
includes

 * The RuggedPOD API
 * The RuggedPOD Web Console
 * Network services for PXE management

This firmware is currently based on Debian Jessie.

All the scripts and configuration files are defined in the
[ruggedpod module](https://github.com/RuggedPOD/ruggedpod-firmware/modules/ruggedpod).


## Quickstart

The build system is handled by the tool
[rpi-debian-builder](https://github.com/ggiamarchi/rpi-debian-builder).

The easiest way to run it is to use [Vagrant](https://www.vagrantup.com/) to create a
fresh VM, install requirements and then run the image build.

from the project directory

```bash
$ vagrant up
$ vagrant ssh
```

Now you are inside the VM as root in the project directory, ready to run the image build.

```bash
$ rpi-debian-builder --config config.json --modules-path modules --modules basic,ruggedpod
```

When you're done, you can destroy the the VM.

```bash
$ vagrant destroy
```


## License

See the LICENSE file for license rights and limitations (GPL v3).
