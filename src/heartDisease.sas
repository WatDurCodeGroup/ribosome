/* ===========================================================
 * Dummy code for heart disease
 *
 * Default output var = hasHeartDisease
 * ===========================================================
 * | Code | Description                                      |
 * | ------------------------------------------------------- |
 * | 0    | Does not have heart disease                      |
 * | 1    | Has heart disease                                |
 * | .    | Required info is missing                         |
 * |=========================================================|
 *
 * Population exclusions
 * =====================
 * None
 *
 * ===========================================================
 */
%macro heartDisease(
  out=hasHeartDisease,
  cchs_data=,
  demographics=,
);
%local out cchs_data demographics;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id ccc_085 &demographics);
    select(ccc_085);
      when(1) hasHeartDisease = 1;
      when(2) hasHeartDisease = 0;
      otherwise hasHeartDisease = .;
    end;
  /*Population exclusions*/
  run;
%mend heartDisease;
