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

cd /Users/justin/Documents/Projects/iCal
tar -cf iCalFix.tar iCalFix
gzip iCalFix.tar
exit 0