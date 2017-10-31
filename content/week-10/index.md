---
date: 2016-03-08T21:07:13+01:00
title: Week 10 - Correlation (Part 1)
weight: 28
---

## Handouts

<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-10/blob/master/Equations/week-10-equations.pdf" target="_blank"> Equations </a> 
<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-10/blob/master/Functions/week-10-r.pdf" target="_blank"> Functions </a>
<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-10/blob/master/Lab/week-10-lab.pdf" target="_blank"> Lab </a>

## Lecture Slides
{{< speakerdeck 3f9624e1f07d46f4ba17345b01d16f4c >}}

## Weekly Prep
### Instructions
The instructions for this week's weekly prep are available in the [`Week-10` GitHub repository](https://github.com/slu-soc5050/Week-10/blob/master/WeeklyPrep/week-10-prep.pdf). Make sure you submit your work and answers by the beginning of class on Monday!

### Replication
{{< youtube cjQvhIMBIw8 >}}

## PS-07
As we discussed in class this week, the deadline on PS-07 has been extended until Monday, November 6 at 4:15pm. Folks have had a range of issues with the assignment, and I want to provide some advice to everyone for successfully navigating it.

### Reading Data
Many of you have been importing the data using the `Import Dataset` button. I want to encourage everyone to use the most efficient *and* reproducible process for bringing these data into `R`:
```r
dataFrame <- readxl::read_xlsx("fileName.xslx")
```
The `Import Dataset` tool does provide you with some `R` code, but it is more voluminous than what I have provided here. You also need to copy-and-paste the code into your notebook to make it a reproducible process. Additionally, `read_xlsx()` provides some additional options that can make your life easier - I strongly suggest checking out the [`readxl` section of the `tidyverse` website](http://readxl.tidyverse.org) to learn more about how the function works.

The second area that is important here is getting the data into the global environment. Many of you left out the `<-` assignment operator, and were getting the data to show up in the Console or your notebook but not saving it. Assigning the results to the `read_xlsx()` function to an object will get you over this hump!

### Exploring Variables
The instructions suggested that you should not use Microsoft Excel. I had meant that to be for *cleaning* the data. Excel can still have a useful function for *exploring* how the data are structured. One thing you'll notice is that `View()` in `R` truncates the number of variables shown. For very wide data sets, such as this one, opening the data in a spreadsheet application can therefore be very helpful.

One complain that I have about Excel is that it can make subtle changes to how the file is structured when you hit the `Save` button. When I explore data, I make a point of opening a *copy* of the file to ensure that the main document that I will be importing into `R` remains unaltered. 

### Editing Variable Names
The approach I have seen students taking with renaming columns has been to use `dplyr::rename()` for dealing with the unhelpful variable names. What happens here is that the variables are stored in some place other than the first row of the Excel spreadsheet. They are not accessible to `read_xlsx()` when the data are imported. 

To get these variable names into the right part of the data frame, you need to get them into the first row of the data frame first. Everything above the variable names is metadata, which you can drop. Once you've dropped those rows, you can use this function to take the contents of the first row and make it the variable names:

```r
colnames(dataFrame) <- dataFrame[1,]
```