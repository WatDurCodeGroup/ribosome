/* ===========================================
 * Dummy code for sleep duration
 *
 * Default output var = sleepSevenHours
 * ===========================================
 * | Code | Description                      |
 * | --------------------------------------- |
 * | 1    | >= 7 hours of sleep daily        |
 * | 0    | < 7 hours of sleep daily         |
 * | .    | Required info is missing         |
 * |=========================================| 
 *
 * Population exclusions
 * =====================
 * Adults -- Respondents with dhh_age >= 18 years
 * 
 * ==============================================
 */
%macro sleepSevenHours(out=sleepSevenHours,
               cchs_data=,
               demographics=,
               adultsOnly=true);
%local out cchs_data demographics;
  /*Parameter validation*/
  %validate( data=&cchs_data, include=&demographics )
  data &out;
    set &cchs_data.( keep=ont_id dhh_age slp_005 &demographics );
    select( slp_005 );
      when( 1, 2, 3, 4, 5, 6 ) sleepSevenHours = 0;
      when( 7, 8, 9, 10, 11, 12 ) sleepSevenHours = 1;
      otherwise sleepSevenHours = .;
    end;
    /*Population exclusions*/
%if %upcase(&adultsOnly) = TRUE %then %do;
    if dhh_age < 18 then do;
      sleepSevenHours = .;
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
%mend sleepSevenHours;
