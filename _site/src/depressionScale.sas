/* ===========================================
 * Dummy code for consultations Patient Health
 * Questionnaire (PHQ-9) depression scale
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
%macro depressionScale(out=depressionScale,
                       cchs_data=,
                       demographics=);
%local out cchs_data demographics;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id depdvsev &demographics);
    select(depdvsev);
      when(0,1) depression = 0;
      when(2,3,4,5) depression = 1;
      otherwise depression = .;
    end;
  run;
%mend depressionScale;
