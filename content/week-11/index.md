---
date: 2016-03-08T21:07:13+01:00
title: Week 11 - Correlation (Part 2)
weight: 29
---

## Handouts

<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-11/blob/master/Functions/week-11-r.pdf" target="_blank"> Functions </a>
<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-11/blob/master/Lab/week-11-lab.pdf" target="_blank"> Lab </a>
<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-11/blob/master/LaTeX/week-11-latex.pdf" target="_blank"> LaTeX </a>
<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-11/blob/master/WeeklyPrep/week-11-prep.pdf" target="_blank"> Weekly Prep </a>

## Lecture Slides
{{< speakerdeck 32c6b4abfa1f4f05abe2be16f56d1705 >}}

## Creating Correlation Tables
As we discuss this week, `R`'s correlation output leaves much to be desired relative to statistical software applications like Stata or SAS. I've written a function (based on a few others that are floating around) that adds a bit of flexibility and precision to the correlation calculation process, and returns output with correlation coefficients and statistical significance values combined.

<script data-gist-id="d9e63958439685d8764f1cf4a744da8e"></script>

To download this, right click on `View Raw` and download the linked file.

## Some Example Data for Class

<script data-gist-id="eff7358f57c492ce2ea58c67470de9fa"></script>
