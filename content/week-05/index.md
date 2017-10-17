---
date: 2016-03-08T21:07:13+01:00
title: Week 05 - The Distribution of Random Variables
weight: 24
---

## Lecture Slides
{{< speakerdeck c497c75aad794d199096758b6050c489 >}}

## Weekly Prep
### Instructions
The instructions for this week's weekly prep are available in the [`Week-05` GitHub repository](https://github.com/slu-soc5050/Week-05/blob/master/WeeklyPrep/week-05-prep.pdf). Make sure you submit your work and answers by the beginning of class on Monday!

### Replication
{{< youtube Tt2rErvCdO0 >}}

## Grappling with p-values
Here are a couple of links for digging further into what p-values are and how we explain them:

* American Statistical Association's [Statement on p-values](http://amstat.tandfonline.com/doi/abs/10.1080/00031305.2016.1154108)
* [``Mission Improbable: A Concise and Precise Definition of P-Value''](http://www.sciencemag.org/news/2009/10/mission-improbable-concise-and-precise-definition-p-value) - Science Magazine interview with [Victor De Gruttola](https://www.hsph.harvard.edu/victor-de-gruttola/)
* [``Science Isn't Broken''](https://fivethirtyeight.com/features/science-isnt-broken/?ex_cid=endlink#part1) - FiveThirtyEight article on p-values
* [``Not Even Scientists Can Easily Explain P-values''](http://fivethirtyeight.com/features/not-even-scientists-can-easily-explain-p-values/) - FiveThirtyEight article on p-values, includes the video I mentioned in class
* [Andrew Gelman's](http://andrewgelman.com/) [views on p-values](http://www.stat.columbia.edu/~gelman/research/published/asa_pvalues.pdf)
* [``Abandon Statistical Significance''](http://www.stat.columbia.edu/~gelman/research/unpublished/abandon.pdf) - Andrew Gelman and others
* Gelman and John Carlin [suggest some solutions for the ``p-value communication problem''](http://www.stat.columbia.edu/~gelman/research/published/jasa_signif_2.pdf)
* [``It will be much harder to call new findings ‘significant’ if this team gets its way''](http://www.sciencemag.org/news/2017/07/it-will-be-much-harder-call-new-findings-significant-if-team-gets-its-way) - Science Magazine article on changing culture around p-values

## Histograms with the Normal Distribution Overlaid in `ggplot2`
I introduced the idea of a histogram with a normal distribution overlaid during this week's lecture, but purposely did not include the syntax on our quick reference sheet for `R` functions. If you are interested in playing with the syntax, it is included below. We make one key change to the initial `ggplot()` call - the aesthetic mapping is included in the initial `ggplot()` function rather than in a specific geom. We also covert the `hwy` variable's representation from frequency to density, and layer on top of this our normal distribution by using the `stat_function()` function. Make sure to update the arguments for `stat_function()` if you want to adjust this example, and note that we have to specify the data frame *and* the variable name separated by a `$`.
```r
library(ggplot2)

ggplot(data = mpg, mapping = aes(hwy)) +
  geom_histogram(mapping = aes(y = ..density..)) +
  stat_function(fun = dnorm, color = "red",
    args=list(mean=mean(mpg$hwy), sd=sd(mpg$hwy)))
```
![histogramNormal.png](https://raw.githubusercontent.com/slu-soc5050/Core-Documents/sources/Week-05/histogramNormal.png)

## Q-Q Plots in `ggplot2`
We discussed quantile-quantile plots this week as a way to diagnose asymmetry in distributions. We made these plots using base `R` rather than `ggplot2` because the syntax is far simpler in base `R` and we do not typically produce q-q plots for presentation or publication. However, there may come a time when you'd like to show off a q-q plot, and it is *possible* to do it using `ggplot2`. The syntax below comes from [Manuel Gimmond](http://mgimond.github.io/ES218/Week06a.html), a research scientist a Colby College.

`ggplot2` does have a built-in function for plotting your data relative to the normal distribution. You need to specify your variable of interest using `sample` in the aesthetic mapping. You also include the aesthetic mapping in the initial `ggplot()` function and then add the comparison with the standard normal using `stat_qq()`:
```r
ggplot(data = mpg, mapping = aes(sample = hwy)) +
  stat_qq(distribution = qnorm)
```
![ggplotQQ1.png](https://raw.githubusercontent.com/slu-soc5050/Core-Documents/sources/Week-05/ggplotQQ1.png)

The complexity of using `ggplot2` comes from the fact that there is no built-in functionality for calculating the slope and intercept of the q-q plot line in the package. We therefore need to calculate those values ourselves:
```r
# Identify the 1st and 3rd quartiles
y     <- quantile(mpg$hwy, c(0.25, 0.75))

# Identify the 1st and 3rd quartiles of the standard normal
x     <- qnorm(c(0.25, 0.75))

# Compute the slope of the line
slope <- diff(y) / diff(x)

# Compute the lintercept of the line
int   <- y[1] - slope * x[1]
```

Once we have the slope and the intercept of the line caluclated, we can add it to our previous plot using the `geom_abline()` function:
```r
ggplot(data = mpg, mapping = aes(sample = hwy)) +
  geom_abline(intercept = int, slope = slope, color = "red") +
  stat_qq(distribution = qnorm)
```
![ggplotQQ2.png](https://raw.githubusercontent.com/slu-soc5050/Core-Documents/sources/Week-05/ggplotQQ2.png)

For those of you in it for the long haul, it looks like the next public release of `ggplot2()` will correct this. There is a new function called `geom_qq_line()` that will remove the need to manually calculate the slope and intercept. If you want to use this now, you need to install the [development version of `ggplot2` from GitHub using the `devtools::install_github()` function]. This is **not** required, however!

## Performing Calculations
During class this week, I briefly described how to perform calculations and save results in `R`. You can use standard mathematical operators `+`, `-`, `/`, and `*` to add, subtract, divide, and multiply (respectively). These are reviewed in the `week-02-lecture-03-rQuickref.pdf` file in the [`Week-02` repo on GitHub](https://github.com/slu-soc5050/Week-02/blob/master/Functions/week-02-lecture-03-rQuickref.pdf). Quickly, we can calculate a value like lambda within `R`, save it as an object, and reference the object in later calculations:

```r
> lambda <- 100000 * .00004
> dpois(6, lambda = lambda)
[1] 0.1041956
```

## Reading in Arbitrary Vectors to `R`
Problem Set 04 asks you to find the variance of an arbitrary set of values in a vector (list) of numbers. These can easily be read into `R` so that you do not have to calculate the variance by hand. You can use the same technique to check your work as you calculate skew and kurtosis by hand.

To begin:
Let x = 2, 4, 6, 8, 10

```r
x <- c(2, 4, 6, 8, 10)
```

Once you add these values into `R`'s memory, you will be able to see them in your environment tab and will be able to include them in calculations:

```r
> mean(x)
[1] 6
```

## Extra Information
This week, I mentioned a number of important statisticians. If you want more information, you can check out these Wikipedia pages:

* [Jacob Bernoulli](https://en.wikipedia.org/wiki/Jacob_Bernoulli)
* [Ladislaus Bortkiewicz](https://en.wikipedia.org/wiki/Ladislaus_Bortkiewicz)
* [Abraham de Moivre](https://en.wikipedia.org/wiki/Abraham_de_Moivre)
* [Ronald Fisher](https://en.wikipedia.org/wiki/Ronald_Fisher)
* [Francis Galton](https://en.wikipedia.org/wiki/Francis_Galton)
* [Carl Friedrich Gauss](https://en.wikipedia.org/wiki/Carl_Friedrich_Gauss)
* [Pierre-Simon Laplace](https://en.wikipedia.org/wiki/Pierre-Simon_Laplace)
* [Blaise Pascal](https://en.wikipedia.org/wiki/Blaise_Pascal)
* [Karl Pearson](https://en.wikipedia.org/wiki/Karl_Pearson)
* [Siméon Denis Poisson](https://en.wikipedia.org/wiki/Siméon_Denis_Poisson)

Additionally, here is the link to the [quincunx simulation](http://goo.gl/qKUTsx) we talked about in class!
