#puppet

####Table of Contents
1. [Overview - What is the puppet module?](#overview)
2. [Module Description - What does the module do?](#module-description)
3. [Setup - The basics of getting started with puppet](#setup)
4. [Limitations - OS compatibility, etc.](#limitations)

##Overview

The puppet module allows you to set up the puppet agent and server configurations.

##Module Description

The module can update the puppet packages and change parameters.

##Setup

**What puppet affects:**

* `/etc/puppet/puppet.conf`

###Beginning with puppet

####Puppet agent

The `puppet::agent` module manages the `[main]` and `[agent]` sections of the puppet configuration. 

to deactivate the noop run on a machine:

```YAML
puppet::config::if_noop: 'false'
```

####Puppet server

The `puppet::server` module manages the `[server]` section of the puppet configuration.

##Limitations

This module has been validated on:

* Debian:
    * 6.0.10 x86_64
    * 7.8 x86_64
* CentOS: 
    * 7.0 x86_64
