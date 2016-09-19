---
layout: page
title: User's Guide
tagline: The Zen of Stata
tags: [Stata]
description:
---

Tim Peters, a prolific developer of the [Python](https://en.wikipedia.org/wiki/Python_(programming_language)) programming language, has authored a list of design principles for Python programming. Nearly all of these apply to writing Stata code and are worth taking to heart. I have included some comments on the majority of them below; you can see Peters’ full list on [Python’s website](https://www.python.org/doc/humor/#the-zen-of-python).

#### Beautiful is better than ugly.
As with the design of your figures, the design and execution of your code should be governed as by aesthetics as well as by functionality. When writing code for Stata, always seek out "elegant" solutions rather than solely functional ones. The same focus on "beauty" should be extended to your text itself. Make sure to use ample white space in your do-files and wrap your text (when possible) to eighty characters. See also *Readability counts* below.

#### Explicit is better than implicit.
Whenever possible, make sure you fully spell out commands and options in your Stata code. Provide ample comments about the decisions you are making for both data cleaning and statistical analyses. If there is something that is vague or ambiguous in your code, it will be much more difficult to return to a project in six months or a year.

#### Simple is better than complex.
Researchers often have a preference for simplicity. This is sometimes expressed as [“Occam’s Razor”](https://en.wikipedia.org/wiki/Occam%27s_razor) - among competing hypotheses, the one with the fewest assumptions should be selected. We can extend that to writing code - among competing approaches, the simplest approach should be the most desirable.

#### Complex is better than complicated.
While we should always strive for the simplest approach to data analysis, the reality is that we are often dealing with complex phenomena. Remember, however, that there is an important difference between *complex* and *complicated*. By carefully proceeding step-by-step through a complex set of analyses, and documenting our work clearly, we can avoid a complicated solution to a problem. I find it useful to (a) create a visual map of a complex problem on a whiteboard, (b) break a problem down into its smallest possible elements, and (c) explain the proposed solution to someone - if you can successfully do this, it *may* be a good idea.

#### Flat is better than nested.
This pearl of wisdom has two meanings for our purposes. The first involves sub-files in a set of do-files (a “stack”) that are executed by a master do-file. Avoid do-file stacks that have multiple levels of sub-files. In other words, a sub-file called by `master.do` should not call further sub-files.

We will learn how to automate our work using the command `foreach`. These "loops" can reduce the amount of code needed to execute a complex set of tasks, but also make your code harder to read. Flat code, that does not include these nested loops, is always preferable unless using command significantly reduces the amount of code you need to write or allows you to solve a problem in the *most* efficient way. In other words, just because you can use a loop doesn’t mean you should.

#### Sparse is better than dense.
Do-files that are sparsely written are easier to read. I encourage you to use as much white-space as necessary in your do-files. Lines that are "empty" (only contain a carriage return) will be automatically skipped by Stata without error, so there is no reason not to include them.

#### Readability counts.
This builds off the previous item - white-space makes your files easier to read. So does “text wrapping” - limiting your output and do-files to 80 characters. You can use a simple trick in Stata to “hard wrap” lines of code that are longer than 80 characters. Including `///` at the end of a line will cause Stata to assume that the *next* line is a continuation of the previous command:

```Stata
// ==========================================================================

// list key independent variable names and labels
describe var1 var2 var3 var4 var5 var6 var7 var8 var9 var10 var11 ///
var12 var13 var14 var15

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// descriptive statistics for key independent variables
summarize var1 var2 var3 var4 var5 var6 var7 var8 var9 var10 var11 ///
var12 var13 var14 var15

// ==========================================================================
```

Using the in these two examples allows the use to include a long list of
variables without our line running over 80 characters. The `describe` and `summarize` commands not only include the variables listed to the right of the command (`var1` through `var11`) but also the variables listed on the next line (`var12` through `var15`).

The above example also includes text dividers to segregate a particular line of code. I use these liberally. I will separate major divisions in a do-file with equal signs and minor divisions with addition signs. Note that these dividers must be preceded by a comment symbol .

The comment symbol can also be used to make quick annotations in a do-file. Comments can be limited only to a single line (proceed your comment with `//`) or can extend for multiple lines by wrapping your text in `/*` at the beginning and `*/` at the end:

```stata
// This is a single line comment.

/*
This is a
multi
line
comment.
*/
```

#### Special cases aren’t special enough to break the rules.
If your first inclination is that whatever you are working on goes against much of the advice laid out here, it is time to hit the pause button and reassess your plan.

#### Although practicality beats purity.
That said, there may be times when, for example, nested really is just better than flat in practical sense. I have on occasion used loops nested within loops in Stata. That does not mean that they are generally the best possible solution to a problem. If all else fails, and hitting the pause button does not reveal a more practical solution, *practicality beats purity*.

#### There should be one - and preferably only one - obvious way to do it.
This can be hard to navigate, particularly when you are new to Stata's approach to data analysis. I see this as a point that reinforces the notion that *simple is better than complex*. The obvious way to do something should (almost) always be the simplest way to do something. Now of course this isn't always the case, and the simplest way to do something may not always be obvious when you are learning. When problem solving, however, strive for simple solutions that, once you have them, make you think "of course that it how it should be done!"

#### If the implementation is hard to explain, it’s a bad idea.
One of the best ways to learn Stata is to do it with someone else. Having to explain your approach out loud to someone else who is (at least moderately) familiar with Stata can be instrumental in figuring out the best way to do something. If you struggle to explain something, it may be a sign that the idea or approach is not the best.

#### If the implementation is easy to explain, it may be a good idea.
On the other hand, easy to explain ideas or approaches *may* be good ideas!

----

##### [Back to User's Guide Cover Page]({{ base }}/pages/user-guide.html)
