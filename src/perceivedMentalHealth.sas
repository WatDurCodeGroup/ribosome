/* ===========================================
 * Dummy code for perceived mental health
 *
 * Default output var = perceivedMentalHealth
 * ===========================================
 * | Code | Description                      |
 * | --------------------------------------- |
 * | 1    | Excellent or Very good           |
 * | 0    | Good, Fair, or Poor              |
 * | .    | Required info is missing         |
 * |=========================================| 
 *
 * ==============================================
 */
%macro perceivedMentalHealth(out=perceivedMentalHealth,
                             cchs_data=,
                             demographics=);
%local out cchs_data demographics;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id gen_015 &demographics);
    select(gen_015);
      when(1,2) perceivedMentalHealth = 1;
      when(3,4,5) perceivedMentalHealth = 0;
      otherwise perceivedMentalHealth = .;
    end;
  run;
%mend perceivedMentalHealth;