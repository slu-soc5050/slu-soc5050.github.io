---
layout: page
title: User's Guide
tagline: Structuring the Master Do-file
tags: [Stata]
description:
---

The first of the do-files in the stack [introduced earlier in the User's Guide](structuring-do-files.html) is the `master.do` file. This file performs a number of functions for producing reproducible research.

----

### Opening Options
The first is to ensure that there are no holdovers from previous analyses in your Stata session. Most of these options are recommended by Long (2009).

```stata
// ==========================================================================

// standard opening options

version 14
log close _all
graph drop _all
clear all
set more off
set linesize 80

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
```

The `version` command signals to Stata that this code was written for version 14 of the software. When running it under a future release (such as version 15 or 16), Stata will function as if it were running an older version. The `log close _all` command closes any currently opening logs, ensuring that your do-file stack does not unintentionally edit any files. Similarly, the `graph drop _all` closes the graph window and the `clear all` command clears any other results or data stored in Stata's memory. The final two commands turn off the "more behavior" that limits the amount of output displayed by Stata (`set more off`) and contrains the output width to 80 spaces (`set linesize 80`).

----

### Changing the Working Directory
One of the most important concepts to understand regarding how these do-files work is the idea of the [working directory](https://en.wikipedia.org/wiki/Working_directory). The working directory is a location that Stata is pointed to where (a) it will assume all files that it is directed to open are located and (b) it will assume that all files generated should be saved. The templates are seeded to you with a flexible structure designed to allow you to execute files on both the Mac OS X and Windows operating systems.

```stata
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// change directory

if "`c(os)'" == "MacOSX" {
  cd "/Users/`c(username)'/Documents/Working"
}
else if "`c(os)'" == "Windows" {
  cd "E:/Users/`c(username)'/Documents/Working"
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
```

One important thing to note is the presence of `c(username)` in both the the OS X and Windows file paths. This will *automatically* enter your computer username into the change directory (`cd`) command's file path. This is useful to leave if you work on *multiple* computers running the same operating system but using different logins.

I highly recommend editing the template to suit your needs - you may not need code for both operating systems, and ideally you should change the path to match the location of the working directory located in your [course directory structure](protecting-your-work.html). To do that, you will need to know just a little about how your operating system works.

#### Working Directories in OS X
The OS X file system always begins with the the `Users` directory *unless* you are working off an external device. Directories are separated by forward slashes (`/`). Each login on a given OS X device has an account in the `Users` directory that matches their username. Their `Desktop`, `Documents`, `Downloads`, and other key directories are all subdirectories of that username directory. An example file path that may be similar to your organizational structure, with the username `jdoe`, would look like this:

```stata
. cd "/Users/jdoe/Documents/Course Files/SOC 5050/Working"
```

If your working directory is located on an external device like a thumb drive or external hard drive, you will need to know the device's name. This can be found by looking in the Finder's lefthand menu under "Devices". The device's name supplants the `Users` directory in the above example. An example path that may be similar to your organizational structure, with the volume name of `ThumbDrive`, would look like this:

```stata
. cd "/ThumbDrive/Course Files/SOC 5050/Working"
```

#### Working Directories in Windows
The Windows file system always begins with a drive letter. Drive letters are assigned by the operating system and follow a predictable pattern. Standard installations of Windows use the `C` drive for all operating system files. At SLU, user files are not stored on with the system files on the `C` drive. Instead, they are stored on a separate disk that is assigned the drive letter `E`. Structuring the change directory command will therefore be dependent on how your operating system is installed.

Directories are separated by either black slashes (`\`) or forward slashes (`/`). Atom does not work well with back slashes in snippets, and so the templates use forward slashes.

Each login on a given Windows device has an account in the `Users` directory that matches their username. Their `Desktop`, `Documents`, `Downloads`, and other key directories are all subdirectories of that username directory. An example file path that may be similar to your organizational structure, with the username `jdoe`, would look like this:

```stata
. cd "E:/Users/jdoe/Documents/Working"
```

Remember that your drive letter will likely need to changed if you are using Stata installed on your own Windows device.

If your working directory is stored on an external device like a thumb drive or external hard drive, you will need to know the device's drive letter. This can be found using Windows Explorer. If your Windows device has a DVD drive, it will typically be assigned the letter `D` and external devices will be assigned letters beginning with `E`. If you are using a SLU computer, the `E` drive is reserved for user files and so external devices will be assigned letters beginning with `F`.

----

### Check for Source Data
After setting the working directory, the `master.do` file is structured to confirm that the source data are present. If you enter only a filename where prompted (see the line with the `global sourceData` command), you will be executing the do-file stack under the assumption that the source data are present in the working directory. You can optionally enter a full file path here (using the rules discussed above under "Changing the Working Directory") if you do not want to copy-and-paste data files into the working directory manually.

```stata
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// check to see if source data exists

global sourceData "/*enter the source data filename here*/.dta"
capture confirm file "$sourceData"

if _rc==601 {
  display in red "This do-file requires that the source dataset be saved in your working folder."
  exit
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
```

This section of code is designed to confirm that the file exists (using the `confirm file` command) and then, if an error code associated with a file not being present is returned, to halt the execution of your do-file stack after displaying an error message.

----

### Check Directory Structure
After confirming that the source data can be found, the `master.do` file is structured to create a standard set of directories: a project directory with two subdirectories named `CodeArchive` and `Plots`. You will be prompted to enter a project name (see the line with the `global projName` command). Pick a project name that is short and ideally does not contain spaces. Examples of good directory names include `Lab01` and `PS01` (for Problem Set 01).

```stata
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// check to see if appropriate directories exist

global projName "/*enter the project name here*/"
capture mkdir $projName

capture mkdir "$projName/CodeArchive"
capture mkdir "$projName/Plots"

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
```

You will note that both the `mkdir` commands here and the `confirm file` command in the previous section are preceded with `capture`. The `capture` command will suppress any errors returned by the subsequent command and allow the do-file to continue executing.

----

### Begin Logging Commands
The log-file is automatically generated by the `master.do` file and named with the same name entered above for the project itself. This log-file will capture the execution of all subsequent source code in the project. This command utilizes the `replace` option, which  ensures that the do-file stack can be re-executed without issue. Without the `replace` option, Stata will require a unique name for the log-file at each execution.

```stata
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// log process

log using "$projName/$projName.txt", text replace

// ==========================================================================
```

The log-file is generated in [plain-text](https://en.wikipedia.org/wiki/Plain_text) format. This is important for reproducibility since plain-text files (those with the [file extension](https://en.wikipedia.org/wiki/Filename_extension) `.txt`) can be opened by a wide range of applications and text editors as opposed to relying on proprietary formats like Microsoft Word files.

----

### Copy the Source Data
After being prompted to enter a new name for the dataset you will edit and use, the `master.do` file is structured to copy the data from the source data location (set above) into the project directory. This operation utilizes the `copy` command combined with the `replace` option, which ensures that the do-file stack can be re-executed without issue. Without the `replace` option, Stata will require a unique name for the source data at each execution.

```stata
// ==========================================================================

// copy source data to new directory

global newData "/*enter a new filename here*/.dta"
copy $sourceData "$projName/$newData", replace

// ==========================================================================
```

----

### Execute Sub-files
Apart from ensuring a clean and reproducible research infrastructure, the `master.do` file is primarily tasked with executing the two [sub-files needed](structuring-do-files.html): `data.do` and `analysis.do` (using the `do` command).

```stata
// ==========================================================================

// 1. execute data cleaning file
do "data.do"

// 2. execute data analysis / markdoc file
do "analysis.do"

// ==========================================================================
```

Note that the `do` command will pause the execution of the current file until the sub-file called by the `do` command executes without error. If there is an error in its execution, the entire do-file stack will stop running. If there is not an error, the primary do-file will begin running again with the command immediately following the `do` command on the sub-file has completed its execution.

----

### Archive Source Code
After both the `data.do` and `analysis.do` files execute successfully, their code and the code contained in `master.do` are copied into the `CodeArchive` subdirectory within the project directory. This ensures that all code needed for the project are archived for later reference or use. This operation utilizes the `copy` command combined with the `replace` option, which ensures that the do-file stack can be re-executed without issue. Without the `replace` option, Stata will require unique names for the code archive files at each execution.

```stata
// ==========================================================================

// copy code to code archive

copy "master.do" "$projName/CodeArchive/master.do", replace
copy "data.do" "$projName/CodeArchive/data.do", replace
copy "analysis.do" "$projName/CodeArchive/analysis.do", replace

// ==========================================================================
```

----

### Standard Closing Options
After the code are archived, the `master.do` file is structured to close both the log file and the graph window (if it is open). It also re-sets the `more` behavior so that it will occur if Stata is subsequently used in interactive mode. Finally, the `exit` command is issued to explicitly end the execution of the do-files.

```stata
// ==========================================================================

// standard closing options

log close _all
graph drop _all
set more on

// ==========================================================================

exit

```

----

##### [Back to User's Guide Cover Page]({{ base }}/pages/user-guide.html)
