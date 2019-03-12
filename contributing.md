---
published: true
layout: "theme-base/default"
permalink: "contributing/"
title: "Contributing: Ribosome - Syntax files for CCHS estimation"
language: en
altLangPrefix: index
dateModified: "2019-02-12"
description: "An open community initative for standardized analysis"
languagetoggle: "false"
sitesearch: "false"
breadcrumb: "false"
---

<div class="container">

<div class="row">

<div class="col-xs-12" markdown="1">

## How to contribute
Thank you for taking the time to read this page. The success of this project requires a strong community of crontributors, such as yourself, and we greatly appreciate your interest in this work.

To get started, here's some resources:
+ Check out the [Ribosome project website](https://watdurcodegroup.github.io/ribosome/) for a high-level overview of what we're doing
+ The [issues section](https://github.com/WatDurCodeGroup/ribosome/issues) of the repository is were project discussions take place

### Testing
We don't have any specific to test our macros, but we do quality check output data with `proc freq` tables. Please write a frequency table step for all new macros you create.

### Submitting changes
Please create a [GitHub Pull Request to Ribosome](https://github.com/WatDurCodeGroup/ribosome/compare) with a description of the changes you made. We will be greatful if you include your frequency table example. Please limit your commit to one feature, whenever possible. Also, we would love it if you follow the coding conventions listed below.

Read more about [GitHub Pull Requests](https://help.github.com/en/articles/about-pull-requests).

Finally, please write clear and descriptive log messages for your commits. Single line messages are OK for small changes, but larger changes should be detailed. Something like this:
```
$ git commit -m "A breif summary of the large change
>
> A paragraph with a description of the change and why this is needed."
```

### Coding conventions
Have a look at the code to get an idea of the style. Our code is written for readability.
Some specifics:
+ Indent using two spaces
+ Use a space between list items and parameter lists `in( x, y, z )` not `in(x,y,z)`, and around operators `k = k + 1` not `k=k+1`
+ _N.B._ ths is an open community and someone, at some point, may need to read your code. Please be considerate of others.

Many thanks!

Cheers!

</div>

</div>

</div>
