%macro mergeBootWt(out=,analysis_data=,boot_data=);
  /* Check whether we have population exclusions */
  %local rc ds hasExclude bs_msg wt_msg analysis_data boot_data out;
  %let ds = %sysfunc(open(&analysis_data));
  %let hasExclude = %sysfunc(varnum(&ds,EXCLUDE));
  %let rc = %sysfunc(close(&ds));
  %if &hasExclude ne 0 %then %do;
    %let bs_msg = A population exclusion was applied to the sample weight.;
    %let wgt_msg = Use the variable excwgt in all PROC steps related to this population.;
  %end;
  %else %do;
    %let bs_msg = No population exclusions were applied.;
    %let wgt_msg = Use the variable fwgt in all PROC steps. No addtional weight variables were created.;
  %end;

  /* Sort as a precaution */
  proc sort data=&analysis_data;
    by ont_id;
  run;
  proc sort data=&boot_data;
    by ont_id;
  run;
  /* MERGE THEM ALL!! */
  data &out;
    merge &analysis_data &boot_data;
    by ont_id;
  %if &hasExclude %then %do;
    if exclude then excwgt = .;
    else excwgt = fwgt;
  %end;
  run;
  %put ===============================;
  %put &bs_msg;
  %put &wgt_msg;
  %put ===============================;
%mend mergeBootWt;