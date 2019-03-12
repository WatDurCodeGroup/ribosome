---
published: true
layout: "theme-base/documentation"
name: "Getting started"
category: documentation
order: 1
title: "Getting Started - Ribosome: Syntax files for CCHS estimation"
language: en
altLangPrefix: documentation
dateModified: "2019-01-23"
description: "An open community initative for standardized analysis"
languagetoggle: "false"
sitesearch: "false"
breadcrumb: "false"
---

## Getting started
Ribosome is a flat-file collection of macros that are run with [SAS](https://sas.com). Ribosome works best with SAS version `>=9.4`.

If you don't have SAS installed on your system, you can download a free copy of [SAS University Edition](https://www.sas.com/en_us/software/university-edition.html) for non-commercial use.

If you're already set up with SAS and are looking for a reference, please have a look at our [examples](#).

### Downloading the macros
Before you can work with the macros, you need to fetch the files form the repository. 

```
filename foo url "https://raw.githubusercontent.com/WatDurCodeGroup/ribosome/master/dist/main.min.sas";
```

This will put the macros into a file reference named `foo` that you can bring into your SAS session.

**Note** that running the `filename` statement above does not make the macros accessible to SAS  automatically. The job of the `filename` statement is to create the connection to the file containing the macros. This allows you to reference multiple versions of Ribosome at the same time.

### Including the macros
Assuming that you successfully created a file reference to `foo`, as written above, you can now bring the macros into your SAS session.

```
%include foo;
```

<div class="panel panel-warning">
  <header class="panel-heading">   
  <i data-fa-symbol="magic" class="fas fa-magic"></i>
  <h5 class="panel-title"><svg class="icon-inline"><use xlink:href="#magic"></use></svg> Pro tip</h5>
  </header>
  <div class="panel-body">
    <p>You can tell SAS to write the contents of <code>foo</code> to the log using <code>&#37;include foo / source2;</code>.</p>
  </div>
</div>

That's it! You're now ready to call up the macros and start dummy coding!

### Further reading
+ The [macro documentation](#) contains an full description of each macro, it's parameters, and outputs.
+ Check out our [examples](#) for details on setting up your program.

<small>Find an error on this page? Please <a href="https://github.com/WatDurCodeGroup/ribosome/issues" title="File and issue on Github">file an issue</a>.</small>

