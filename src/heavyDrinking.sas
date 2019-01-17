/* ===========================================
 * Dummy code for Heavy Drinking
 *
 * Default output var = heavyDrinking
 * ===========================================
 * | Code | Description                      |
 * | --------------------------------------- |
 * | 1    | Had a drinking binge             |
 * | 0    | Did not have a drinking binge    |
 * | .    | Required info is missing         |
 * |=========================================| 
 *
 * Population exclusions
 * =====================
 * 1. Respondents less than 19
 * 
 * Heavy Drinking is defined according to the
 * Canadian Centre on Substance Use and Addiction
 * http://www.ccdus.ca/Eng/topics/alcohol/drinking-guidelines/Pages/default.aspx
 * ----------------------------------------------
 * 4+ on one occasion at least once a month -- Females
 * 5+ on one occasion at least once a month -- Males
 * ==============================================
 */
%macro heavyDrinking(out=heavyDrinking,
                     cchs_data=,
                     demographics=,
                     adultsOnly=true);
%local out cchs_data demographics adultsOnly;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id alc_020 dhh_age);
    select(alc_020);
      when(3,4,5,6) heavyDrinking = 1;
      when(1,2,96) heavyDrinking = 0;
      otherwise heavyDrinking = .;
    end;
    /*Population exclusions*/
%if %upcase(&adultsOnly) = TRUE %then %do;
    if dhh_age < 19 then do;
      heavyDrinking = .;
      exclude = 1;
    end;
%end;
%else %if %upcase(&adultsOnly) = FALSE %then %do;
  %put ======================================;
  %put Population exclusion was not applied;
  %put ======================================;
%end;
%else %do;
  %put ======================================;
  %put The following error occurred:;
  %put Valid options for adultsOnly are TRUE or FALSE.;
  %put Please review and try again.;
  %put The macro will stop execution.;
  %put ======================================;
  %abort;
%end;
run;
%mend heavyDrinking;
