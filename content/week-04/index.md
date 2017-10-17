---
date: 2016-03-08T21:07:13+01:00
title: Week 04 - Probability and Bayes' Theorem
weight: 23
---

## Lecture Slides
{{< speakerdeck 59a8b1282ccb4338a982fe9eeaceec69 >}}

## Weekly Prep
### Instructions
I've posted the first weekly prep of the semester. The instructions are available in the [`Week-04` GitHub repository](https://github.com/slu-soc5050/Week-04/blob/master/WeeklyPrep/week-04-prep.pdf). Make sure you submit your work and answers by the beginning of class on Monday!

### Replication
{{< youtube POctIQWrqsE >}}

## Probability in the News
[FiveThirtyEight](https://fivethirtyeight.com/) just published a great article on the use [probability in news media coverage](https://fivethirtyeight.com/features/the-media-has-a-probability-problem/). The article raises important points about how error in public polling is communicated:

> As I’ve documented throughout this series, polls and other data did not support the exceptionally high degree of confidence that news organizations such as The New York Times regularly expressed about Hillary Clinton’s chances.

One of the key takeaways for me was this line:

> What can also get lost is that election forecasts — like hurricane forecasts — represent a continuous range of outcomes, none of which is likely to be exactly right.

When we talk about the likelihood of an event, we are really trying to summarize a range of possible outcomes. Keep that in mind as we progress through the semester!

## John Edmund Kerrich
One of the important statisticians we discussed this week was [John Edmund Kerrich](https://en.wikipedia.org/wiki/John_Edmund_Kerrich). I've added a data set to the `testDriveR` package with the first 2,000 flips from his experiments if you are interested in checking the data out. You'll have to update `testDriveR` on your computer:

```r
devtools::install_github("chris-prener/testDriveR")
```

Once you have the package downloaded and installed, you can load and explore Kerrich's data:

```r
library(testDriveR)

coinFlips <- kerrich

ggplot(data = coinFlips) +
  geom_hline(mapping = aes(yintercept = .5, color = "p(heads)")) +
  geom_line(mapping = aes(x = id, y = average)) +
  ylim(0,1)
```
![kerrichPlot](https://raw.githubusercontent.com/slu-soc5050/Core-Documents/sources/Week-04/kerrichPlot.png)

The `ggplot2` syntax above adds only a slight increase in complexity from your previous plots. We've added a second geom that is layered under the primary `geom_line()` that we discussed during Week 02. This `geom_hline()` allows us to add a horizontal line at `y = .5`, which is the predicted probability of either outcome of a fair coin flip. We've also modified the y-axis so that it runs from 0 to 1, covering the full range of possible probabilities.

## Extra Information
This week, I mentioned a number of important statisticians. If you want more information, you can check out these Wikipedia pages:

* [Jacob Bernoulli](https://en.wikipedia.org/wiki/Jacob_Bernoulli)
* [Abraham de Moivre](https://en.wikipedia.org/wiki/Abraham_de_Moivre)
* [Thomas Bayes](https://en.wikipedia.org/wiki/Thomas_Bayes)

We also talked about a number of statistical fallacies. One of them was Meadow's Law, which you can read about on [Wikipedia](https://en.wikipedia.org/wiki/Meadow%27s_law) and in various news articles, including [this one from 60 Minutes](https://www.cbsnews.com/news/expert-testimony-bad-evidence/).