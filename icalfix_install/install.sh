#!/bin/sh
#    Apple iCal / Microsoft Exchange server Timezone Fix
#    Copyright (C) 2008 Justin Hartman <http://twitter.com/justinhartman>
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
#	 Version: 1.4
#	 Version Release Date: 7 June 2013

echo "Creating the iCalFix directory in Applications folder..."
mkdir /Applications/iCalFix
echo "Copying the folder contents to the Applications folder..."
cp -R iCalFix/* /Applications/iCalFix
echo "Applying some permissions..."
chmod -R 0755 /Applications/iCalFix
echo "Installation complete. Don't forget to add a Mail Rule to Apple Mail"
exit 0