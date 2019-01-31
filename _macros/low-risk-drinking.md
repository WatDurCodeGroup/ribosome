---
published: true
layout: "theme-base/macro-doc"
title: Ribosome - Syntax files for CCHS estimation
name: "%lowRiskDrinking"
category: macros
order: 1
language: en
altLangPrefix: documentation
dateModified: "2019-01-31"
description: "An open community initative for standardized analysis"
download: "false"
---

Idenfity respondents at no increased long-term health risk, according to the Canadian Low-Risk Drinking Guidelines: Guideline 2

### Syntax
```
%lowRiskDrinking(out=lowRiskDrinking, cchs_data=<data-set>, demographics=<var-list>, adultsOnly=true|false)
```

### Arguments
+ `out = lowRiskDrinking` names the output dataset that will contain the dummy coding. Defaults to *lowRiskDrinking*.
+ `cchs_data = <data-set>` names the input dataset containing the variables to be processed. Typically this will be the main <abbr title="Canadian Community Health Survey">CCHS</abbr> dataset.
+ `demographics = var-list` a space-seperated list of variables to copy from the input data set. Use this arguement to select variables of interest for crosstabulation tables.
+ `adultsOnly = true|false` determines whether respondents less than 19 are excluded from the analysis. Defaults to `TRUE`.

### Outputs
+ `lowRiskDrinking` a numeric variable that contains the dummy coding.
+ `exclude` a numeric variable that indicates a population exclusion. **Note** this variable is created only when `adultsOnly = true`.

### Details
The `%lowRiskDrinking` macro returns a one (`1`) for respondents that follow Guideline 2 of the Canadian-Low-Risk Guidelines and zero (`0`) for those that do not. Population exclusions, if applied, and respondents who refused to answer or with unkown information are assigned a `null` value.

*Definition of Low-Risk Drinking*

The Canadian Centre on Substance Use and Addiction publish five recommendations that together make up the Canadian Low-Risk Drinking Guidelines. Guideline 2 is used to classifiy drinkers based on their risk for long-term health effects.

The guideline recommends:
+ 10 drinks a week for women, with no more than 2 drinks a day most days.
+ 15 drinks a week for men, with no more than 3 drinks a day most days.
