#!/bin/bash

rm ./Packages
dpkg-scanpackages -m ./debs /dev/null > Packages
rm ./Packages.bz2
bzip2 -fks Packages
