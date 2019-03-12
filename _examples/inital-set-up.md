---
published: true
layout: "theme-base/documentation"
name: "Inital set up"
category: examples
order: 1
title: "Inital Set Up - Ribosome: Syntax files for CCHS estimation"
language: en
altLangPrefix: documentation
dateModified: "2019-01-23"
description: "An open community initative for standardized analysis"
languagetoggle: "false"
sitesearch: "false"
breadcrumb: "false"
---

## Introduction
This example shows you the process of setting up Ribosome for the first time. There's two jobs that need doing here:
1. Connect to the syntax
2. Load the syntax

### Code
```
/* 1. Connect to the syntax */
filename ribo url "https://raw.githubusercontent.com/WatDurCodeGroup/ribosome/master/dist/main.min.sas";
/* 2. Pull syntax into the current program */
%include ribo / source2;
```
### Details
Step one above downloads the syntax from Github and assigns the result to a file reference named `ribo`.

Step two tells `SAS` to process the contents of `ribo`. This makes the macros you downloaded in step one available for use. The `source2` option writes the contents of `ribo` to the log.

### Further reading
+ Getting started guide
+ Macro documentation
