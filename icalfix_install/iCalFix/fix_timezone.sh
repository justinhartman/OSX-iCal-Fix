#!/bin/sh
#    Apple iCal / Microsoft Exchange server Timezone Fix
#    Copyright (C) 2008-2017 Justin Hartman <http:/justin.hartman.me/>
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
#	 Version: 1.2.0
#	 Version Release Date: 28 August 2008
#
#	 Version: 1.5.0
#	 Version Release Date: 19 June 2017

ICSFILE=$1
#South Africa - Justin Hartman
perl -pi -e 's/\(GMT\+02\.00\)\ Harare\/Pretoria/Africa\/Johannesburg/g' $ICSFILE
perl -pi -e 's/GMT\ \+0200\ \(Standard\)\ \/\ GMT\ \+0200\ \(Daylight\)/Africa\/Johannesburg/g' $ICSFILE
#London - Ryan Hunt
perl -pi -e 's/\"Greenwich\ Mean\ Time\ \:\ Dublin\,\ Edinburgh\,\ Lisbon\,\s/Europe\//g' $ICSFILE
perl -pi -e 's/\s\sLondon\"/London/g' $ICSFILE
perl -pi -e 's/Greenwich\sMean\sTime\s\:\sDublin\,\sEdinburgh\,\sLisbon\,\sLondon/Europe\/London/g' $ICSFILE
#West Coast USA - Ryan Hunt
perl -pi -e 's/\(GMT\-08\.00\)\ Pacific\ Time\ \(US\ \&\ Canada\)\/Tijuana/US\/Pacific/g' $ICSFILE
#Tallinn - Ryan Hunt
perl -pi -e 's/Helsinki\\\,\ Kyiv\\\,\ Riga\\\,\ Sofia\\\,\ Tallinn\\\,\ Vilnius/Europe\/Helsinki/g' $ICSFILE
perl -pi -e 's/Helsinki\,\ Kyiv\,\ Riga\,\ Sofia\,\ Tallinn\,\ Vilnius/Europe\/Helsinki/g' $ICSFILE
#Asia/Muscat - Steve
perl -pi -e 's/GMT\ \+0400\ \(Standard\)\ \/\ GMT\ \+0400\ \(Daylight\)/Asia\/Muscat/g' $ICSFILE
# ADDING YOUR OWN REGULAR EXPRESSION
# PLEASE FOLLOW THE STEPS CONTAINED IN THE README FILE
# UNDER `Customise timezone support for your region`
# DO NOT MAKE ANY MODIFICATIONS WITHOUT READING WHAT TO DO FIRST.
#INCORRECT='';
#CORRECT='';
#perl -pi -e 's/$INCORRECT/$CORRECT/g' $ICSFILE
exit 0
