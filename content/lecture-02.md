---
date: 2016-03-08T21:07:13+01:00
title: Week 02 - Working with Data (Part 1)
weight: 21
---
![](https://img.shields.io/badge/semester-Fall%2C%202017-blue.svg) ![](https://img.shields.io/badge/release-updated-brightgreen.svg) 

## General Handouts

<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-02/blob/master/Lab/week-02-lab.pdf" target="_blank"> Lab </a>
<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-02/blob/master/PS-01/PS-01.pdf" target="_blank"> Problem Set 01 </a>

## Lecture 02a - Introducing `ggplot2`
### Lecture Handouts
<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-02/blob/master/Functions/week-02-lecture-02a-rQuickref.pdf" target="_blank"> Functions </a>

### Slides
{{< speakerdeck 235fdb303a2e40f4a24f9961f166cbea >}}

### Video Lecture
{{< youtube eT_6tw4fWRE >}}

## Lecture 02b - Grammar of Graphics
### Lecture Handouts

<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-02/blob/master/Functions/week-02-lecture-02b-rQuickref.pdf" target="_blank"> Functions </a> 

### Slides
{{< speakerdeck 8c95934676fe4601bcadcfd45011632c >}}

### Video Lecture
{{< youtube EHZ2JtVCDCQ >}}

## Lecture 03 - Verbs for Cleaning Data
### Lecture Handouts

<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-02/blob/master/Functions/week-02-lecture-03-rQuickref.pdf" target="_blank"> Functions </a> 

### Slides
{{< speakerdeck cc90cd776dbb49c5a285aaa464abc4a8 >}}

### Video Lecture
{{< youtube txSNKb6Akgs >}}

## Lecture 04 - Structuring Notebooks
### Lecture Handouts

<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-02/blob/master/Functions/week-02-lecture-04-rQuickref.pdf" target="_blank"> Functions </a> 
<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-02/blob/master/NotebookSample/week02.Rmd" target="_blank"> Notebook Sample </a> 

### Slides
{{< speakerdeck eda0ada395544af7bb08b271ce7dbf67 >}}

### Video Lecture
{{< youtube Rb1jsVRsnbk >}}

## Data for Assignments
The data that you need for many of the assignments this semester is available as an `R` package named `testDriveR`. Unlike many of the "official" packages we use in this course that are available on CRAN, the data package is not. I have made the package available on [GitHub](https://github.com/chris-prener/testDriveR).

You can install packages from GitHub using the `devtools` package:

```r
# install devtools first
install.packages("devtools")

# once devtools is installed, use the install_github function to install testDriveR
library(devtools)
devtools::install_github("chris-prener/testDriveR")
```

Since this package is "under development", please let me know immediately if you find any issues or run into installation errors. When I published updates, simply re-execute the `install_github("chris-prener/testDriveR")` function. I'll let everyone know when updates are published.

## Cheatsheets
RStudio offers a number of cheatsheets that you may find useful. FYI - they offer *way* more detail than what I provide. This is intentional on my part. So, if you feeling confident and are looking to build upon what a particular week covers, check them out!

* [`ggplot2`](https://github.com/rstudio/cheatsheets/raw/master/source/pdfs/ggplot2-cheatsheet-2.1.pdf)
* [`dplyr`](https://github.com/rstudio/cheatsheets/raw/master/source/pdfs/data-transformation-cheatsheet.pdf)
* [`rmarkdown`](https://github.com/rstudio/cheatsheets/raw/master/source/pdfs/rmarkdown-cheatsheet-2.0.pdf)

## Extra Information
This week, I mentioned a number of important figures. If you want more information, you can check out these Wikipedia pages:

* [René Descartes](https://en.wikipedia.org/wiki/René_Descartes)
* [Donald Knuth](https://en.wikipedia.org/wiki/Donald_Knuth)
* [George Boole](https://en.wikipedia.org/wiki/George_Boole)