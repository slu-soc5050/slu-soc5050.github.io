---
date: 2016-03-08T21:07:13+01:00
title: Lecture 01 - Course Introduction
weight: 20
---

## Meta
![](https://img.shields.io/badge/semester-fall%202018-orange.svg) ![](https://img.shields.io/badge/release-draft-red.svg) [![](https://img.shields.io/badge/last%20update-2018--08--11-brightgreen.svg)](https://github.com/slu-soc5050/lecture-01/blob/master/NEWS_SITE.md)

## Key Topics
[{{< keyword name="Analysis development" >}}](/topic-index/#a-d)
[{{< keyword name="Assignment" >}}](/topic-index/#a-d)
[{{< package name="cowsay" >}}](/topic-index/#a-d)
[{{< keyword name="Data" >}}](/topic-index/#a-d)
[{{< package name="datasets" >}}](/topic-index/#a-d)
[{{< tool name="GitHub" >}}](/topic-index/#e-h)
[{{< keyword name="Package installation" >}}](/topic-index/#m-p)
[{{< tool name="R" >}}](/topic-index/#q-t)
[{{< keyword name="Reproducibility" >}}](/topic-index/#q-t)
[{{< package name="utils" >}}](/topic-index/#u-z)
[{{< keyword name="Workflow" >}}](/topic-index/#u-z)

## Resources

{{< syllabus "slu-soc5050" "lecture-01-course-introduction" >}}
{{< github "slu-soc5050" "lecture-01" >}}
{{< button "Exercise - Email" "https://github.com/slu-soc5050/Week-01/blob/master/Exercises/exerciseEmail.pdf" >}}
{{< button "Exercise - Introducing R" "https://github.com/slu-soc5050/Week-01/blob/master/Exercises/exerciseR.pdf" >}}
{{< button "Exercise - Values" "https://github.com/slu-soc5050/Week-01/blob/master/Exercises/exerciseValues.pdf" >}}
{{< button "Functions" "ttps://github.com/slu-soc5050/Week-01/blob/master/Functions/week-01-rQuickref.pdf" >}}

## Lecture Slides
**_This slides are from Fall 2017 and will be updated before the first night of class._**
<p> </p>
<script async class="speakerdeck-embed" data-id="35432b57f3884b2c91c9e7ace2c87c50" data-ratio="1.33333333333333" src="//speakerdeck.com/assets/embed.js"></script>

## Introducing R and RStudio
At the very end of our first class, we introduced some basic aspects of R and RStudio. The video above summarizes what we went over and introduces some new functions as well. Please watch this before tackling the week two materials.

An additional resource is RStudio's {{< link "cheatsheet" "https://github.com/rstudio/cheatsheets/raw/master/rstudio-ide.pdf" >}} that covers the basics of their software.

### Syntax Basics

* assignment operator
* loading data from a package (`faithful` from `datasets`)
* `str()`
* `View()`

This initial example illustrates a couple of key concepts for using `R`:

1. Programming in `R` is always done with **functions**.
2. Functions take **arguments**. In this case, there is only one argument - the object name.

### Installing Packages

For those students using Docker, there should not be a need to install packages this semester. We did practice doing so with one package, however. In RStudio's console, we entered the following code:

```r
install.packages("cowsay")
```

### Using Packages

The `cowsay` package isn't a serious one. It can be used to draw a variety of ascii art:

```r
> library(cowsay)
> say(what = "do or do not, there is no try", by = "yoda")

 ----- 
do or do not, there is no try 
 ------ 
    \   
     \
                   ____
                _.' :  `._
            .-.'`.  ;   .'`.-.
   __      / : ___\ ;  /___ ; \      __
  ,'_ ""--.:__;".-.";: :".-.":__;.--"" _`,
  :' `.t""--.. '<@.`;_  ',@>` ..--""j.' `;
       `:-.._J '-.-'L__ `-- ' L_..-;'
          "-.__ ;  .-"  "-.  : __.-"
             L ' /.------.\ ' J
             "-.   "--"   .-"
             __.l"-:_JL_;-";.__
         .-j/'.;  ;""""  / .'\"-.
         .' /:`. "-.:     .-" .';  `.
      .-"  / ;  "-. "-..-" .-"  :    "-.
  .+"-.  : :      "-.__.-"      ;-._   \
  ; \  `.; ;                    : : "+. ;
  :  ;   ; ;                    : ;  : \:
  ;  :   ; :                    ;:   ;  :
  : \  ;  :  ;                  : ;  /  ::
  ;  ; :   ; :                  ;   :   ;:
  :  :  ;  :  ;                : :  ;  : ;
  ;\    :   ; :                ; ;     ; ;
  : `."-;   :  ;              :  ;    /  ;
 ;    -:   ; :              ;  : .-"   :
  :\     \  :  ;            : \.-"      :
  ;`.    \  ; :            ;.'_..--  / ;
  :  "-.  "-:  ;          :/."      .'  :
   \         \ :          ;/  __        :
    \       .-`.\        /t-""  ":-+.   :
     `.  .-"    `l    __/ /`. :  ; ; \  ;
       \   .-" .-"-.-"  .' .'j \  /   ;/
        \ / .-"   /.     .'.' ;_:'    ;
  :-""-.`./-.'     /    `.___.'
               \ `t  ._  /  bug
                "-.t-._:'
```

This example illustrates a number of additional important concepts for using `R`:

1. Packages must be installed using, usually from [**CRAN**](https://cran.r-project.org), the `R` package distribution system. The `install.packages()` function accomplishes this. This process (typically) only has to happen once.
2. *Most* packages must be loaded using the `library()` function at the beginning of each session.
3. Functions take **multiple** arguments. In this case, there are two arguments - `what` and `by`.

### Getting Help

You can learn more about `cowsay` by looking at the `README` file on the package's {{< link "GitHub page" "https://github.com/sckott/cowsay" >}}. [GitHub](https://github.com) is a service for tracking the development of open source software and data analyses, and sharing them with others. Many modern `R` packages are developed on GitHub, and the site can provide a wealth of information and examples about how particular packages work. For instance, the full list of animals available in `cowsay` can be seen in the `README` file.

You can also type `?cowsay` or `??cowsay` to get help from within RStudio. In this case, you'll need to use two question marks to bring up the help window. From there, you can find out what other ASCII characters can be drawn by the package!
