/* ===========================================
 * Dummy code for has diabetes
 *
 * Default output var = diabetes
 * ===========================================
 * | Code | Description                      |
 * | --------------------------------------- |
 * | 1    | Has diabetes                     |
 * | 0    | Does not have diabetes           |
 * | .    | Required info is missing         |
 * |=========================================| 
 *
 * ==============================================
 */
%macro diabetes(out=diabetes,
                cchs_data=,
                demographics=);
%local out cchs_data demographics;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id ccc_095 &demographics);
    select(ccc_095);
      when(1) diabetes = 1;
      when(2) diabetes = 0;
      otherwise diabetes = .;
    end;
  run;
%mend diabetes;