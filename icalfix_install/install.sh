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
#	 Version: 1.4.0
#	 Version Release Date: 7 June 2013
#
#	 Version: 1.5.0
#	 Version Release Date: 7 June 2013

echo ""
echo "Apple iCal / Microsoft Exchange server Timezone Fix"
echo "Copyright (C) 2008-2017 Justin Hartman <http:/justin.hartman.me/>"
echo ""
echo "This program comes with ABSOLUTELY NO WARRANTY."
echo "This is free software, and you are welcome to redistribute it"
echo "under certain conditions."
echo "============================================================="
echo ""
echo "Creating the iCalFix directory in Applications folder..."
echo ""
mkdir /Applications/iCalFix
echo "Copying the folder contents to the Applications folder..."
echo ""
cp -R iCalFix/* /Applications/iCalFix
echo "Applying some permissions..."
echo ""
chmod -R 0755 /Applications/iCalFix
echo "Installation complete. Don't forget to add a Mail Rule to Apple Mail"
exit 0
