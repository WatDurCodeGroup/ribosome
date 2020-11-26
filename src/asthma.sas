/* ===========================================================
 * Dummy code for asthma
 *
 * Default output var = hasAsthma
 * ===========================================================
 * | Code | Description                                      |
 * | ------------------------------------------------------- |
 * | 0    | Does not have asthma                             |
 * | 1    | Has asthma                                       |
 * | .    | Required info is missing                         |
 * |=========================================================|
 *
 * Population exclusions
 * =====================
 * None
 *
 * ===========================================================
 */
%macro asthma(
  out=hasAsthma,
  cchs_data=,
  demographics=,
);
%local out cchs_data demographics excBreastfeeding;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id ccc_085 &demographics);
    select(ccc_015);
      when(1) hasAsthma = 1;
      when(2) hasAsthma = 0;
      otherwise hasHeartDisease = .;
    end;
  /*Population exclusions*/
  run;
%mend heartDisease;
