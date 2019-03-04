/* ===========================================
 * Dummy code for Has an anxiety disorder
 *
 * Default output var = anxietyDisorder
 * ===========================================
 * | Code | Description                      |
 * | --------------------------------------- |
 * | 1    | Has an anxiety disorder          |
 * | 0    | Does not have an anxiety disorder|
 * | .    | Required info is missing         |
 * |=========================================| 
 *
 * ==============================================
 */
%macro anxietyDisorder(out=anxietyDisorder,
                       cchs_data=,
                       demographics=);
%local out cchs_data demographics;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id ccc_200 &demographics);
    select(ccc_200);
      when(1) anxietyDisorder = 1;
      when(2) anxietyDisorder = 0;
      otherwise anxietyDisorder = .;
    end;
  run;
%mend anxietyDisorder;