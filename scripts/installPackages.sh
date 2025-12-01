#!/bin/bash

figlet -f slant "== INSTALLING PACKAGES =="

sleep 0.5

yay -S --needed $(< packages.list)
