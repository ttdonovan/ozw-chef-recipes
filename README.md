# OZW Chef Recipes

[Chef](http://wiki.opscode.com/display/chef/Home) Cookbook and Recipes for
OpenZWave development with Ruby.

**Why does this project exist?**

OpenZwave development on Mac OS X sucks if you're not C++ programmer. There are
a lot of great projects on GitHub that try to expand on the supported list of
development langagues for OpenZWave. However these projects were intended to be
ran on an environment with [Debian](http://www.debian.org/) OS and modifing the
`Makefile` for Mac OS X was a painful process. The goal of this project is to
try and unify the installation, configuration and setup of an environment in a
reproducible and portable way.

## Development Environment

Outlined below is a list of required software and quick start guide for
Vagrant and VirtualBox.

### Required Software

#### Vagrant

[Vagrant](http://www.vagrantup.com/), create and configure lightweight,
reproducible, and portable development environments.
[Vagrant](http://downloads.vagrantup.com/) can be installed by downloading the
installer for your operating system.

#### VirtualBox

[VirtualBox](https://www.virtualbox.org/), a free, cross-platform consumer
virtualization product. [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
can be installed by downloading a package or installer for your operating
system and using standard procedures to install that package.

### Quick Start Guide for Vagrant

#### Boot and SSH into the Virtual Machine

    # boot the machine
    $ vagrant up

    # ssh into the machine
    $ vagrant ssh

#### Stopping and Starting the Virtual Machine

    # stop the machine
    $ vagrant halt

    # resume the machine
    $ vagrant up

#### Removing the Virtual Machine (A Rinse and Repeat Process)

    # remove all traces of the machine
    $ vagrant destroy
