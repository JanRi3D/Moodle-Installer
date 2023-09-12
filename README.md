# Moodle Easy Installer

![Moodle Logo](https://download.moodle.org/theme/moodleorg/pix/moodle_logo_TM.svg)

Welcome to the Moodle Easy Installer! This script simplifies the process of installing Moodle on your server.

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/B0B7P5P98)

## Prerequisites

Before using this script, make sure you have the following prerequisites:

- PHP 8.0 repository is enabled on your server.

## Installation

To install Moodle with ease, follow these simple steps:

1. Clone this script to your server:

   ```shell
   wget -O Install.sh https://raw.githubusercontent.com/JanRi3D/Moodle/main/Install.sh

2. Let in run!

   ```shell
   bash Install.sh

##Using a Proxy (Optional)
If you want to use a proxy like Nginx Proxy Manager with Moodle, you'll need to make some additional configurations. Open the Moodle configuration file located at /var/www/Moodle/config.php and add the following line to enable reverse proxy support:
   ```php
   $CFG->reverseproxy = true;

##Standard Username and Database Name
The standard username and database name used for Moodle during installation is Moodle.
