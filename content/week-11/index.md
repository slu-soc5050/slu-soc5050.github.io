---
date: 2016-03-08T21:07:13+01:00
title: Week 11 - Correlation (Part 2)
weight: 29
---

## Creating Correlation Tables
As we discuss this week, `R`'s correlation output leaves much to be desired relative to statistical software applications like Stata or SAS. I've written a function (based on a few others that are floating around) that adds a bit of flexibility and precision to the correlation calculation process, and returns output with correlation coefficients and statistical significance values combined.
<br>
<br>
<script data-gist-id="d9e63958439685d8764f1cf4a744da8e"></script>

To download this, right click on `View Raw` and download the linked file.

### Tweaking Correlation Tables in LaTeX

The output produced by the table above works great with the stargazer package:

```
library(ggplot2)
autoData <- mpg
corrs <- corrTable(autoData, coef = "pearson", listwise = TRUE, round = 3, pStar = TRUE, hwy, cty, displ)
stargazer(corrs, summary = FALSE)
```