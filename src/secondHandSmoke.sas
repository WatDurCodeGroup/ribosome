/* ===========================================
 * Dummy code for second-hand smoke exposure
 *
 * Default output var = [ etsWork, etsVehicle, etsPublic, etsAny ]
 * ===========================================
 * | Code | Description                      |
 * | --------------------------------------- |
 * | 1    | Exposed to second-hand smoke     |
 * |      | almost everyday                  |
 * | 0    | Not exposed                      |
 * | .    | Required info is missing         |
 * |=========================================| 
 *
 * Population exclusions
 * =====================
 * 1. Respondents who identfy as smokers
 * 
 * ----------------------------------------------
 * This indicator is a combination of exposure at 
 * work/home; in public; in a private vehicle
 * ==============================================
 */
%macro secondHandSmoke(out=secondHandSmoke,
                     cchs_data=,
                     demographics=,
                     nonSmokersOnly=TRUE);
%local out cchs_data demographics nonSmokersOnly;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id adm_prx smk_005 mac_005--mac_015 ets_005 ets_030--ets_040 &demographics);
    /*fix an error in the coding*/
    if mac_005 not in(1,2) and mac_010 ne 1 then ets_030 = 6;
    if mac_005 ne 4 and mac_015 ne 1 then ets_030 = 6;
    if adm_prx = 1 and smk_005 = 1 then do;
      ets_030 = 6;
      ets_035 = 6;
      ets_040 = 6;
    end;
    /* exposure dummy codes */
    select(ets_030);
      when(1) etsWorkSchool = 1;
      when(2,6) etsWorkSchool = 0;
      otherwise etsWorkSchool = .;
    end;
    select(ets_035);
      when(1) etsPublic = 1;
      when(2,6) etsPublic = 0;
      otherwise etsPublic = .;
    end;
    select(ets_040);
      when(1) etsVehicle = 1;
      when(2,6) etsVehicle = 0;
      otherwise etsVehicle = .;
    end;
    if etsWorkSchool = 1 or etsVehicle = 1 or etsPublic = 1 then etsAny = 1;
    else if etsWorkSchool = . and etsVehicle = . and etsPublic = . then etsAny = .;
    else etsAny = 0;
    /*Population exclusions*/
%if %upcase(&nonSmokersOnly) = TRUE %then %do;
    if smk_005 = 1 then do;
      etsWorkSchool = .;
      etsVehicle = .;
      etsPublic = .;
      etsAny = .;
      exclude = 1;
    end;
%end;
%else %if %upcase(&nonSmokersOnly) = FALSE %then %do;
  %put ======================================;
  %put Population exclusion was not applied;
  %put ======================================;
%end;
%else %do;
  %put ======================================;
  %put The following error occurred:;
  %put Valid options for nonSmokersOnly are TRUE or FALSE.;
  %put Please review and try again.;
  %put The macro will stop execution.;
  %put ======================================;
  %abort;
%end;
run;
%mend secondHandSmoke;
