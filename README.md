# 7dtd-server-patches
Patches to 7DTD-Server from https://7dtd.illy.bz

# Included Patches

## F01: Dedicated Engine for instances

By default all instances share the common 7DTD-Engine installed in `/home/sdtd/engine`.
While this has a nice small footprint with many instances, it also forces you to run the same 7DTD version on all ow them.
This feature allows you to have a distinct **engine directory** for particular instances in `/home/sdtd/engine.{instancename}`.
Can be utilized with hook-scripts and overlay-technique to provide distinct Mods for particular instances.

## F02: New command "tail"

Follow the output log with `7dtd.sh tail <instancename>`.

## F03: New command "archive"

The build-in "backup" command creates a snapshot of the current running server state, but rotates those backups with each newly created, according to the configured "min_backups_keep".
That rotation is very convinient and effectively protects you from cluttering your harddisk with endless backups, but it also may sort out a valuable backup you've created previously.
The new "archive" commands basically creates a permanent backup for you in `/home/sdtd/archive` which is not subject of rotation.

## F04: Reverse-Proxy fix for

Allocs WebAndMapRendering Mod has a problem when accessed via a reverse-proxy that performs URL rewriting.
Some images are referenced with an absolute URL in the provided javascript files, which at least Apache Webserver can not transpose properly during rewrite.
This fix modifies the absolute URLs to relative ones.

## F05: Trader-Marker

This adds markers for traders on Allocs WebAndMapRendering Mod

# Installation

Prerequisites:
- A deployed 7dtd-server as described on https://7dtd.illy.bz

Clone this repository to your server:
```
git clone https://github.com/1stone/7dtd-server-patches
```

Apply patches
```
cd 7dtd-server-patches
./install.sh
```

# Notes

- For each patched file, the original is saved in *.orig
- You will need to reapply the patches after you have updated the server with `7dtd updatescripts` or `7dtd updatefixes`
- It should be safe to run `install.sh` repeatedly. Any patch already applied should only show a warning.
