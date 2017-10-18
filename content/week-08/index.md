---
date: 2016-03-08T21:07:13+01:00
title: Week 08 - Difference of Means (Part 2)
weight: 27
---

## Lecture Slides
{{< speakerdeck 6f5a77f5d7144394b05b2f08f6e0d844 >}}

## Weekly Prep
### Instructions
The instructions for this week's weekly prep are available in the [`Week-08` GitHub repository](https://github.com/slu-soc5050/Week-08/blob/master/WeeklyPrep/week-08-prep.pdf). Make sure you submit your work and answers by the beginning of class on Monday!

### Replication
{{< youtube X4S7wIyLFTs >}}

## New and Updated Packages for Class
We are going to be using a bunch of new packages this week! Here is a list of packages to install using `install.packages()`:

* `car`
* `effsize`
* `gapminder`
* `ggridges`
* `pwr`
* `stargazer`

You will also need to install a new package, `stlData`, from GitHub and update the `testDriveR` package:

```r
library(devtools)
devtools::install_github("chris-prener/stlData")
devtools::install_github("chris-prener/testDriveR")
```

## Recodes from the Lecture
We need a binary outcome to work though the examples in the lecture that use the `mpg` data. We'll make a variable called `foreign` that is `TRUE` if the vehicle is produced by a manufacturer whose headquarters is in another country.

<script data-gist-id="ce737d7cfb4c8b1a2ab137c3e89d1349"></script>

## Tips for Working with Paired Data
The lab and the problem set for this week both include paired data, and you may run into a couple of issues that I did not sufficiently highlight in the lecture. First, I want to provide some code for recreating these issues. This code creates two data frames from the `stlIncome` data in the `stlData` package:

<script data-gist-id="cc9eeccf29e437025049026f8faf9a88"></script>

`incomeLong` has appropriately arranged long data, with two observations for each census tract. `incomeWide` has the outcome of converting `incomeLong` to wide.

### Issues with Plots
The first issue that may arise is related to plotting data that are long. Following the examples from class, you may be tempted to use the code under `plot 1`. It will produce the following plot:
![image](/images/week-08-img01.png)

Even those we specified that `year` should be the `x` variable, it does not provide two boxes on the plot. To do this correctly, we need to include a third option in our aesthetic mapping called `group` that is set equal to our `year` variable. The code under `plot 2` does this, and will produce the following plot:
![image](/images/week-08-img02.png)

Now we have two boxes, but the x-axis does not look right. That is because `year` is stored as a numeric variable, so `ggplot2` allows for the possibility that there *could* be values other than `2010` and `2015`. To remedy this, we can wrap the `year` variable's reference as the `x` variable in the `as.factor()` function. The code under `plot 3` does this, and will produce the following plot:
![image](/images/week-08-img03.png)

### Issues with Variable Names
When we convert `incomeLong` to `incomeWide`, the variable names become `2010` and `2015`. Trying to call a function with these variable names (like `mean(incomeWide$2010)`) will produce an error. You must wrap numeric variable names in back ticks, as you see at the bottom of the example provided above. This will allow the code to execute properly.