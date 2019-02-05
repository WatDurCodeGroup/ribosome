/* ===========================================
 * Dummy code for Underage drinking
 *
 * Default output var = underage
 * ===========================================
 * | Code | Description                      |
 * | --------------------------------------- |
 * | 1    | Comsumed alcohol in the last     |
 * |      | year                             |
 * | 0    | Did not consume alcohol in the   |
 * |      | last year                        |
 * |      |                                  |
 * | .    | Required info is missing         |
 * |=========================================| 
 *
 * Population exclusions
 * =====================
 * Respondents over 19 -- dhh_age >= 19
 *
 * ==============================================
 */
%macro underageDrinking(out=underageDrinking,
                        cchs_data=,
                        demographics=);
%local out cchs_data demographics;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id alc_010 dhh_age &demographics);
    select(alc_010);
      when(1) underage = 1;
      when(2,6) underage = 0;
      otherwise underage = .;
    end;
    if dhh_age >= 19 then do;
      underage = .;
      exclude = 1;
    end;
  run;
%mend underageDrinking;
