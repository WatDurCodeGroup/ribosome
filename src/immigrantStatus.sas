/* ============================================
 * Dummy code for immigrant status
 *
 * Default output var = immigrantStatus
 * ============================================
 * | Code | Description                       |
 * | ---------------------------------------- |
 * | 1    | Immigrant                         |
 * | 0    | Non-immigrant                     |
 * | .    | Required info is missing          |
 * |==========================================| 
 *
 * ============================================
 */
%macro immigrantStatus(out=immigrantStatus,
                          cchs_data=,
                          demographics=);
%local out cchs_data demographics;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id sdcdvimm &demographics);
    select(sdcdvimm);
      when(1) immigrantStatus = 1;
      when(2) immigrantStatus = 0;
      otherwise immigrantStatus = .;
    end;
  run;
%mend immigrantStatus;