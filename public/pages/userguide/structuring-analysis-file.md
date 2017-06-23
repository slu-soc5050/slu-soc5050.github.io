---
layout: page
title: User's Guide
tagline: Structuring the Analysis Do-file
tags: [Stata]
description:
---

The third of the do-files in the stack [introduced earlier in the User's Guide](structuring-do-files.html) is the `analysis.do` file. This file is designed specifically for cleaning and modifying your data so that they are prepared for your analyses.

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

### Beginning the Markdoc Process
The `analysis.do` file is structured to automatically begin the Markdoc process by creating a `.smcl` log-file named `markdoc`. This `.smcl` file is required for the creation of your analysis Markdown file. There is no need to edit this line - it is structured to operate without any changes on your end. After the command executes,  there is another divider to separate the command from the code that you write. By including `// OFF` and `// ON` before and after the divider, the divider itself will be excluded from the Markdown file that is created at the end of your `analysis.do` file.

```stata
// ==========================================================================

// start MarkDoc log
quietly log using "$projName/$projName-markdoc.smcl", ///
  replace smcl name(markdoc)

// OFF
// ==========================================================================
// ON
```

You should note the use of the `quietly` command. Any command executed after `quietly` is specified on the same line will be executed without any output.

----

### Your Commands
After the `use` command, there is a triple divider and then an indication for you to begin entering your code. *All* of your code for analyzing your data should appear in this section and should be written following the best practices discussed in this User's Guide and in the course text books. In particular, you should pay attention to the guidelines laid out in [The Zen of Stata](zen-of-stata.html).

Your narrative should be written in blocks that alternate with your source code. Narrative text should be bounded with the Markdoc commands `/***` and `***/`. All narrative text can be formatted using Markdown syntax:

```
/***
### Part 4
***/

tabulate foreign

/***
10. The above command produces a frequency table for the variable foreign. The modal category is domestic, with 70.27% of observations falling into that category.
***/

summarize mpg, detail
tabstat mpg, statistics(range iqr)

/***
11. The above commands produce descriptive statistics for the variable mpg. The variable's mean 21.297 miles per gallon with a standard deviation of 5.786. The mode is 20 miles per gallon, meaning that half of all cars have a miles per gallon rating greater than 20 and half have a miles per gallon below 20. The range of the variable is 29 (from 12 miles per gallon to 41), with an inter-quartile range of 7 (from 18 miles per gallon to 25). The inter-quartile range describes the values that cover 50% of the observations (from the 25th percentile to the 75th percentile).
***/

histogram mpg, frequency title("Miles per Gallon") subtitle("1978 Vehicles")

/***

![image]()

12. The histogram above shows the distribution of values for the variable mpg. It clearly shows the modal category of 20 as well as the range of the distribution from 12 to 41.
***/
```

Note how the placeholder for the image's url is left in your narrative. You will need to go back later and add the url in once the image file is uploaded to GitHub.

----

### Ending the Markdoc Process
After your commands are completed, the `analysis.do` file is structured to end the logging of them using the `.smcl` file described above (using the `log close` command). As with the `log using` command above, the `log close` command is executed `quietly`.

```stata
// ==========================================================================

// end MarkDoc log
quietly log close markdoc

// convert MarkDoc log to Markdown
markdoc "$projName/$projName-markdoc", ///
  replace export(md) install

// ==========================================================================
```

Once the `.smcl` log-file is closed, the `markdoc` command is issued. This command takes the contents of the `.smcl` log-file and "weaves" them together. All source code (i.e. Stata commands) are blocked off as code blocks and all narrative bounded by the Markdoc commands `/***` and `***/` are converted to Markdown formatted text. The result is an analysis markdown file that is named with your project name and "-markdoc.md". This file will need to be edited to resolve any typos and formatting issues.

----

##### [Back to User's Guide Cover Page]({{ base }}/pages/user-guide.html)
