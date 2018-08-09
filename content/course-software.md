---
date: 2016-03-09T00:11:02+01:00
title: Course Software
weight: 11
---

## Meta 

![](https://img.shields.io/badge/semester-fall%202018-orange.svg) ![](https://img.shields.io/badge/release-full-brightgreen.svg) 
![](https://img.shields.io/badge/last%20update-2018--08--09-brightgreen.svg)

## Overview

This course is built primarily around a trio of software applications - the programming language `R`, the graphical user interface for `R` called RStudio, and GitHub Desktop. As I noted on the [course onboarding page](/getting-started/#course-software), there are two choices for *accessing* software. Please read through the [course onboarding page](/getting-started/#course-software) page carefully and make the decisions you think are best for you - either using your own computer or using a lab computer. Feel free to shoot me a message on Slack or via email if you have questions about which approach is best.

## Installing `R` and RStudio

### Software Downloads
There are two applications you will need to initially download and install to get `R` up and running. If you already have these installed, please check to make sure you are running the latest versions! *This is particularly important for users of SLU managed desktops, which will likely be out of date.*

1. The computing language `R` needs to be downloaded and installed. You can download it from the [`R`'s website](https://cloud.r-project.org). Choose "Download R for (Mac) OS X" or "Download R for Windows". Windows users should look for a link that says "install R for the first time". Both macOS and Windows users should install `R` version 3.5.1, known as "Feather Spray".[^1]

2. RStudio is a graphical user interface for `R` that will make learning the language and using it much, much easier. You should download the *free* version of RStudio from [their website](https://www.rstudio.com/products/rstudio/download/#download). Choose the appropriate installer for your platform. Make sure `R` is already installed before installing RStudio.

### Install `R` Packages
There are a number of `R` packages that you will need for this semester. If you feel feel comfortable, go ahead and take care of this before the semester starts. If not, we'll go over how to do this type of installation on the first day of class! 

The following code snipped can be pasted into your `R` console to install all of these required packages.

```r
install.packages(c("tidyverse", "car", "cowsay",
    "effsize", "heplots", "Hmisc",
    "knitr", "gapminder", "ggridges", 
    "ggthemes", "janitor", "lmtest", "moments", 
    "naniar", "nortest",  "psych", "pwr", 
    "remotes", "reprex", "rmarkdown",
    "sandwich", "stargazer", "skimr"))
```

Once these packages are installed, you will also need to install an additional package with a different approach. The `testDriveR` package is only available on GitHub, and therefore requires a separate installation using the `remotes` package's `install_github()` function:

```r
remotes::install_github("chris-prener/testDriveR")
```

Depending on your version of `R` and your operating system, there will be other dependencies that are required and the number of packages installed will be considerably larger. The installation process has not been extensively tested on different operating system and hardware configurations, and though it is unlikely, you may encounter issues. If you do, please let Chris know!

## GitHub Desktop
In addition to the applications above, everyone will need a local installation of GitHub Desktop, which is a graphical user interface for accessing Git and GitHub.com. It can be downloaded for free from the application's [website](https://desktop.github.com). You will need to download and run the installer. Once it is complete, you will need to login to the application with your [GitHub.com username and password](/getting-started/#account-signups).

[^1]: All of `R`'s version names are taken from the [Peanuts comic strip](http://livefreeordichotomize.com/2017/09/28/r-release-names/).
