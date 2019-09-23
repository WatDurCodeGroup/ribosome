/* ===========================================
 * Dummy code for General life satisfaction
 *
 * Default output var = satisfiedLife
 * ===========================================
 * | Code | Description                      |
 * | --------------------------------------- |
 * | 1    | Somewhat/Very satisfied          |
 * | 0    | Somewhat/Very unsatisfied        |
 * | .    | Required info is missing         |
 * |=========================================| 
 *
 * Population exclusions
 * =====================
 * None
 * 
 * ----------------------------------------------
 * Derived groupings from a 10-point scale
 * ==============================================
 */
%macro satisfiedLife(out=satisfiedLife,
                     cchs_data=,
                     demographics=);
%local out cchs_data demographics;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id GENDVSWL &demographics);
    select(GENDVSWL);
      when(1,2) satisfiedLife = 1;
      when(3,4,5) satisfiedLife = 0;
      otherwise satisfiedLife = .;
    end;
  run;
%mend satisfiedLife;
