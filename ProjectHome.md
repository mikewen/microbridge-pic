

# This project is maintaining in progress to solve some issues.So that the source code is not available now. #
# Sorry for inconvenience. #



# About this project #

This is Android Debug Bridge(ADB) imprementation for Microchip's PIC microcontrollers.
This module is originally created by Niels Brouwers for Arduino with USB Host Shield.
http://code.google.com/p/microbridge/

Currently,I'm porting it to PIC Microcontrollers underway,and there are still rest of things to do.

These codes in this project are checked with PIC24FJ64GB002.

# Demo movies #

DEMO : Control RC Servo arm by Android 1.6 non-rooted device.

<a href='http://www.youtube.com/watch?feature=player_embedded&v=tQRM6J2oSP0' target='_blank'><img src='http://img.youtube.com/vi/tQRM6J2oSP0/0.jpg' width='425' height=344 /></a>

DEMO : Control Android non-rooted device by ATARI-based joystick button.

<a href='http://www.youtube.com/watch?feature=player_embedded&v=IRSqAGVbQYA' target='_blank'><img src='http://img.youtube.com/vi/IRSqAGVbQYA/0.jpg' width='425' height=344 /></a>

# Hardware #
Currently,this software is only tested with Microchip's PIC24FJ64GB002.
I used a PCB named PIC ADK Miniboard rev.1 from  Japan Android Group Kobe branch.
For detailed information about this PCB,please contact to Japan Android Group Kobe branch by join to its group in Google Groups below,or contact directly to ishii.yasuhiro@gmail.com

Google group - Japan Android Group Kobe branch
http://groups.google.com/group/android-jp-kobe?hl=ja&pli=1

<img src='http://projectc3.up.seesaa.net/image/R1205964-thumbnail2.JPG' />


# Compatibility #
`MicroBridge`/PIC has been confirmed with au IS01 by Sharp(Android 1.6) and Nexus S by Samsung(Android 2.3.4) and Huawei IDEOS,HTC HT-03A(Japan localized model that is based on HTC Magic).

# Current version's Limitation #
Now Microbridge/PIC cannot establish plural number of ADB connections at the same time.I'll fix it in next version.