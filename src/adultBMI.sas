/* ===========================================================
 * Dummy code for adult BMI
 *
 * Default output var = adultBMI
 * ===========================================================
 * | Code | Description                                      |
 * | ------------------------------------------------------- |
 * | 1    | Underweight                                      |
 * | 2    | Normal weight                                    |
 * | 3    | Overweight or Obese (class I, II, or III)        |
 * | .    | Population exclusions or required info is missing|
 * |=========================================================| 
 *
 * Population exclusions
 * =====================
 * 1. Breastfeeding women
 *
 * ===========================================================
 */
%macro adultBMI(out=adultBMI,
                cchs_data=,
                demographics=,
				excBreastfeeding=true);
%local out cchs_data demographics excBreastfeeding;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id hwtdvisw mex_110 &demographics);
    select(hwtdvisw);
      when(1) adultBMI = 1;
      when(2) adultBMI = 2;
	  when(3,4,5,6) adultBMI = 3;
      otherwise adultBMI = .;
    end;
	/*Population exclusions*/
%if %upcase(&excBreastfeeding) = TRUE %then %do;
	if mex_110 = 1 then do;
	  adultBMI = .;
	  exclude = 1;
	end;
%end;
%else %if %upcase(&excBreastfeeding) = FALSE %then %do;
  %put ========================================;
  %put population exclusion was not applied;
  %put ========================================;
%end;
%else %do;
  %put ========================================;
  %put The following error occured:;
  %put Valid options for excBreastfeeding are TRUE or FALSE.;
  %put Please review and try again.;
  %put ========================================;
  %abort;
%end;
  run;
%mend adultBMI;