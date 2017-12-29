---
date: 2016-03-08T21:07:13+01:00
title: Week 07 - Difference of Means (Part 1)
weight: 26
---
![](https://img.shields.io/badge/semester-Fall%2C%202017-blue.svg) ![](https://img.shields.io/badge/release-updated-brightgreen.svg) 

## Handouts

<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-07/blob/master/Equations/week-07-equations.pdf" target="_blank"> Equations </a>
<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-07/blob/master/Exercise/week-07-exercise.pdf" target="_blank"> Exercise </a>
<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-07/blob/master/Functions/week-07-rQuickRef.pdf" target="_blank"> Functions </a>
<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-07/blob/master/Lab/week-07-lab.pdf" target="_blank"> Lab </a>
<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-07/blob/master/WeeklyPrep/week-07-prep.pdf" target="_blank"> Weekly Prep </a>

## Lecture Slides
{{< speakerdeck cc160bd374244d7c90f71d86d2bf9c6f >}}

## Weekly Prep
### Instructions
The instructions for this week's weekly prep are available in the [`Week-07` GitHub repository](https://github.com/slu-soc5050/Week-07/blob/master/WeeklyPrep/week-07-prep.pdf). Make sure you submit your work and answers by the beginning of class on Monday!

### Replication
{{< youtube elqbSD1dGy8 >}}

## YAML Headers for RMarkdown Documents
The area at the top of your RMarkdown documents is known as a YAML header ([Wikipedia site](https://en.wikipedia.org/wiki/YAML) and [YAML project homepage](http://www.yaml.org)). YAML stands for "YAML Ain't Markup Language" (a bit of nerdy humor!), and is designed to provide human readable metadata about text files. This interest in human readable metadata is consistent with our more general interest in writing computer files that are useful for computers but also readable by people. In the past, I had only asked you to edit the title of your document.

This week, I introduced two complications. First, I noted the ability to add an author field:

```
author: "Christopher Prener, Ph.D."
```

You could take this even further using Markdown if you wanted. For instance, we could include a hyperlink to my website in the author field:

```
author: "[Christopher Prener, Ph.D.](https://chris-prener.github.io)"
```

This will render as nicely formatted html when you export it, with the link embedded in the text of my name.

The second complication I introduced this week was the ability to add a date to your documents. This can be done statically if you wish:

```
date: "01 Oct 2017"
```

However, it is more useful to set the date dynamically. You can include this bit of `R` code in your header to do so:

```
date: "`r Sys.Date()`"
```

This field will automatically update every time you save your document, meaning that the header will always reflect the date you last made changes.