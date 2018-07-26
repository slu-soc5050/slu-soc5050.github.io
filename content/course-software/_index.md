---
date: 2016-03-09T00:11:02+01:00
title: Course Software
weight: 11
---

## Meta 

![](https://img.shields.io/badge/semester-fall%202018-orange.svg) ![](https://img.shields.io/badge/release-draft-red.svg) 
![](https://img.shields.io/badge/last%20update-2018--07--26-brightgreen.svg)

## Overview

This course is built primarily around a trio of software applications - the programming language `R`, the graphical user interface for `R` called RStudio, and GitHub Desktop. As I noted on the [course onboarding page](/getting-started/#course-software), there are two choices for *accessing* software and two choices for *installing* software. Please read through the [course onboarding page](/getting-started/#course-software) page carefully and make the decisions you think are best for you. Feel free to shoot me a message on Slack or via email if you have questions about which approach is best.

Additionally, **all students** regardless of their installation choices for `R` and RStudio will need to make sure their own computer or lab desktop has [GitHub Desktop installed](/course-software/#github-desktop). Lab computers will not have this pre-installed for you.

## Coursework with Docker
Using Docker is the easiest, most straightforward way to access `R` and RStudio for this class. Using Docker allows you to install and access `R` and RStudio as well as all of the required packages with a single, streamlined insallation process.

### Installing Docker
If you decide to use Docker's virtual installation, there are a couple of steps you will have to complete if you are using your own computer. If you are using a lab computer, you can skip the first two installation steps but will still need to complete step 3.

1. You will need to download and install the appropriate version [Docker Community Edition](https://store.docker.com/search?type=edition&offering=community) for your operating system.

2. The easiest way to use Docker is with its Docker's graphical user interface [Kitematic](https://github.com/docker/kitematic/). Download the latest version from [Kitematic's GitHub page](https://github.com/docker/kitematic/releases/latest).

3. Once Kitematic is installed, make sure Docker is **running** before you open Kitematic. Skip the log-in process if you are prompted to do so. Search for the `slu-soc-stats` image in the search bar and click "Create" when you have found it. 

### Using Docker for Coursework
Additional details about using Docker with Kitematic (recommended) and, alteratively, using the command line (a more advanced technique) can be found at the following links:

<p> </p>
{{< buttonDocker "Using Docker with Kitematic" "/course-software/docker-kitematic" >}} {{< buttonDocker "Using Docker with the Command Line" "/course-software/docker-cl" >}}

## Coursework with Local Installations of `R`
If you decide to manage your own local installation of `R` this semester, which is the more advanced way to set-up the course software, you'll need to download both of the applications we're using, `R` and RStudio, install them, and then install the relevant packages.

### Software Downloads
There are two applications you will need to download and install. If you already have these installed, please check to make sure you are running the latest versions!

1. The computing language `R` needs to be downloaded and installed. You can download it from the [`R`'s website](https://cloud.r-project.org). Choose "Download R for (Mac) OS X" or "Download R for Windows". Windows users should look for a link that says "install R for the first time". Both macOS and Windows users should install `R` version 3.5.0, known as "Joy in Playing".[^1]

2. RStudio is a graphical user interface for `R` that will make learning the language and using it much, much easier. You should download the *free* version of RStudio from [their website](https://www.rstudio.com/products/rstudio/download/#download). Choose the appropriate installer for your platform. Make sure `R` is already installed before installing RStudio.

### Install `R` Packages
There are a number of `R` packages that you will need for this semester. The following code snipped can be pasted into your `R` console to install all of these required packages.

```r
install.packages(c("tidyverse", "car", 
    "Hmisc","knitr", "gapminder", "ggridges", 
    "ggthemes", "janitor", "lmtest", "moments", 
    "naniar", "nortest",  "psych", "pwr", 
    "remotes", "reprex", "rmarkdown",
    "sandwich", "stargazer", "skimr"))
```

Once these packages are installed, you will also need to install additional packages with a different approach. The `testDriveR` package is only available on GitHub, and therefore requires a separate installation. The `reprex` package is available on CRAN but that version is currently broken. For both packages, they need to be installed from GitHub using the `remotes` package's `install_github()` function:

```r
remotes::install_github("chris-prener/testDriveR")
```

Depending on your version of `R` and your operating system, there will be other dependencies that are required and the number of packages installed will be considerably larger. The installation process has not been extensively tested, and you may encounter issues. If you do, please let Chris know!

## GitHub Desktop
In addition to the applications above, everyone will need a local installation of GitHub Desktop, which is a graphical user interface for accessing Git and GitHub.com. It can be downloaded for free from the application's [website](https://desktop.github.com). You will need to download and run the installer. Once it is complete, you will need to login to the application with your [GitHub.com username and password](/getting-started/#account-signups).

[^1]: All of `R`'s version names are taken from the [Peanuts comic strip](http://livefreeordichotomize.com/2017/09/28/r-release-names/).
