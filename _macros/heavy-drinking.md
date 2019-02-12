---
published: true
layout: "theme-base/macro-doc"
title: Ribosome - Syntax files for CCHS estimation
name: "%heavyDrinking"
category: macros
order: 2
language: en
altLangPrefix: documentation
dateModified: "2019-01-31"
description: "An open community initative for standardized analysis"
---

Idenfity respondents that had a heavy drinking episode at least once a month in the past year.

### Syntax
```
%heavyDrinking(out=lowRiskDrinking, cchs_data=<data-set>, demographics=<var-list>, adultsOnly=true|false)
```

### Arguments
+ `out = heavyDrinking` names the output dataset that will contain the dummy coding. Defaults to *heavyDrinking*.
+ `cchs_data = <data-set>` names the input dataset containing the variables to be processed. Typically this will be the main <abbr title="Canadian Community Health Survey">CCHS</abbr> dataset.
+ `demographics = var-list` a space-seperated list of variables to copy from the input data set. Use this arguement to select variables of interest for crosstabulation tables.
+ `adultsOnly = true|false` determines whether respondents less than 19 are excluded from the analysis. Defaults to `TRUE`.

### Outputs
+ `heavyDrinking` a numeric variable that contains the dummy coding.
+ `exclude` a numeric variable that indicates a population exclusion. **Note** this variable is created only when `adultsOnly = true`.

### Details
The `%heavyDrinking` macro returns a one (`1`) for respondents that had a heavy drinking episode and zero (`0`) for those that do not. Population exclusions, if applied, and respondents who refused to answer or with unkown information are assigned a `null` value.

A heavy drinking episode is defined as:
+ 5 or more drinks on one occasion for men.
+ 4 or more drinks on one occasion for women.
