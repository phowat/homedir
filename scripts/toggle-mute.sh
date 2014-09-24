#! /bin/bash

amixer get Master | grep -o '\[o.*\]'
