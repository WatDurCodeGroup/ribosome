/* ===========================================
 * Dummy code for fruit & vegetable consumption
 *
 * Default output var = fruitVegFive
 * =====================================================|
 * | Code | Description                                 |
 * | -------------------------------------------------- |
 * | 1    | Eats fruit or vegetables >= 5 times a day   |
 * | 0    | Eats fruit or vegetables < 5 times          |
 * | .    | Required info is missing                    |
 * |====================================================| 
 *
 * Population exclusions
 * =====================
 * None
 * 
 * ==============================================
 */
%macro fruitVegFive(out=fruitVegFive,
               cchs_data=,
               demographics=);
%local out cchs_data demographics;
  /*Parameter validation*/
  %validate( data=&cchs_data, include=&demographics )
  data &out;
    set &cchs_data.( keep=ont_id dhh_age FVCDVGDT &demographics );
    select( FVCDVGDT );
      when( 1 ) fruitVegFive = 0;
      when( 2, 3 ) fruitVegFive = 1;
      otherwise fruitVegFive = .;
    end;
  run;
%mend fruitVegFive;
