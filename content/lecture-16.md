---
date: 2016-03-08T21:07:13+01:00
title: Week 16 - Chi-Squared
weight: 34
---
![](https://img.shields.io/badge/semester-Fall%2C%202017-blue.svg) ![](https://img.shields.io/badge/release-updated-brightgreen.svg) 

## Handouts

<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-16/blob/master/Functions/week-16-r.pdf" target="_blank"> Functions </a>
<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-16/blob/master/Lab/week-16-lab.pdf" target="_blank"> Lab </a>
<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-16/blob/master/WeeklyPrep/week-16-prep.pdf" target="_blank"> Weekly Prep </a>
<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-16/blob/master/Workflow/week-16-workflow.pdf" target="_blank"> Workflow </a>

## Lecture Slides
{{< speakerdeck 408d974987844b0c9c75ae84e00e8c76 >}}

## Bar Plots
We covered bar plots very quickly during Week-02 of the semester. They are created using the `geom_bar()` geom in a `ggplot2` call:

```r
ggplot(data = mpg, mapping = aes(class)) +
  geom_bar()
```