# Fallback Playlist

Attempt to create an Airtime fallback playlist, to easily managing a radio stream, with station ID and OTH (On Top Hour) jingles.

This is a test, NOT meant for production use.

## Prerequisites

A working [Airtime](http://www.sourcefabric.org/en/airtime/) installation.

You can use this [Airtime appliance](https://github.com/Freq-Out/airtime-appliance) to set a virtual installation of Airtime.

See the [Read Me](https://github.com/Freq-Out/airtime-appliance/blob/master/README.md) file for complete Airtime appliance deployment procedure.

## jukebox.liq

This script is created in "/usr/lib/airtime/pypo/bin/liquidsoap_scripts/library", now even Airtime updates are easier to mantain.
Don' t forget to include this script in "/usr/lib/airtime/pypo/bin/liquidsoap_scripts/library/pervasives.liq".

## ls_script.liq

This is a snippet of "/usr/lib/airtime/pypo/bin/liquidsoap_scripts/ls_script.liq", where you can find how to include the jukebox.liq script.

