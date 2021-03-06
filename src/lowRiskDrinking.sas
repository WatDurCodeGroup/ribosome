/* ===========================================
 * Dummy code for Canadian Low-Risk Drinking Guidelines
 *
 * Default output var = lowRiskDrinking
 * ===========================================
 * | Code | Description                      |
 * | --------------------------------------- |
 * | 1    | Drinks according to LRDG         |
 * | 0    | Does not drink according to LRDG |
 * | .    | Required info is missing         |
 * |=========================================| 
 *
 * Population exclusions
 * =====================
 * 1. Respondents less than 19
 * 
 * Low-risk drinking is defined according to the
 * Canadian Centre on Substance Use and Addiction
 * http://www.ccdus.ca/Eng/topics/alcohol/drinking-guidelines/Pages/default.aspx
 * ----------------------------------------------
 * 11+ per week or 3+ per day -- Females
 * 16+ per week or 4+ per day  -- Males
 * ==============================================
 */
%macro lowRiskDrinking(out=lowRiskDrinking,
                       cchs_data=,
                       demographics=,
                       adultsOnly=true);
%local out cchs_data demographics adultsOnly;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id doalw alc_005 alc_010 alw: dhh_age dhh_sex &demographics);
  /* Fix an error in the original data -- see 2016 CCHS Errata */
    if DOALW = 2 then ALWDVLTR = 6;
    else if ALC_005 = 2 then ALWDVLTR = 6;
    else if ALC_005 IN (7, 8, 9) or
            ALC_010 IN (7, 8, 9) or
            ALW_005 IN (7, 8, 9) or
            ALW_010 IN (997, 998, 999) or
            ALW_015 IN (997, 998, 999) or
            ALW_020 IN (997, 998, 999) or
            ALW_025 IN (997, 998, 999) or
            ALW_030 IN (997, 998, 999) or
            ALW_035 IN (997, 998, 999) or
            ALW_040 IN (997, 998, 999) then ALWDVLTR = 9;
    else if (DHH_SEX = 1 and 
              (ALW_010 in (4:995) or
               ALW_015 in (4:995) or
               ALW_020 in (4:995) or
               ALW_025 in (4:995) or
               ALW_030 in (4:995) or
               ALW_035 in (4:995) or
               ALW_040 in (4:995) or
               ALWDVWKY in (16:995))) OR
            (DHH_SEX = 2 and
               (ALW_010 in (3:995) or
                ALW_015 in (3:995) or
                ALW_020 in (3:995) or
                ALW_025 in (3:995) or
                ALW_030 in (3:995) or
                ALW_035 in (3:995) or
                ALW_040 in (3:995) or
                ALWDVWKY in (11:995))) then ALWDVLTR = 1;
    else if (ALW_005 = 2 or ALC_010 = 2 or
              (DHH_SEX = 1 and
                ALW_010 =< 3 and
                ALW_015 =< 3 and
                ALW_020 =< 3 and
                ALW_025 =< 3 and
                ALW_030 =< 3 and
                ALW_035 =< 3 and
                ALW_040 =< 3 and
                ALWDVWKY <= 15)) OR
              (DHH_SEX = 2 and
                ALW_010 =< 2 and
                ALW_015 =< 2 and
                ALW_020 =< 2 and
                ALW_025 =< 2 and
                ALW_030 =< 2 and
                ALW_035 =< 2 and
                ALW_040 =< 2 and
                ALWDVWKY <= 10) then ALWDVLTR = 2;
    select(alwdvltr);
      when(1) lowRiskDrinking = 0;
      when(2,6) lowRiskDrinking = 1;
      when(9) lowRiskDrinking = .;
    end;
    /*Population exclusions*/
%if %upcase(&adultsOnly) = TRUE %then %do;
    if dhh_age < 19 then do;
      lowRiskDrinking = .;
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
%mend lowRiskDrinking;