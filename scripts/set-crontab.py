#! /usr/bin/env python
# -*- coding: utf-8 -* 

from os import getenv, system, unlink
from jinja2 import Template

CRONTAB_TEMPLATE = """
* * * * * export DBUS_SESSION_BUS_ADDRESS=unix:abstract=/tmp/dbus-{{ address }}; . /home/pedro/venv/bin/activate ; /home/pedro/Code/uowm/uowm.bak.py
* * * * * sleep 30; export DBUS_SESSION_BUS_ADDRESS=unix:abstract=/tmp/dbus-{{ address }}; . /home/pedro/venv/bin/activate ; /home/pedro/Code/uowm/uowm.bak.py
"""
FILE_NAME = "/tmp/cronpedro"

def get_session_address():
    return getenv("DBUS_SESSION_BUS_ADDRESS").split('-')[-1]

def crontab_to_file(session_address, f):
    tmplt = Template(CRONTAB_TEMPLATE)
    content = tmplt.render(address=session_address)
    f.write(content+'\n')

if __name__ == '__main__':
    tempf = open(FILE_NAME, 'w')
    crontab_to_file(get_session_address(), tempf)
    tempf.close()
    system("/usr/bin/crontab "+FILE_NAME)
    unlink(FILE_NAME)
