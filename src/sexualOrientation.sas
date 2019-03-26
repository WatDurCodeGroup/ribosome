/* ==========================================================
 * Dummy code for sexual orientation
 *
 * Default output var = sexualOrientation
 * ==========================================================
 * | Code | Description                                     |
 * | -------------------------------------------------------|
 * | 0    | Heterosexual                                    |
 * | 1    | Homosexual                                      |
 * | 2    | Bisexual                                        |
 * | .    | Population exclusion or required info is missing|
 * |========================================================| 
 *
 * Population exclusions
 * =====================
 * 1. Respondents under the age of 15
 *
 * ==========================================================
 */
%macro sexualOrientation(out=sexualOrientation,
                          cchs_data=,
                          demographics=);
%local out cchs_data demographics;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id sdc_035 &demographics);
    select(sdc_035);
      when(1) sexualOrientation = 0;
      when(2) sexualOrientation = 1;
	  when(3) sexualOrientation = 2;
      otherwise sexualOrientation = .;
    end;
  run;
%mend sexualOrientation;