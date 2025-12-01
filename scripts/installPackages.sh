#!/bin/bash

figlet -f slant "== INSTALLING PACKAGES =="

yay -S $(< packages.list)
