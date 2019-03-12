---
published: true
layout: "theme-base/documentation"
name: "Create an indicator"
category: examples
order: 2
title: "Create and indicator - Ribosome: Syntax files for CCHS estimation"
language: en
altLangPrefix: documentation
dateModified: "2019-01-23"
description: "An open community initative for standardized analysis"
languagetoggle: "false"
sitesearch: "false"
breadcrumb: "false"
---

## Introduction
This example shows you how to create indicator dummy codes. A couple of things to note here:
1. Calling the correct macro
2. Setting correct parameter values

### Code
```
filename ribo url "https://raw.githubusercontent.com/WatDurCodeGroup/ribosome/master/dist/main.min.sas";
%include ribo / source2;

/* 1. Call the correct macro | 2. Set correct parameters */
%heavyDrinking(out=lowRiskDrinking, cchs_data=MyCCHSdata, demographics=dhh_sex geodvhr4, adultsOnly=true)

```
### Details
Lines one and two in the example above are described previously. Line four calls the macro (`%heavyDrinking`) to create an indicator for heavy drinking. Macro parmaters are named between the round brackets `(...)`. In the example above, the macro creates the output data `lowRiskDrinking`, using the source data `MyCCHSdata`. The macro will copy `dhh_sex` and `geodvhr4` from the source and limit dummy coding to adults.

### Further Reading
+ Getting started guide
+ Macro documentation
