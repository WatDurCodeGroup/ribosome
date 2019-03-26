/* =====================================================
 * Dummy code for sense of belonging to local community
 *
 * Default output var = senseBelonging
 * =====================================================
 * | Code | Description                                |
 * | ------------------------------------------------- |
 * | 1    | Very strong or Somewhat strong             |
 * | 0    | Very weak or Somewhat weak                 |
 * | .    | Required info is missing                   |
 * |===================================================| 
 *
 * =====================================================
 */
%macro senseBelonging(out=senseBelonging,
                      cchs_data=,
                      demographics=);
%local out cchs_data demographics;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id gen_030 &demographics);
    select(gen_030);
      when(1,2) senseBelonging = 1;
      when(3,4) senseBelonging = 0;
      otherwise senseBelonging = .;
    end;
  run;
%mend senseBelonging;