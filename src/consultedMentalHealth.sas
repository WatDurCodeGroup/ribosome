/* ===========================================
 * Dummy code for consultations with a mental
 * health professional
 *
 * Default output var = consultedMentalHealth
 * ===========================================
 * | Code | Description                      |
 * | --------------------------------------- |
 * | 1    | Saw a professional about MH      |
 * | 0    | Did not see a professional       |
 * | .    | Required info is missing         |
 * |=========================================| 
 *
 * Population exclusions
 * =====================
 * None
 * 
 * ==============================================
 */
%macro consultedMentalHealth(out=consultedMentalHealth,
                             cchs_data=,
                             demographics=);
%local out cchs_data demographics;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id cmh_005 &demographics);
    select(cmh_005);
      when(1) consultedMentalHealth = 1;
      when(1,2,6) consultedMentalHealth = 0;
      otherwise consultedMentalHealth = .;
    end;
  run;
%mend consultedMentalHealth;
