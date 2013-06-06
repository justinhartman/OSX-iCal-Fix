#!/bin/sh
#    Apple iCal / Microsoft Exchange server Timezone Fix
#    Copyright (C) 2008 Justin Hartman <http://justinhartman.com/>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#	 Version: 1.3
#	 Version Release Date: 6 June 2013

mkdir ~/Downloads/src
cd ~/Downloads/src
curl -O https://github.com/justinhartman/OSX-iCal-Fix/blob/master/iCalFix-latest.tar.gz
tar -zxf iCalFix-latest.tar.gz
mkdir /Applications/iCalFix
mv iCalFix /Applications/iCalFix
chmod -R 0777 /Applications/iCalFix
rm -R ~/Downloads/src
echo "Installation complete. Don't forget to add a Mail Rule to Apple Mail"
exit 0