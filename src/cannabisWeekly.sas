/* ===========================================
 * Dummy code for past year cannabis use
 * once a week or more
 *
 * Default output var = weeklyCannabis
 * ===========================================
 * | Code | Description                      |
 * | --------------------------------------- |
 * | 1    | Used daily or almost daily       |
 * | 0    | Did not use daily or almost daily|
 * | .    | Required info is missing         |
 * |=========================================| 
 *
 * ==============================================
 */
%macro cannabisWeekly(out=cannabisWeekly,
                        cchs_data=,
                        demographics=);
%local out cchs_data demographics;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id drg_015 &demographics);
    select(drg_015);
      when(3,4,5) canWeekly = 1;
      when(1,2,6) canWeekly = 0;
      otherwise canWeekly = .;
    end;
  run;
%mend cannabisWeekly;
