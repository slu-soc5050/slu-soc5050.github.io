---
date: 2016-03-08T21:07:13+01:00
title: Week 03 - Describing Distributions
weight: 22
---

## Meta
![](https://img.shields.io/badge/semester-fall%202018-orange.svg) ![](https://img.shields.io/badge/release-lp%20only-red.svg) [![](https://img.shields.io/badge/last%20update-2018--09--06-brightgreen.svg)](https://github.com/slu-soc5050/lecture-02/blob/master/NEWS_SITE.md)

## Resources

{{< syllabus "slu-soc5050" "lecture-03-describing-distributions" >}}
{{< github "slu-soc5050" "lecture-03" >}}
{{< button "Lecture Prep 03" "https://github.com/slu-soc5050/lecture-03/blob/master/assignments/lp-03.pdf" >}}
{{< button "Lecture Prep 03 Submission" "https://goo.gl/forms/3ApfuAJCl3EafEJT2" >}}

## Lecture Slides
**These are the Fall 2017 lecture slides - they will be updated before class.**

{{< speakerdeck 5d53b03d17064cce9cea2d119ed1cbbe >}}

## Using GitHub to Store Working Files for the Course
If you want to GitHub to store your working files (as opposed to the finish submission versions you submit via your Assignments repository), you can sign-up for a discounted student plan [here](https://education.github.com/discount_requests/new). Choose "Student" and "Individual Account", and answer any additional prompts they have. Be prepared to attach a photo of your student ID.

If you do this, you want to be sure to include a `.gitignore` file in each of your repositories. These are simple, often hidden files that prevent certain types of system files from being tracked by git and uploaded to GitHub. Each of the public-facing GitHub repos for the course and your Assignments repo have one of these - they are all identical. Use Atom to copy-and-paste a `.gitignore` file from one of these repos into your personal repositories (Atom can "see" hidden files!). Make sure you do this before commiting anything else to each new repository. See me if you have questions!

## Sync Your Work!
If you are using *multiple* computers and have your GitHub assignments repository stored on multiple computers, please sync that repository each time you *begin* working to ensure that you have the latest updates. If you don't do this, you will get errors when you go to commit changes!

## Dealing with Missing Values
As a number of you have discovered, there is missing data in the homework data set for `PS-02`. To extract descriptive statistics, you'll need to include a bit of extra code:

```r
> library(testDriveR)
> gss <- gss16
> mean(gss$INCOME16)
[1] NA
> mean(gss$INCOME16, na.rm=TRUE)
[1] 17.36556
```

Adding the `na.rm=TRUE` option will give you the appropriate output! We'll talk more about missing data in the coming weeks.

## Using LaTeX in R Notebooks
If you check out the replication notebook for this week's lab, you will notice dollar signs used around references to particular variables like this - `$x_1$`. This is your first exposure to LaTeX syntax. The dollar signs instructs LaTeX/knitr to enter "math mode", which displays equations and mathematical notation. The underscore instructs LaTeX/knitr that the "1" should be treated as a subscript (i.e. "x sub 1"). **Note that this does not look great when you look at the html output's headers. So, it may take some experimentation to get it working perfectly.**

## Extra Information
This week, I mentioned a number of important statisticians. If you want more information, you can check out these Wikipedia pages:

* [Friedrich Bessel](https://en.wikipedia.org/wiki/Friedrich_Bessel)
* [Ronald Fisher](https://en.wikipedia.org/wiki/Ronald_Fisher)
* [William Sealy Gosset](https://en.wikipedia.org/wiki/William_Sealy_Gosset)

I also included code for replicating the Anscombe's Quartet plots from the last lecture slide for Week-03. This code can be found at the end of the lab replication file.