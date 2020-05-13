@echo off
ECHO.************ Removing Drive Leter from the System Partition *************
(
    echo select volume 1
    echo remove letter=S
    echo list volume
    echo exit
) | DISKPART

ECHO.************ Moving CD-ROM Drive Leter to B: *************
(
    echo select volume 0
    echo assign letter=B
    echo list volume
    echo exit
) | DISKPART
