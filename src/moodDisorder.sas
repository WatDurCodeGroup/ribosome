/* ===========================================
 * Dummy code for Has a mood disorder
 *
 * Default output var = moodDisorder
 * ===========================================
 * | Code | Description                      |
 * | --------------------------------------- |
 * | 1    | Has a mood disorder              |
 * | 0    | Does not have a mood disorder    |
 * | .    | Required info is missing         |
 * |=========================================| 
 *
 * ==============================================
 */
%macro moodDisorder(out=moodDisorder,
                    cchs_data=,
                    demographics=);
%local out cchs_data demographics;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id ccc_195 &demographics);
    select(ccc_195);
      when(1) moodDisorder = 1;
      when(2) moodDisorder = 0;
      otherwise moodDisorder = .;
    end;
  run;
%mend moodDisorder;