puppet-searchsploit
===================
[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is
   useful](#module-description)
3. [Setup - The basics of getting started with discover](#setup)
    * [Setup requirements](#setup-requirements)
    * [Installing searchsploit](#installing-searchsploit)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Used to install the [searchsploit](https://github.com/offensive-security/exploit-database) tool on Kali Linux.

## Module Description

This module will install the searchsploit tool, which allows you query all of the exploits found on [exploit-db](https://www.exploit-db.com/) via CLI.

## Setup

### Setup Requirements

The following puppet modules are required for this module to work
properly. Please add them to your Puppetfile like so:

```
mod 'puppetlabs/vcsrepo'
```

### Installing searchsploit

Simply specify the directory you wish the searchsploit tool to be installed in as
a parameter and run the module as you would any other.

## Usage
Install the searchsploit tool in /opt/searchsploit:
```
class { 'searchsploit':
  install_location => '/opt/searchsploit',
  symlink_location => '/usr/bin/searchsploit',
  auto_update      =>  true
}
```

## Limitations

This has been tested on Kali only.

## Development

Feel free to fork this up and issue a pull request if you want to
improve on the work that has already been done.

## Release Notes/Contributors/Etc

Jayson Grace (l50) <jayson.e.grace@gmail.com>
