/* ===========================================
 * Dummy code for sunburn - 12 months
 *
 * Default output var = sunProtection
 * ===========================================
 * | Code | Description                      |
 * | --------------------------------------- |
 * | 1    | Suffered a sunburn               |
 * | 0    | Did not suffer a sunburn         |
 * | .    | Required info is missing         |
 * |=========================================| 
 *
 * Population exclusions
 * =====================
 * None
 * 
 * ==============================================
 */
%macro sunburn(out=sunburn,
               cchs_data=,
               demographics=);
%local out cchs_data demographics;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id ssb_005 &demographics);
    select(ssb_005);
      when(1) sunburn = 1;
      when(2) sunburn = 0;
      otherwise sunburn = .;
    end;
  run;
%mend sunburn;
