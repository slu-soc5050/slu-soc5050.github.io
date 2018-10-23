---
date: 2016-03-08T21:07:13+01:00
title: Week 12 - Bivarite Regression
weight: 31
---
![](https://img.shields.io/badge/semester-Fall%2C%202017-blue.svg) ![](https://img.shields.io/badge/release-updated-brightgreen.svg) 

## Handouts

<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-12/blob/master/Functions/week-12-r.pdf" target="_blank"> Functions </a>
<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-12/blob/master/Lab/week-12-lab.pdf" target="_blank"> Lab </a>
<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-12/blob/master/LaTeX/week-12-latex.pdf" target="_blank"> LaTeX </a>
<a class="btn btn-primary btn-outline btn-xs{{end}}" href="https://github.com/slu-soc5050/Week-12/blob/master/PS-09/ps-09.pdf" target="_blank"> PS-09 </a>

## Lecture Slides
{{< speakerdeck f870f78829704a1eb67e01eb26f58cbe >}}

## Some Example Code for Class

<script data-gist-id="f4fcfbe4eaa4dc495bfad2402301f5b5"></script>

## More on Plots
### Line Breaks in Plot Text
We discussed this informally in class, and I wanted to clarify the technique for adding line breaks here. In situations where the size of the text has been increased or the quantity of text is quite large (a lengthy caption, for example), it is easy for the text to run off the sides of the plot. You can force a line break in text within `ggplot2` using the `\n` operator:

```
library(ggplot2)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = as.factor(cyl)), size = 2, position = "jitter") +
  geom_smooth(method = "lm") +
  labs(
    title = "Fuel Efficiency and Engine Size \nof Consumer Automobiles",
    subtitle = "Select Vehicles Sold in the United States",
    x = "Engine Displacement (litres)",
    y = "Highway Fuel Efficiency (mpg)"
  )
```
![image](/images/week-12-image01.png)

This example clearly does not call for the line break, since the text would not have run off the side of the plot. Adding the break here therefore only serves to sacrifice the amount of space that can be dedicated to the data themselves because it shrinks the available real estate for the main portion of the plot. 

### Changing the Color Palette
A question was asked this week about changing `ggplot2`'s default colors. With simple plots, I do not advocate selecting your own colors. Instead, I want to point you towards a `R` package called `RColorBrewer` that can help you naviagte this process. You'll need to download and install it on your own. Once you have loaded it with the `library()` function, you can display all of the available palettes with the following function:

```
display.brewer.all()
```
![image](/images/week-12-image02.png)

There are three groups of palettes. The first group are all color ramps that go from light to dark. These are for use with continuous data. The second group, beginning with `Set3` are qualitative palettes that are designed to be used with discrete data. The third group, beginning with `Spectral`, are divergent color ramps that are designed to be used with continuous data that have a defined midpoint (such as a mean of 0) where highlight more extreme values above or below the midpoint is advantageous. For the plots in this class, we *typically* want to use one of the qualitative palettes in the middle.

We can add a palette to our plot with the `scale_color_brewer()` function. At a minimum, we need to specify the palette we want to draw from. The palette name comes from the image above, obtained using `display.brewer.all()`:

```
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = as.factor(cyl)), size = 2, position = "jitter") +
  geom_smooth(method = "lm") +
  labs(
    title = "Fuel Efficiency and Engine Size",
    subtitle = "Select Vehicles Sold in the United States",
    x = "Engine Displacement (litres)",
    y = "Highway Fuel Efficiency (mpg)"
  ) +
  scale_color_brewer(palette = "Dark2")
```
![image](/images/week-12-image03.png)

This plot uses a nice selection of darker hues that I find particularly pleasing. Keen observers will note, now, that the linear model line no longer goes well with our plot design - the blue is too bright. The `Dark2` palette has eight colors in it (there are eight boxes displayed using `display.brewer.all()`), and the first four colors are automatically selected to inclusion in the plot to color the points. We could therefore select the fifth color for the linear model. We can get the color's hex value using the `brewer.pal()` function:

```
> brewer.pal(5, name = "Dark2")
[1] "#1B9E77" "#D95F02" "#7570B3" "#E7298A" "#66A61E"
```

We include the number `5` to indicate that we want to see the first five of the eight colors. To see all eight hues in the palette, we would replace the `5` with an `8`. We can take the fifth reported hex value (`#66A61E`) and add it to the `geom_smooth()` function:

```
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = as.factor(cyl)), size = 2, position = "jitter") +
  geom_smooth(method = "lm", color = "#66A61E") +
  labs(
    title = "Fuel Efficiency and Engine Size",
    subtitle = "Select Vehicles Sold in the United States",
    x = "Engine Displacement (litres)",
    y = "Highway Fuel Efficiency (mpg)"
  ) +
  scale_color_brewer(palette = "Dark2")
```
![image](/images/week-12-image04.png)

The result is not the most asthetically pleasing, but the colors are consistent in tone. We could either select another single huge from one of the other color ramps in `RColorBrewer` or opt to select a similar hue using a second tool, [colorhexa](http://www.colorhexa.com). Colorhexa is a fantastic website with a wide variety of tools for selecting colors, and it is my go-to choice for making color decisions. We can look `#66A61E` on colorhexa (here is a link to [the page](http://www.colorhexa.com/66a61e)). If we scroll down to "Color Schemes with #66a61e", we see these schemes:

![image](/images/week-12-image-06.png)

I like the the blue color suggested here under the Triadic color scheme. You can hover your mouse over it to reveal the hex value, which is `#1E66A6`. You can substitute this hex value in under `geom_smooth()` to produce the following plot:

```
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = as.factor(cyl)), size = 2, position = "jitter") +
  geom_smooth(method = "lm", color = "#1E66A6") +
  labs(
    title = "Fuel Efficiency and Engine Size",
    subtitle = "Select Vehicles Sold in the United States",
    x = "Engine Displacement (litres)",
    y = "Highway Fuel Efficiency (mpg)"
  ) +
  scale_color_brewer(palette = "Dark2")
```

![image](/images/week-12-image05.png)

The selected blue is not as bright as the original blue used by `ggplot2`, and therefore fits in more consistently with the `Dark2` palette from `RColorBrewer`.

### Changing Both the Color Palette and the Legend
In class, we discussed using the `scale_color_discrete()` function to change the lenged text. If you use `scale_color_brewer()` to alter the plot's color palette, you will not be able to simultaneously call `scale_color_discrete()`. Legend labels will therefore need to be adjusted like so:

```
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = as.factor(cyl)), size = 2, position = "jitter") +
  geom_smooth(method = "lm", color = "#1E66A6") +
  labs(
    title = "Fuel Efficiency and Engine Size",
    subtitle = "Select Vehicles Sold in the United States",
    x = "Engine Displacement (litres)",
    y = "Highway Fuel Efficiency (mpg)"
  ) +
  scale_color_brewer(palette = "Dark2", labels = c("Four", "Five", "Six", "Eight"))
```

![image](/images/week-12-image07.png)

## `lm()` Independent Variables
We did not discuss how to add multiple indpendent variables into the `lm()` function this week, but you will need that skill for the problem set. To add multiple independent variables, use the `+` sign on the righthand side of the equation:

```
lm(y ~ x1+x2, data = df)
```

In PS-09, this would be used to add in both dummary logial variables.
