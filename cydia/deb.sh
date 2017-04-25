#!/bin/bash
dpkg-deb -bZgzip projects/searchbar debs
dpkg-deb -bZgzip projects/Annoyance debs
dpkg-deb -bZgzip projects/NotifyMe debs
# dpkg-deb -bZgzip projects/<package name> <output folder>
