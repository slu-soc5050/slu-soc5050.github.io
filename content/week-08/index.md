---
date: 2016-03-08T21:07:13+01:00
title: Week 08 - Difference of Means (Part 2)
weight: 0
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

```r
library(tidyverse)

mpg %>%
  mutate(foreign = ifelse(manufacturer == "audi" |
                           manufacturer == "honda" |
                           manufacturer == "hyundai" |
                           manufacturer == "land rover" |
                           manufacturer == "nissan" |
                           manufacturer == "subaru" |
                           manufacturer == "toyota" |
                           manufacturer == "volkswagen",
                         TRUE, FALSE)) %>%
  select(manufacturer, model, cty, hwy, foreign) -> autoData
```
