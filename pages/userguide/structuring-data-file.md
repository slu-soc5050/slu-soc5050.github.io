---
layout: page
title: User's Guide
tagline: Structuring the Data Do-file
tags: [Stata]
description:
---

The second of the do-files in the stack [introduced earlier in the User's Guide](structuring-do-files.html) is the `data.do` file. This file is designed specifically for cleaning and modifying your data so that they are prepared for your analyses.

----

### Opening Options
There are two opening options that need to be re-stated in each sub-file of your do-file stack:

```stata
// ==========================================================================

// standard opening options

set more off
set linesize 80

// ==========================================================================
```
Astute observers will recognize that the commands `set more off` and `set linesize 80` also appear in the "Standard Opening Options" for the [`master.do` file](structuring-master-file.html). They must be re-stated because Stata does not pass the results of these particular commands from do-file to do-file.

----

### Open Data
After going through the usual documentation steps, the `data.do` file opens the data that were copied into the project directory by the [`master.do` file](structuring-master-file.html). This does not need to be edited as the information on the data file's name is automatically entered. The `use` command is the command for opening data (see the [`Week-02` repository](https://github.com/slu-soc5050/Week-02)).

```stata
// ==========================================================================

// open data
use "$projName/$newData"

// ==========================================================================
```
----

### Your Commands
After the `use` command, there is a triple divider and then an indication for you to begin entering your code. *All* of your code for modifying your data should appear in this section and should be written following the best practices discussed in this User's Guide and in the course text books. In particular, you should pay attention to the guidelines laid out in [The Zen of Stata](zen-of-stata.html).

----

### Save Data
After executing all of the commands you have written, the `data.do` file saves the changes that you have made. This does not need to be edited as the information on the data file's name is automatically entered. The `save` command is the command for opening data (see the [`Week-03` repository](https://github.com/slu-soc5050/Week-03)). Without the `replace` option, Stata will require a unique name for the source data at each execution.

```stata
// ==========================================================================

// save altered data
save "$projName/$newData", replace

// ==========================================================================
```
----

##### [Back to User's Guide Cover Page]({{ base }}/pages/user-guide.html)
