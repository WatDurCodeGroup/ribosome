%macro validate(data=,include=);
%local data include;
/*********************************************************/
/*   Parameter validation                         */
/*********************************************************/
/*parameter validation -- input dataset */
%if %length(&data)=0 %then %do;
   %let _varflag=E;
   %let _varmsg= A dataset name is required for parameter OUT!;
   %goto err_exit;
%end;
%else %do;
   %let _dsid=%sysfunc(exist(&data,data)); /* check that &data exists */
   %if &_dsid=0 %then %do;
      %let _varflag=E;
      %let _varmsg= The dataset &data does not exist!;
      %goto err_exit;
   %end;
%end;

/* parameter validation -- demographic variables */
/*Loop through each demographic variable*/
%if %length(&include) ne 0 %then %do;
  %let _dsid=%sysfunc(open(&data)); /* DATA parameter from macro definition */
  %local count this_var;
  %let count=1;
  %let this_var = %qscan(&include,&count,%str( ));
  %do %while(&this_var ne);
    %let _varnum=%sysfunc(varnum(&_dsid,&this_var)); 
    %if &_varnum=0 %then %do; /* variable not found -- throw warning */
       %let _varflag=E;
       %let _varmsg= The variable &this_var does not exits in the dataset &data.!;
       %goto err_exit;
    %end;
    %let count = %eval(&count+1);
    %let this_var = %qscan(&demographics,&count,%str( ));
  %end;
%end;
%goto clean_exit;

%err_exit:
   /* Print the errors to the log */
   %put ====================================================;
   %put The following error occurred while running the macro:;
   %put &_varmsg;
   %put;
   %put Please review input and try again.;
   %put;
   %put The macro will stop execution.;
   %put ====================================================;
   /* When an error is encountered, stop execution of program */
   %abort;
%clean_exit:
   %put ====================================================;
   %put No invalid parameters were detected.;
   %put The macro will continue dummy coding.;
   %put ====================================================;

%mend validate;