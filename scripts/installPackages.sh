#!/bin/bash

figlet -f slant "== INSTALLING PACKAGES =="

sudo pacman -S $(< packages.list)
