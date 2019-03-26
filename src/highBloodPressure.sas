/* ===========================================
 * Dummy code for has high blood pressure
 *
 * Default output var = highBloodPressure
 * ===========================================
 * | Code | Description                      |
 * | --------------------------------------- |
 * | 1    | Has high blood pressure          |
 * | 0    | Does not have high blood pressure|
 * | .    | Required info is missing         |
 * |=========================================| 
 *
 * ==============================================
 */
%macro highBloodPressure(out=highBloodPressure,
                         cchs_data=,
                         demographics=);
%local out cchs_data demographics;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id ccc_065 &demographics);
    select(ccc_065);
      when(1) highBloodPressure = 1;
      when(2) highBloodPressure = 0;
      otherwise highBloodPressure = .;
    end;
  run;
%mend highBloodPressure;