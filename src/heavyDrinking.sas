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
%macro heavyDrinking;
data test;
  set cchs1516.hs1516_on_distr(keep=ont_id alc_020 dhh_age);
  select(alc_020);
    when(3,4,5,6) heavyDrinking = 1;
    when(1,2,96) heavyDrinking = 0;
    otherwise heavyDrinking = .;
  end;
  /*population exclusions*/
  if dhh_age < 19 then heavyDrinking = .;
run;
%mend heavyDrinking;