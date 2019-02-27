/* ===========================================
 * Dummy code for sun protection
 *
 * Default output var = sunProtection
 * ===========================================
 * | Code | Description                      |
 * | --------------------------------------- |
 * | 1    | Protects self from sun           |
 * | 0    | Does not protect self from sun   |
 * | .    | Required info is missing         |
 * |=========================================| 
 *
 * Population exclusions
 * =====================
 * None
 * 
 * ----------------------------------------------
 * Sun protection is defined accoring to the recommendation
 * of the Canadian Partnership Against Cancer. This includes:
 *    1. <30 min of sun exposure during peak hours
 * OR 2. >=30 min of sun exposure during peak hours with:
 *      a. Seeking shade/avoiding sun exposure
 *      b. Wearing sun protective clothing and hat
 *      c. Wearing sunscreen with SPF >= 15 on face
 *         and body.
 * ==============================================
 */
%macro sunProtection(out=sunProtection,
                     cchs_data=,
                     demographics=);
%local out cchs_data demographics;
  /*Parameter validation*/
  %validate(data=&cchs_data,include=&demographics)
  data &out;
    set &cchs_data.(keep=ont_id ssbdvprt &demographics);
    select(ssbdvprt);
      when(1) sunProtection = 1;
      when(2) sunProtection = 0;
      otherwise sunProtection = .;
    end;
  run;
%mend sunProtection;
