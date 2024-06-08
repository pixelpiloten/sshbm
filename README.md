# What is it?
A visual SSH bookmark chooser for your terminal that takes andvantage of your SSH-config file.

You run the script and you will be able to see a list of all servers you have in your SSH-config file, choose one, click ok and you will be SSH'd into that server.

![SSHBM screenshot](sshbm-screenshot.png "SSHBM screenshot")

# Requirements
* Linux based OS
* Terminal
* The package `dialog`, should be available in most Linuxs distros.

# Installation
1. Download the `sshbm.sh` file and put in any of your `$PATH` directories.
2. Make the `sshbm.sh` file executable by going to the directory you put it in and run `chmod +x sshbm.sh`.

For example I have added the directory `~/Bashscripts` to my `$PATH` variable.

# How to use.
Run the script and you should get a list of bookmarks, choose one and you will be SSH'd into that server.

```
sshbm.sh
```