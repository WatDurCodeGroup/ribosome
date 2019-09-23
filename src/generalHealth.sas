/* ===========================================
 * Dummy code for General health
 *
 * Default output var = generalHealth
 * ===========================================
 * | Code | Description                      |
 * | --------------------------------------- |
 * | 1    | Very Good or Excellent           |
 * | 0    | Good, Fair, or Poor              |
 * | .    | Required info is missing         |
 * |=========================================| 
 *
 * Population exclusions
 * =====================
 * None
 * 
 * ----------------------------------------------
 * 
 * ==============================================
 */
%macro generalHealth(out=generalHealth,
                     cchs_data=,
                     demographics=);
%local out cchs_data demographics;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id GENDVHDI dhh_age &demographics);
    select(GENDVHDI);
      when(3,4) generalHealth = 1;
      when(0,1,2) generalHealth = 0;
      otherwise generalHealth = .;
    end;
run;
%mend generalHealth;
