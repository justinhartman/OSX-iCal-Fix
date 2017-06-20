[![GitHub issues](https://img.shields.io/github/issues/justinhartman/OSX-iCal-Fix.svg)](https://github.com/justinhartman/OSX-iCal-Fix/issues)
[![GitHub forks](https://img.shields.io/github/forks/justinhartman/OSX-iCal-Fix.svg)](https://github.com/justinhartman/OSX-iCal-Fix/network)
[![GitHub stars](https://img.shields.io/github/stars/justinhartman/OSX-iCal-Fix.svg)](https://github.com/justinhartman/OSX-iCal-Fix/stargazers)
[![Travis](https://img.shields.io/travis/justinhartman/OSX-iCal-Fix.svg)](https://github.com/justinhartman/OSX-iCal-Fix/)
[![Code Climate](https://codeclimate.com/github/justinhartman/OSX-iCal-Fix/badges/gpa.svg)](https://codeclimate.com/github/justinhartman/OSX-iCal-Fix)
[![Test Coverage](https://codeclimate.com/github/justinhartman/OSX-iCal-Fix/badges/coverage.svg)](https://codeclimate.com/github/justinhartman/OSX-iCal-Fix/coverage)
[![Issue Count](https://codeclimate.com/github/justinhartman/OSX-iCal-Fix/badges/issue_count.svg)](https://codeclimate.com/github/justinhartman/OSX-iCal-Fix)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0)
[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-nc-sa/4.0/)

# Apple iCal / Microsoft Exchange server Timezone Fix
This is a fix I created about 3 years ago that fixes timezone issues between iCal events sent by Exchange Server to Apple iCal. There is a problem with certain versions of Exchange where it offsets the meeting time due to compatibility issues with timezone support. This fixes this issue. 

## Contents
<!-- MarkdownTOC -->

- [About this fix](#about-this-fix)
- [Minimum Requirements](#minimum-requirements)
- [Installation](#installation)
- [Upgrading](#upgrading)
- [Setting up the Mail Rule](#setting-up-the-mail-rule)
- [Customise timezone support for your region](#customise-timezone-support-for-your-region)
    - [1. Finding the incorrect timezone from Microsoft Exchange](#1-finding-the-incorrect-timezone-from-microsoft-exchange)
    - [2. Finding the the correct timezone from Apple iCal](#2-finding-the-the-correct-timezone-from-apple-ical)
    - [3. Open up the script](#3-open-up-the-script)
    - [4. Editing the timezone script](#4-editing-the-timezone-script)
        - [Working with the template in the script](#working-with-the-template-in-the-script)
        - [Modifying the Exchange and iCal data](#modifying-the-exchange-and-ical-data)
        - [Adding the data to the script](#adding-the-data-to-the-script)
        - [5. Request help \(optional\)](#5-request-help-optional)
- [Disclaimer](#disclaimer)
- [Release Notes](#release-notes)
- [License](#license)
- [Credits](#credits)

<!-- /MarkdownTOC -->

## About this fix
The install script downloads all the necessary files from Github.com and installs both an AppleScript and Shell script to a folder called iCalFix in your Applications folder.

The AppleScript is then assigned to a Mail Rule and runs whenever an iCal invitation is received. The AppleScript downloads the iCal file to a temporary location and the Shell script then runs on the temp file and replaces any incorrect timezone information.

Once completed the new iCal event is then imported to iCal with all the new timezone data in place. The beauty of this fix is that you don't need to edit any of the package files for iCal and even your original iCal invitations are left untouched. This means that you can upgrade iCal at a later stage and you should be safe from any data corruption.

## Minimum Requirements
* Mac OS X Leopard
* Apple iCal version 3.0.2 / 3.0.4
* Apple Mail version 3.2 / 3.4

This fix has been tested on Mac OS X Leopard 10.5.1, 10.5.2, 10.5.3, 10.5.4 as well as later versions from 10.6 through to 10.7.5. It may, or may not, work on both previous and future versions of macOS.

## Installation
1. [Download the installer script][script-download] to your computer and extract the contents from the `icalfix_install.zip` file. The folder contains a version of this README file which is in HTML format as well as the shell script which sets everything up for you.

2. Open up the `icalfix_install` folder and right-click on the `install.sh` file. Select `Open With` and then click on `Other`.

3. Navigate to `Applications –> Utilities –> Terminal`. If you can't select Terminal from the Open dialog menu then select `All Applications` from the drop-down list.

4. Terminal will open up and the install script will run. When you see the message `Installation Complete.` you can close Terminal.

5. You can now check if the bug fix was installed correctly by navigating to `/Applications/iCalFix/` in Finder. If you see two files installed in that folder then installation was successful.

## Upgrading
1. Delete the `/Applications/iCalFix/` folder in Finder. **If you made changes to the `fix_timezone.sh` file when you originally installed the fix then please make a backup of this file. You will lose any changes you made when you delete this folder. If you're not sure, backup the folder anyway.**

2. [Download the installer script][script-download] to your computer and extract the contents from the `icalfix_install.zip` file. The folder contains a version of this README file which is in HTML format as well as the shell script which sets everything up for you.

3. Open up the `icalfix_install` folder and right-click on the `install.sh` file. Select `Open With` and then click on `Other`.

4. Navigate to `Applications –> Utilities –> Terminal`. If you can't select Terminal from the Open dialog menu then select `All Applications` from the drop-down list.

5. Terminal will open up and the install script will run. When you see the message `Installation Complete.` you can close Terminal.

6. You can now check if the bug fix was installed correctly by navigating to `/Applications/iCalFix/` in Finder. If you see two files installed in that folder then installation was successful.

7. There is no need to setup a new mail rule. You can keep your existing mail rule that you created in a previous version.

8. If you made changes to the `fix_timezone.sh` file please follow the instructions for how to Customise timezone support for your region contained later in this document.

## Setting up the Mail Rule
If you are upgrading from a previous version or have already set up the mail rule in Mail you can ignore the this step completely.

For first time users this is the final step to complete before you can begin using this fix. The email rule is important as it calls the AppleScript file which is where all the magic happens. 

Click on `Mail –> Preferences –> Rules` and create a new rule that looks identical to the one below.

* Beneath `If any of the following conditions are met:` select `Account` and then chose your email account to apply the rule to.

* Click the plus sign next to the Account rule to add another row.

* Select `Any Attachment Name` from the first drop down box and `Ends with` from the second drop down box. Finally, type in `.ics` in the text field box

* Beneath `Perform the following actions:` select `Run AppleScript` from the drop down menu.

* Add this to the text field box next to it: `/Applications/iCalFix/ical_fix.scpt`

* Click `OK` and then `Don't Apply` when you close the Preferences pane.

## Customise timezone support for your region
The timezone fix will work without any customisation if your timezone falls in any of the following regions:

 1. South Africa
 2. London
 3. West Coast, USA
 4. Tallinn
 5. Asia/Muscat

Any timezone outside of the five above means that you will have no choice but to do some manual editing to get this script working for your timezone. There are four steps to follow which I hope are well documented and easy enough for you to implement this yourself. 

### 1. Finding the incorrect timezone from Microsoft Exchange
To find out what the incorrect timezone data is you need to open up a Microsoft Exchange `ics` file that was sent from your Exchange server with a text editor. 

In this file you will see a line that looks similar to this:
```
"DTSTART;TZID="(GMT+02.00) Harare/Pretoria":20080329T090000"
```
### 2. Finding the the correct timezone from Apple iCal
Opem up Apple iCal, create a dummy calendar event and then send yourself an iCal invitation. Once you receive the iCal invite in Mail, open up the attached `ics` file with a text editor and you should see a line that looks similar to this:
```
"DTSTART;TZID=Africa/Johannesburg:20080329T113000"
```
From both of the steps above you can see that Exchange is using the 
`(GMT+02.00) Harare/Pretoria` timezone information while Apple iCal 
is using `Africa/Johannesburg`. With this data you have the two bits of required information to setup your own timezone in the script.

### 3. Open up the script
Open up the `fix_timezone.sh` file located in the `/Applications/iCalFix/` folder with a text editor. This file contains various regular expressions that search for incorrect timezone data and replaces it with the correct data.

You will need to use the two sets of data you've just gotten to create your own regular expression in step 4 below. However, before you do this it is important to understand how the expression works so that modifying your own makes sense to you as well as to avoid confusion or making errors when editing the file. 

An example of an expression, which you will find in the file, is shown below:
```perl
perl -pi -e 's/\(GMT\+02\.00\)\ Harare\/Pretoria/Africa\/Johannesburg/g' $ICSFILE
```
The segment highlighted below (from the above expression) searches for the incorrect timezone information in an Exchange `ics` file:
```perl
's/\(GMT\+02\.00\)\ Harare\/Pretoria'
```
While the highlighted segment below will replace the above match, if found:
```perl
'/Africa\/Johannesburg/g'
```
### 4. Editing the timezone script
Right, now you are ready to move on and modify the script to work for your environment. Remember the two sets of data you found in steps 1 and 2 above? Good, you are going to need this now to finish things off.

To refresh your memory, the incorrect Microsoft Exchange timezone was `(GMT+02.00) Harare/Pretoria` while the correct Apple iCal timezone was `Africa/Johannesburg`.

#### Working with the template in the script
Scroll to the bottom of the script where you see the following template that has been added to make the process easier for you:
```perl
# ADDING YOUR OWN REGULAR EXPRESSION
# PLEASE FOLLOW THE STEPS CONTAINED IN THE README FILE 
# UNDER `Customise timezone support for your region`
# DO NOT MAKE ANY MODIFICATIONS WITHOUT READING WHAT TO DO FIRST.
#INCORRECT='';
#CORRECT='';
#perl -pi -e 's/$INCORRECT/$CORRECT/g' $ICSFILE
exit 0
```
You need to uncomment the following lines by deleting the `#` in front of each line:
```perl
#INCORRECT='';
#CORRECT='';
#perl -pi -e 's/$INCORRECT/$CORRECT/g' $ICSFILE
```
If done correctly, you should now have the following:
```perl
# ADDING YOUR OWN REGULAR EXPRESSION
# PLEASE FOLLOW THE STEPS CONTAINED IN THE README FILE 
# UNDER `Customise timezone support for your region`
# DO NOT MAKE ANY MODIFICATIONS WITHOUT READING WHAT TO DO FIRST.
INCORRECT='';
CORRECT='';
perl -pi -e 's/$INCORRECT/$CORRECT/g' $ICSFILE
exit 0
```
`INCORRECT` is a variable where you will set the incorrect timezone data from Microsoft Exchange while `CORRECT` is the correct timezone data from Apple iCal.

#### Modifying the Exchange and iCal data
Now for the tricky bit. You cannot just copy and paste the timezone data because certain characters and spaces need to be escaped with backslashes. Depending on what data you have for your region this may be a simple or complex procedure.

The good news is that for our example data you will be able to see how to work with both a simple and a complex one. Let's start with the difficult one.

The unmodified Microsoft Exchange server example looks like this:  
`(GMT+02.00) Harare/Pretoria`

The following characters all need a backslash before it:  
`(`  
`+`  
`.`  
`)`  
`/`  
Once the backlashes have been added you will end up with this:  
`\(GMT\+02\.00\) Harare\/Pretoria`

**NB:** You also need to add a backslash to any spaces contained in the text. In the modified example above there is a space just after the `)` and before `Harare`. So this, `) Harare`, needs to become this `)\ Harare`. Notice that the backslash is in front of the space, this is very important and is probably the _gotcha_ you will need to look out for.

Now that there are backslashes in all the right places you will end up with this final string which is perfectly modified for the script:  
`\(GMT\+02\.00\)\ Harare\/Pretoria`

Whew, that was hard going. That said, our unmodified iCal example is very simple to change as we have no odd characters nor any spaces to deal with.

The unmodified example looks like this:  
`Africa/Johannesburg`

All that is needed to get the right modified version is to add a backslash before the forward-slash as shown below:  
`Africa\/Johannesburg`

#### Adding the data to the script
```perl
# ADDING YOUR OWN REGULAR EXPRESSION
# PLEASE FOLLOW THE STEPS CONTAINED IN THE README FILE 
# UNDER `Customise timezone support for your region`
# DO NOT MAKE ANY MODIFICATIONS WITHOUT READING WHAT TO DO FIRST.
INCORRECT='\(GMT\+02\.00\)\ Harare\/Pretoria';
CORRECT='Africa\/Johannesburg';
perl -pi -e 's/$INCORRECT/$CORRECT/g' $ICSFILE
exit 0
```
You can now save your file and you should be good to go.

#### 5. Request help (optional)
I know that modifying the script may be daunting for some and even if it isn't there are times when you may run into issues or errors when making changes so the scripts.

If you need any support or don't know how to make these changes please feel free to [open up an issue on Github][issue-reporting] and I will do my best to help you.

## Disclaimer
* Before installing or running this fix make sure you backup your iCal first. In iCal click "File –> Back up iCal" and save a backed up version to your computer.

* Use this fix at your own risk. I can't take any responsibility for any data loss or corruption that may occur as a result of using this fix.

* This fix has **not** been tested by me on either Mac OS X 10.6, 10.7 or 10.8 so I have no idea if it works any more or not. It would be great if someone could let me know if it worked on one of these versions or not by sending me a mail to justin@hartman.me

## Release Notes
The release notes can be found in the [CHANGELOG](CHANGELOG.md) file. 

## License
[GNU GPLv3](LICENSE.md).

## Credits
See [CREDITS](CREDITS.md)

[script-download]: https://github.com/justinhartman/OSX-iCal-Fix/raw/v1.5.0/icalfix_install.zip
[issue-reporting]: https://github.com/justinhartman/OSX-iCal-Fix/issues/new


