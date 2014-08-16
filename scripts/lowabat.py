#!/usr/bin/env python
# -*- coding: utf-8 -*-
from os import system, devnull
from subprocess import Popen, PIPE

if __name__ == '__main__': 
    with open(devnull, "w") as fnull:
        acpi = Popen(['acpi', '-V'], stdout=PIPE, stderr=fnull)
        status = Popen(['head', '-n1'],stdin=acpi.stdout, 
                       stdout=PIPE, stderr = fnull).communicate()[0].strip()

    (_, _, plug, percentage, _) = status.split(' ', 4)
    if plug != "Charging,":
        bat_level = int(percentage[0:-2])
        if bat_level < 21:
            system("notify-send 'Low battery!' 'Your battery level is " + \
                   "currently "+str(bat_level)+"%.' --icon=dialog-warning")
