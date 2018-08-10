---
date: 2016-03-08T21:07:13+01:00
title: Lecture 01 - Course Introduction
weight: 20
---

## Meta
![](https://img.shields.io/badge/semester-fall%202018-orange.svg) ![](https://img.shields.io/badge/release-draft-red.svg) [![](https://img.shields.io/badge/last%20update-2018--05--04-brightgreen.svg)](https://github.com/slu-soc5050/lecture-01/blob/master/NEWS_SITE.md)

## Resources

{{< syllabus "slu-soc5050" "lecture-01-course-introduction" >}}
{{< github "slu-soc5050" "lecture-01" >}}
{{< button "Exercise - Email" "https://github.com/slu-soc5050/Week-01/blob/master/Exercises/exerciseEmail.pdf" >}}
{{< button "Exercise - Introducing R" "https://github.com/slu-soc5050/Week-01/blob/master/Exercises/exerciseR.pdf" >}}
{{< button "Exercise - Values" "https://github.com/slu-soc5050/Week-01/blob/master/Exercises/exerciseValues.pdf" >}}
{{< button "Functions" "ttps://github.com/slu-soc5050/Week-01/blob/master/Functions/week-01-rQuickref.pdf" >}}

## Lecture Slides
<p> </p>
<script async class="speakerdeck-embed" data-id="35432b57f3884b2c91c9e7ace2c87c50" data-ratio="1.33333333333333" src="//speakerdeck.com/assets/embed.js"></script>

## Introducing R and RStudio
<p> </p>
{{< youtube eQRjfpoFP0U >}}

At the very end of our first class, we introduced some basic aspects of R and RStudio. The video above summarizes what we went over and introduces some new functions as well. Please watch this before tackling the week two materials.

An additional resource is RStudio's {{< link "cheatsheet" "https://github.com/rstudio/cheatsheets/raw/master/rstudio-ide.pdf" >}} that covers the basics of their software.

### Installing Packages

For those students using Docker, there should not be a need to install packages this semester. We did practice doing so with one package, however. In RStudio's console, we entered the following code:

```r
install.packages("cowsay")
```

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

This example illustrates a number of important concepts for using `R`:

1. Packages must be installed using, usually from [**CRAN**](https://cran.r-project.org), the `R` package distribution system. The `install.packages()` function accomplishes this. This process (typically) only has to happen once.
2. Programming in `R` is always done with **functions**.
3. Packages must be loaded using the `library()` function at the beginning of each session.
4. Functions take **arguments**. In this case, there are two arguments - `what` and `by`.

You can learn more about `cowsay` by looking at the `README` file on the package's {{< link "GitHub page" "https://github.com/sckott/cowsay" >}}. [GitHub](https://github.com) is a service for tracking the development of open source software and data analyses, and sharing them with others. Many modern `R` packages are developed on GitHub, and the site can provide a wealth of information and examples about how particular packages work. For instance, the full list of animals available in `cowsay` can be seen in the `README` file.
