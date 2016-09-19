---
layout: page
title: User's Guide
tagline: Structuring Do-Files for Replication
tags: [Stata]
description:
---

As you will see in in J. Scott Long’s book *The Workflow of Data Analysis Using Stata*, smart analysts think consistently and consciously about their workflows. Workflows are the organized, systematic approaches that take break down a task or work product and map each step from the very first to the task’s completion. We use workflows in research to structure our approach to data analysis. This helps to improve the quality of our work by preventing us from missing small but crucial steps. A well structured workflow can also make our work more reproducible.

----

### Workflow for Reproducible Assignments
For this class, we will use the same workflow for lab assignments and problem sets. With a little modification, this workflow can also be used for your final project. The image below, based on [Kieran Healy's excellent diagram](http://plain-text.co), breaks down our course workflow:

![image]({{ base }}/assets/images/workflow.png)

When executed correctly, this workflow allows you to generate (and re-generate) a submission-ready assignment document from raw data with a single click. The workflow begins with raw data. A “stack” of do-files is then used to clean the raw data and produce your analysis. The `master.do` file clears Stata's memory so that you are working with a clean session, creates your project directory, ensures that necessary files are present, and calls two sub-files. See the page [Structuring the Master Do-file](structuring-master-file.html)) for additional details on what this file's template contains.

The first, `data.do`, imports the raw data and cleans it. This file also produces your project’s `codebook.txt` file, which contains details about the variables you use. The second, `analysis.do`, contains the Stata code necessary for executing statistical tests and producing figures. It also contains embedded Markdown text.

At the end of `analysis.do`, the output and Markdown files are "weaved" together using `MarkDoc`, a user-written package for Stata that can be used to create a variety of output text files. We can use `MarkDoc` to produce an `analysis.markdown` text file that contains the narrative file needed for completing the assignment. It also includes references for embedding images in GitHub. After `analysis.do` completes, Stata returns to `master.do` and finishes the final closing commands. These complete the `logfile.txt`, which documents the execution of nearly all files.

The files requested as deliverables for your assignment can then copied as-is into your local copy of your GitHub assignment repository. After you commit your changes and sync them, you will be able to view these files on [GitHub](https://github.com). When you open your `analysis.markdown` file, you will see that the figures you produced will be automatically embedded into your submission.

----

### Documentation Within Do-files
All three do files in your stack have areas reserved for documenting your files. At the top of each file, you will be prompted by Atom to give the file a **title**. This is particularly important since we use files that have generic names (`master.do`, `data.do`, etc.). Having a title at the top of each file allows you to quickly identify the assignment or project it is associated with.

```stata
// ==========================================================================

// /*enter a title here*/

// ==========================================================================
```

The do-file also also has space reserved for **metadata**. [Metadata](https://en.wikipedia.org/wiki/Metadata) is literally "data about data". Metadata gives users a (typically) standardized format to documenting what specific files accomplish and are for.

The template automatically enters the filename and project name, though for other projects you would want to change one or both of these fields.

You are prompted to include data about the purpose of the file, when it was created, when it was updated, and who authored the file. Each of these pieces of metadata can be helpful for identifying what a file accomplishes and why. One trick with this part of the file is to remember to *update* it when you make changes or reuse the code.

```stata
// ==========================================================================

/*
file name - master.do

project name - SOC5050: Quantitative Analysis, Fall 2016

purpose - /*what does this do-file do?*/

created - /*what is today's date?*/

updated - /*what is today's date?*/

author - /*what is your name?*/
*/

// ==========================================================================
```

Below the metadata, there are spaces reserved for writing a **longer-form description** of what the do-file accomplishes, and listing updates to a file. Try to be a descriptive as possible when you fill in both sections - this can be invaluable information when collaborating with others or returning to a project after some time away. As with the meta-data, it is important to remember to *update* it when you make changes to the file or reuse the code.

```stata
// ==========================================================================

/*
full description -
/*enter a description of what this do-file does*/
*/

/*
updates -
none
*/

// ==========================================================================
```

Here is an example of how I typically fill out the updates section:

```stata
updates -
17 Sep 2016 - added code that cleans the demographic variables / CHRIS

19 Sep 2016 - fixed a typo in the race variable's value labels / CHRIS

```

Finally, there is space to document **associated files**. *Superordinates* are files that are predecessors of a file and that are required for it to run. For example, the source data has to pre-exist for a typical do-file stack to execute properly. *Subordinates* are files that the current do-file calls.

```stata
// ==========================================================================

/*
superordinates  -
- /*enter the source data filename here*/.dta
*/

/*
subordinates -
- data.do
- analysis.do
*/

// ==========================================================================
```

----

##### [Back to User's Guide Cover Page]({{ base }}/pages/user-guide.html)
