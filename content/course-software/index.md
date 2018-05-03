---
date: 2016-03-09T00:11:02+01:00
title: Course Software
weight: 11
---

## Meta 

![](https://img.shields.io/badge/semester-fall%202018-yellow.svg) ![](https://img.shields.io/badge/release-draft-red.svg) 
![](https://img.shields.io/badge/last%20update-2018--05--03-brightgreen.svg)

## Overview

This course is built primarily around a trio of software applications - the programming language `R`, the graphical user interface for `R` called RStudio, and GitHub Desktop. As I noted on the [course onboarding page](/getting-started/#course-software), there are two choices for *accessing* software and two choices for *installing* software. Please read through the [course onboarding page](/getting-started/#course-software) page carefully and make the decisions you think are best for you. Feel free to shoot me a message on Slack or via email if you have questions about which approach is best.

## Coursework with Docker
If you decide to use a virtual installation, there are a couple of steps you will have to complete. 

1. You will need to download and install the appropriate version [Docker Community Edition](https://store.docker.com/search?type=edition&offering=community) for your operating system. Once it is installed, make sure it is *running* before continuing.

2. The easiest way to use Docker is with its Docker's graphical user interface [Kitematic](https://github.com/docker/kitematic/). Download the latest version from [Kitematic's GitHub page](https://github.com/docker/kitematic/releases/latest).

Once Kitematic is installed, you can open it. Skip the log-in process if you are prompted to do so. Search for the `slu-soc-stats` image in the search bar and click "Create". Once it has downloaded and installed, you can use the start and stop buttons to control whether or not your container is available for use. Under the Home tab, you will see an "Access URL" listed when the container is available. Copy and paste this into your browser, and you should be taken to RStudio. If prompted, the username and password are both "rstudio". 

## Coursework Local Installations of `R`
If you decide to manage your own local installation of `R` this semester, you'll need to download both of the applications we're using, `R` and RStudio, install them, and then install the relevant packages.

### Software Downloads
There are two applications you will need to download and install. If you already have these installed, please check to make sure you are running the latest versions!

1. The computing language `R` needs to be downloaded and installed. You can download it from the [`R`'s website](https://cloud.r-project.org). Choose "Download R for (Mac) OS X" or "Download R for Windows". Windows users should look for a link that says "install R for the first time". Both macOS and Windows users should install `R` version 3.5.0, known as "Joy in Playing".[^1]

2. RStudio is a graphical user interface for `R` that will make learning the language and using it much, much easier. You should download the *free* version of RStudio from [their website](https://www.rstudio.com/products/rstudio/download/#download). Choose the appropriate installer for your platform. Make sure `R` is already installed before installing RStudio.

### Install `R` Packages
There are a number of `R` packages that you will need for this semester. 

```r
install.packages(c("tidyverse", "car", "Hmisc", "knitr", "ggridges", "ggthemes", "janitor", "lmtest", "moments", "nortest", "psych", "pwr", "sandwich", "stargazer", "rmarkdown", "skimr"))
```

## GitHub Desktop
In addition to the applications above, everyone will need a local installation of GitHub Desktop, which is a graphical user interface for accessing Git and GitHub.com. It can be downloaded for free from the application's [website](https://desktop.github.com). You will need to download and run the installer. Once it is complete, you will need to login to the application with your [GitHub.com username and password](/getting-started/#account-signups).

[^1]: All of `R`'s version names are taken from the [Peanuts comic strip](http://livefreeordichotomize.com/2017/09/28/r-release-names/).
