/* ===========================================================
 * Dummy code for Hey Fever or Nasal Allergy
 *
 * Default output var = hasNasalAllergy
 * ===========================================================
 * | Code | Description                                      |
 * | ------------------------------------------------------- |
 * | 0    | Does not have a nasal allergy                    |
 * | 1    | Has a nasal allergy                              |
 * | .    | Required info is missing                         |
 * |=========================================================|
 *
 * Population exclusions
 * =====================
 * None
 *
 * ===========================================================
 */
%macro heyFeverNasalAllergy(
  out=hasNasalAllergy,
  cchs_data=,
  demographics=,
);
%local out cchs_data demographics;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id ccc_180 &demographics);
    select(ccc_180);
      when(1) hasNasalAllergy = 1;
      when(2) hasNasalAllergy = 0;
      when(6) hasNasalAllergy = 0;
      otherwise hasNasalAllergy = .;
    end;
  /*Population exclusions*/
  run;
%mend heyFeverNasalAllergy;
