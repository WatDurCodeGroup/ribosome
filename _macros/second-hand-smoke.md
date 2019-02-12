---
published: true
layout: "theme-base/macro-doc"
title: Ribosome - Syntax files for CCHS estimation
name: "%secondHandSmoke"
category: macros
order: 3
language: en
altLangPrefix: documentation
dateModified: "2019-01-31"
description: "An open community initative for standardized analysis"
---

Idenfity respondents that were exposed to envrionmental tobacco smoke.

### Syntax
```
%secondHandSmoke(out=lowRiskDrinking, cchs_data=<data-set>, demographics=<var-list>, nonSmokersOnly=true|false)
```

### Arguments
+ `out = secondHandSmoke` names the output dataset that will contain the dummy coding. Defaults to *secondHandSmoke*.
+ `cchs_data = <data-set>` names the input dataset containing the variables to be processed. Typically this will be the main <abbr title="Canadian Community Health Survey">CCHS</abbr> dataset.
+ `demographics = var-list` a space-seperated list of variables to copy from the input data set. Use this arguement to select variables of interest for crosstabulation tables.
+ `nonSmokersOnly = true|false` determines whether respondents that indicated they did not smoke are excluded from the analysis. Defaults to `TRUE`.

### Outputs
+ `etsAny` a numeric variable that contains the dummy coding for exposure to any of `etsPublic`, `etsVehicle`, or `etsWork`.
+ `etsPublic` a numeric variable that contains the dummy coding for exposure to envrionmental tobacco smoke in public places.
+ `etsVehicle` a numeric variable that contains the dummy coding for exposure to envrionmental tobacco smoke in a private vehicle.
+ `etsWork` a numeric variable that contains the dummy coding for exposure to envrionmental tobacco smoke in the workplace, or at school.
+ `exclude` a numeric variable that indicates a population exclusion. **Note** this variable is created only when `nonSmokersOnly = true`.

### Details
The `%secondHandSmoke` macro returns a one (`1`) for respondents that were exposed to envrionmental tobacco smoke and zero (`0`) for those that were not. Population exclusions, if applied, and respondents who refused to answer or with unkown information are assigned a `null` value.

A heavy drinking episode is defined as:
+ 5 or more drinks on one occasion for men.
+ 4 or more drinks on one occasion for women.
