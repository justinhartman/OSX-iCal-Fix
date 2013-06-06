# Apple iCal / Microsoft Exchange server Timezone Fix

This is a fix I created about 3 years ago that fixes timezone issues between 
iCal events sent by Exchange Server to Apple iCal. There is a problem with 
certain versions of Exchange where it offsets the meeting time due to 
compatibility issues with timezone support. This fixes this issue. 

## Contents

1. About this fix
2. Minimum Requirements
3. Installation
4. Upgrading
5. Setting up the Mail Rule
6. Customise timezone support for your country
7. Caveats
8. Release Notes

## About this fix

The install script downloads all the necessary files from Github.com
and installs both an AppleScript and Shell script to a folder called 
iCalFix in your Applications folder.

The AppleScript is then assigned to a Mail Rule and runs whenever an 
iCal invitation is received. The AppleScript downloads the iCal file 
to a temporary location and the Shell script then runs on the temp 
file and replaces any incorrect timezone information.

Once completed the new iCal event is then imported to iCal with all 
the new timezone data in place. The beauty of this fix is that you 
don’t need to edit any of the package files for iCal and even your 
original iCal invitations are left untouched. This means that you can 
upgrade iCal at a later stage and you should be safe from any data 
corruption.

## Minimum Requirements

* Mac OS X Leopard
* Apple iCal version 3.0.2 / 3.0.4
* Apple Mail version 3.2 / 3.4

This fix has been tested on Mac OS X Leopard 10.5.1, 10.5.2, 10.5.3, 10.5.4
as well as later versions 10.6, 10.7. It may/or may not work on previous version.

## Installation

1. Download the Install Script <http://timesurl.at/c1dce9> to your computer and extract the contents from the ZIP file. The folder contains a readme file as well as a Shell script which sets everything up for you.

2. Right-click on the "install.sh" file, select "Open With" and then click on "Other".

3. Click on "Applications –> Utilities –> Terminal". If you can’t select Terminal from the Open dialog then select "All Applications" from drop-down list below.

4. Terminal will open up and the install script will run. When you see the message "Installation Complete." you can close Terminal.

5. You can now check if the bug fix was installed correctly by navigating to "/Applications/iCalFix/" in Finder. If you see two files installed in that folder then installation was successful.

## Upgrading

1. Delete the folder "/Applications/iCalFix/" in Finder.

2. Download the Install Script <http://timesurl.at/c1dce9> to your computer and extract the contents from the ZIP file. The folder contains a readme file as well as a Shell script which sets everything up for you.

3. Right-click on the "install.sh" file, select "Open With" and then click on "Other".

4. Click on "Applications –> Utilities –> Terminal". If you can’t select Terminal from the Open dialog then select "All Applications" from drop-down list below.

5. Terminal will open up and the install script will run. When you see the message "Installation Complete." you can close Terminal.

6. You can now check if the bug fix was installed correctly by navigating to "/Applications/iCalFix/" in Finder. If you see two files installed in that folder then installation was successful.

7. There is no need to setup a new mail rule. You can keep your existing mail rule that you created in a previous version.

## Setting up the Mail Rule

The last step before you can begin using this fix is to setup an 
email rule that calls the AppleScript file. Click on Mail –> 
Preferences –> Rules and create a new rule that looks identical to 
the one below.

* Beneath "If any of the following conditions are met:" select "Account" and then chose your email account to apply the rule to.

* Click the plus sign next to the Account rule to add another row.

* Select "Any Attachment Name" from the first drop down box and "Ends with" from the second drop down box. Finally, type in ".ics" in the text field box

* Beneath "Perform the following actions:" select "Run AppleScript" from the drop down menu.

* Add this to the text field box next to that: /Applications/iCalFix/ical_fix.scpt

* Click "Ok" and then click "Don't Apply" when you close the Preferences box.

## Customise timezone support for your country

If you live in the GMT+2 timezone then you probably won't need to 
follow this step as I've included two different sets of timezone data 
in the script already. However, anyone living outside of the GMT+2 
timezone will need to do some manual editing to get this script 
working for your timezone.

To find out what the incorrect timezone data is I recommend opening 
up any Exchange "ics" file that was sent from your Exchange server 
with a text editor. In this file you will see a line that looks 
similar to this:

        "DTSTART;TZID="(GMT+02.00) Harare/Pretoria":20080329T090000"

Then, send yourself an iCal invitation from Apple iCal, open the 
attached ics file with a text editor and you should see a line that 
looks similar to this:

        "DTSTART;TZID=Africa/Johannesburg:20080329T113000"

From both sets of data you can see that Exchange is using the 
"(GMT+02.00) Harare/Pretoria" timezone information while Apple iCal 
is using "Africa/Johannesburg". With this information you can now 
setup your own correct timezone information.

Open up the "fix_timezone.sh" file located in the 
"/Applications/iCalFix/" folder with a text editor. This file 
contains various regular expressions that search for incorrect 
timezone data and replaces it with the correct data. An example of 
this expression is shown below:

        perl -pi -e 's/\(GMT\+02\.00\)\ Harare\/Pretoria/Africa\/
        Johannesburg/g' $ICSFILE

This part of the query searches for the incorrect timezone 
information in an iCal file:

        "s/\(GMT\+02\.00\)\ Harare\/Pretoria"

While this one replaces the above match (if found) with the
correct timezone data:

        "/Africa\/Johannesburg/g"

You can now edit the regular expression in the fix_timezone.sh file 
with your correct timezone information.

## Caveats

* Before installing or running this fix make sure you backup your iCal first. In iCal click "File –> Back up iCal" and save a backed up version to your computer.

* Use this fix at your own risk. I can’t take any responsibility for any data loss or corruption that may occur as a result of using this fix.

* This fix has **not** been tested by me on either Mac OS X 10.6, 10.7 or 10.8 so I have no idea if it works anymore or not. It would be great if someone could let me know if it worked on one of these versions or not by sending me a mail to justin [@] hartman .me

## Release Notes

#### Version 1.3

- Source = migrated the source code of the original project hosted on my site into Github. 
- Fixed = paths to my server have been changed to paths to Github now.
- Removed = there was a Firefox plugin I created many years ago that ended up in the original commit. This has been removed.

#### Version 1.2

- Fixed = iCal bug message saying "no data was added to iCal" thanks to Jon Milan.
- Added = London timezone support thanks to Ryan Hunt.
- Added = West Coast USA timezone support thanks to Ryan Hunt.
- Added = Tallinn timezone support thanks to Ryan Hunt.
- Added = Asia/Muscat timezone support thanks to Steve.
- Tests = Now confirmed to work on Leopard 10.5.1, 10.5.2, 10.5.3 and 10.5.4
- Tests = Now confirmed to work on all Apple computers.

#### Version 1.1

- First release with South African timezone support.

## Todo

- As of version 1.3 this code has simply been migrated from my server to Github. The current structure doesn't work anymore for installation and I need to fix this so that people can just run this fix from a cloned version of the repository.

## License

Copyright (C) 2008 Justin Hartman <http://twitter.com/justinhartman>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Credits

This project is created and maintained by [Justin Hartman](http://twitter.com/justinhartman).
