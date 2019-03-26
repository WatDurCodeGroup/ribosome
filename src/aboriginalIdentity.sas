/* ================================================================
 * Dummy code for aboriginal identity
 *
 * Default output var = aboriginalIdentity
 * ================================================================
 * | Code | Description                                           |
 * | ----------------------------------------                     |
 * | 0    | Aboriginal identity                                   |
 * | 1    | Non-aboriginal identity                               |
 * | .    | Population exclusion or required info is missing      |
 * |==============================================================| 
 *
 * Population exclusion:
 * =====================
 * 1. Born outside of Canada, United States, Germany, or Greenland
 *
 * ================================================================
 */
%macro aboriginalIdentity(out=aboriginalIdentity,
                          cchs_data=,
                          demographics=);
%local out cchs_data demographics;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id sdcdvabt &demographics);
    select(sdcdvabt);
      when(1) aboriginalIdentity = 0;
      when(2) aboriginalIdentity = 1;
      otherwise aboriginalIdentity = .;
    end;
  run;
%mend aboriginalIdentity;