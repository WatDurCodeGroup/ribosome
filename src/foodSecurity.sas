/* ===========================================
 * Dummy code for fruit & vegetable consumption
 *
 * Default output var = foodInsecureAdult, foodInsecureChild, foodInsecureHome
 * =====================================|
 * | Code | Description                 |
 * | -----------------------------------|
 * | 1    | Food insecure               |
 * | 0    | Food secure                 |
 * | .    | Required info is missing    |
 * |====================================| 
 *
 * Population exclusions
 * =====================
 * Using household weight requires removing responses
 * from children 12 to 17
 * ==============================================
 */
%macro foodSecurity(out=foodSecurity,
               cchs_data=,
               demographics=);
%local out cchs_data demographics;
  /*Parameter validation*/
  %validate( data=&cchs_data, include=&demographics )
  data &out(drop=FSC_: DHHDVOKD DHHDVYKD FSCT: DHHTDKS PMKPROXY DOFSC);
    set &cchs_data.( keep=ont_id dhh_age DOFSC PMKPROXY DHHDVOKD DHHDVYKD FSC_: &demographics );
    /* Fix an error in the source data */
    if (DHHDVOKD+DHHDVYKD=0 and FSC_010 in (3,7,8,9) and FSC_015 in (3,7,8,9) and FSC_020 in (3,7,8,9) 
      and (FSC_010 ne 3 or FSC_015 ne 3 or FSC_020 ne 3))then do; 
        FSC_040 = 9; 
        FSC_045 = 9; 
        FSC_050 = 9; 
        FSC_055 = 9; 
        FSC_060 = 9; 
        FSC_065 = 9; 
        FSC_070 = 9; 
      end; 
    if (DHHDVOKD+DHHDVYKD>0 and FSC_010 in (3,7,8,9) and FSC_015 in (3,7,8,9) and FSC_020 in (3,7,8,9) and FSC_025 in (3,7,8,9) and FSC_030 in (3,7,8,9) and 
      (FSC_010 ne 3 or FSC_015 ne 3 or FSC_020 ne 3 or FSC_025 ne 3 or FSC_030 ne 3)) then do; 
        FSC_035 = 9; 
        FSC_040 = 9; 
        FSC_045 = 9; 
        FSC_050 = 9; 
        FSC_055 = 9; 
        FSC_060 = 9; 
        FSC_065 = 9; 
        FSC_070 = 9; 
        FSC_075 = 9; 
        FSC_080 = 9; 
        FSC_085 = 9; 
        FSC_090 = 9; 
        FSC_095 = 9; 
      end; 
    if (FSC_035  in (3,6) and (FSC_040=2 and FSC_050=2 and FSC_055=2 and fsc_060=2)) then FSC_065=6; 
    if (FSC_035  in (3,6) and (FSC_040=2 and FSC_050=2 and FSC_055=2 and fsc_060=2)) then FSC_070=6;

   /* Create the derived variables again */
   if DHHDVYKD ^= 0 or DHHDVOKD ^= 0 then DHHTDKS = 1;
   if DHHDVYKD = 0 and DHHDVOKD = 0 then DHHTDKS = 0;
   if FSC_010 = 3 and DOFSC = 1 then FSCT010 = 0;
   if FSC_010 in(1,2) and DOFSC = 1 then FSCT010 = 1;
   if FSC_015 = 3 and DOFSC = 1 then FSCT015 = 0;
   if FSC_015 in(1,2) and DOFSC = 1 then FSCT015 = 1;
   if FSC_020 = 3 and DOFSC = 1 then FSCT020 = 0;
   if FSC_020 in(1,2) and DOFSC = 1 then FSCT020 = 1;
   if FSC_025 in(3,6) and DOFSC = 1 then FSCT025 = 0;
   if FSC_025 in(1,2) and DOFSC = 1 then FSCT025 = 1;
   if FSC_030 in(3,6) and DOFSC = 1 then FSCT030 = 0;
   if FSC_030 in(1,2) and DOFSC = 1 then FSCT030 = 1;
   if FSC_035 in(3,6) and DOFSC = 1 then FSCT035 = 0;
   if FSC_035 in(1,2) and DOFSC = 1 then FSCT035 = 1;
   if FSC_040 in(2,6) and DOFSC = 1 then FSCT040 = 0;
   if FSC_040 = 1 and DOFSC = 1 then FSCT040 = 1;
   if FSC_045 in(3,6) and DOFSC = 1 then FSCT045 = 0;
   if FSC_045 in(1,2) and DOFSC = 1 then FSCT045 = 1;
   if FSC_050 in(2,6) and DOFSC = 1 then FSCT050 = 0;
   if FSC_050 = 1 and DOFSC = 1 then FSCT050 = 1;
   if FSC_055 in(2,6) and DOFSC = 1 then FSCT055 = 0;
   if FSC_055 = 1 and DOFSC = 1 then FSCT055 = 1;
   if FSC_060 in(2,6) and DOFSC = 1 then FSCT060 = 0;
   if FSC_060 = 1 and DOFSC = 1 then FSCT060 = 1;
   if FSC_065 in(2,6) and DOFSC = 1 then FSCT065 = 0;
   if FSC_065 = 1 and DOFSC = 1 then FSCT065 = 1;
   if FSC_070 in(3,6) and DOFSC = 1 then FSCT070 = 0;
   if FSC_070 in(1,2) and DOFSC = 1 then FSCT070 = 1;
   if FSC_075 in(2,6) and DOFSC = 1 then FSCT075 = 0;
   if FSC_075 = 1 and DOFSC = 1 then FSCT075 = 1;
   if FSC_080 in(2,6) and DOFSC = 1 then FSCT080 = 0;
   if FSC_080 = 1 and DOFSC = 1 then FSCT080 = 1;
   if FSC_085 in(3,6) and DOFSC = 1 then FSCT085 = 0;
   if FSC_085 in(1,2) and DOFSC = 1 then FSCT085 = 1;
   if FSC_090 in(2,6) and DOFSC = 1 then FSCT090 = 0;
   if FSC_090 = 1 and DOFSC = 1 then FSCT090 = 1;
   if FSC_095 in(2,6) and DOFSC = 1 then FSCT095 = 0;
   if FSC_095 = 1 and DOFSC = 1 then FSCT095 = 1;
   FSCTASUM = sum(FSCT010, FSCT015, FSCT020, FSCT040, FSCT045, FSCT050, FSCT055, FSCT060, FSCT065, FSCT070);
   FSCTCSUM = sum(FSCT025, FSCT030, FSCT035, FSCT075, FSCT080, FSCT085, FSCT090, FSCT095);

   /* Regenerate the derived variables */
   if DOFSC = 2 then FSCDVAFS = 6;
   else if FSC_010 in(7, 8, 9) or
            FSC_015 in(7, 8, 9) or
            FSC_020 in(7, 8, 9) or
            FSC_040 in(7, 8, 9) or
            FSC_045 in(7, 8, 9) or
            FSC_050 in(7, 8, 9) or
            FSC_055 in(7, 8, 9) or
            FSC_060 in(7, 8, 9) or
            FSC_065 in(7, 8, 9) or
            FSC_070 in(7, 8, 9) or
            PMKPROXY = 2 then FSCDVAFS = 9;
   else if 0 <= FSCTASUM <= 1 then FSCDVAFS = 0;
   else if 2 <= FSCTASUM <= 5 then FSCDVAFS = 1;
   else if 6 <= FSCTASUM <= 10 then FSCDVAFS = 2;

   if DOFSC = 2 then FSCDVCFS = 6;
   else if DHHTDKS = 0 then FSCDVCFS = 6;
   else if  FSC_025 in(7, 8, 9) or
            FSC_030 in(7, 8, 9) or
            FSC_035 in(7, 8, 9) or
            FSC_075 in(7, 8, 9) or
            FSC_080 in(7, 8, 9) or
            FSC_085 in(7, 8, 9) or
            FSC_090 in(7, 8, 9) or
            FSC_095 in(7, 8, 9) or
            PMKPROXY = 2 then FSCDVCFS = 9;
   else if DHHTDKS = 1 and (0 <= FSCTCSUM <= 1) then FSCDVCFS = 0;
   else if DHHTDKS = 1 and (2 <= FSCTCSUM <= 4) then FSCDVCFS = 1;
   else if DHHTDKS = 1 and (5 <= FSCTCSUM <= 8) then FSCDVCFS = 2;

   if DOFSC = 2 then FSCDVHFS = 6;
   else if FSC_010 in(7, 8, 9) or
            FSC_015 in(7, 8, 9) or
            FSC_020 in(7, 8, 9) or
            FSC_040 in(7, 8, 9) or
            FSC_045 in(7, 8, 9) or
            FSC_050 in(7, 8, 9) or
            FSC_055 in(7, 8, 9) or
            FSC_060 in(7, 8, 9) or
            FSC_065 in(7, 8, 9) or
            FSC_070 in(7, 8, 9) or
            FSC_025 in(7, 8, 9) or
            FSC_030 in(7, 8, 9) or
            FSC_035 in(7, 8, 9) or
            FSC_075 in(7, 8, 9) or
            FSC_080 in(7, 8, 9) or
            FSC_085 in(7, 8, 9) or
            FSC_090 in(7, 8, 9) or
            FSC_095 in(7, 8, 9) or
            PMKPROXY = 2 then FSCDVHFS = 9;
   else if DHHTDKS = 1 and
           (0 <= FSCTASUM <= 1) and
           (0 <= FSCTCSUM <= 1) or
           DHHTDKS = 0 and
           (0 <= FSCTASUM <= 1) then FSCDVHFS = 0;
   else if (DHHTDKS = 1 and
           (FSCTASUM >= 2 and FSCTASUM <= 5) and
           (FSCTCSUM >= 2 and FSCTCSUM <= 4)) or
           (DHHTDKS = 1 and
           (((FSCTASUM >= 2 and FSCTASUM <= 5) and
           (FSCTCSUM <= 4)) or ((FSCTASUM <= 5) and
           (FSCTCSUM >= 2 and
           FSCTCSUM <= 4)))) or
           (DHHTDKS = 0 and (FSCTASUM >= 2 and FSCTASUM <= 5)) then FSCDVHFS = 1;
   else if (DHHTDKS = 1 and ((FSCTASUM >= 6 and FSCTASUM <= 10) or
           (FSCTCSUM >= 5 and FSCTCSUM <= 8))) or
           (DHHTDKS = 0 and (FSCTASUM >= 6 and FSCTASUM <= 10)) then FSCDVHFS = 2;

    select( FSCDVAFS );
      when( 0 ) foodInsecureAdult = 0;
      when( 1, 2 ) foodInsecureAdult = 1;
      otherwise foodInsecureAdult = .;
    end;
    select( FSCDVCFS );
      when( 0 ) foodInsecureChild = 0;
      when( 1, 2 ) foodInsecureChild = 1;
      otherwise foodInsecureChild = .;
    end;
    select( FSCDVHFS );
      when( 0 ) foodInsecureHome = 0;
      when( 1, 2 ) foodInsecureHome = 1;
      otherwise foodInsecureHome = .;
    end;
    if FSCDVHFS = 0 and
       (fsc_010 in( 1, 2 ) or
       fsc_015 in( 1, 2 ) or
       fsc_020 in( 1, 2 ) or
       fsc_025 in( 1, 2 ) or
       fsc_030 in( 1, 2 ) or
       fsc_035 in( 1, 2 ) or
       fsc_040 = 1 or
       fsc_045 in( 1, 2 ) or
       fsc_050 = 1 or
       fsc_055 = 1 or
       fsc_060 = 1 or
       fsc_065 = 1 or
       fsc_070 in( 1, 2) or
       fsc_075 = 1 or
       fsc_080 = 1 or
       fsc_085 in( 1, 2) or
       fsc_090 = 1 or
       fsc_095 = 1) then fs3group = 3;
    else if FSCDVHFS in( 0, 1, 2 ) then fs3group = FSCDVHFS;
    else fs3group = .;
    select( fs3group );
      when( 0 ) foodInsecureHome2 = 0;
      when( 1, 2, 3 ) foodInsecureHome2 = 1;
      otherwise foodInsecureHome2 = .;
    end;
  run;
%mend foodSecurity;
