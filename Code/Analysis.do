* ---------------------------------------------------------------------------- *
* ---------------------------------------------------------------------------- *
* Maser's Thesis 
* Fabio Ferrara
* 17-607-094
* ---------------------------------------------------------------------------- *
* ---------------------------------------------------------------------------- *
* Impact of loss aversion, ambiguity aversion, attitudes of risks in gains and losses on stock market participation: Results 

*-------------------------------------------------------------------------------*
* Main Analysis 
*-------------------------------------------------------------------------------*
* First Regression
*-------------------------------------------------------------------------------*

* stocks

eststo m1: probit stock theta_w ambig rrp_gain_w rrp_loss_w if base_pack_quality == 2, robust 

* Control variables that drop out because of missing values, or too low observations: hs_student, other_hd, college, high_school

* every variable singularly
eststo m2: probit stock theta_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D age agesqrt gender student homemaker unemployed other_prof high_school uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust

eststo m3: probit stock ambig Estonia_D Taiwan_D China_D Vietnam_D Japan_D age agesqrt gender student homemaker unemployed other_prof high_school uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust

* Incorporate all Variables of interest into the model
eststo m4: probit stock theta_w ambig rrp_gain_w rrp_loss_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D age agesqrt gender student homemaker unemployed other_prof high_school uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust


*-------------------------------------------------------------------------------*
* invested in stocks
*-------------------------------------------------------------------------------*

eststo m5: regress invest_stock theta_w ambig rrp_gain_w rrp_loss_w if base_pack_quality == 2, robust 

eststo m6: regress invest_stock theta_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof high_school uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust

eststo m7: regress invest_stock ambig Estonia_D Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof high_school uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust

* Incorporate all Variables of interest into the model
eststo m8: regress invest_stock theta_w ambig rrp_gain_w rrp_loss_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof high_school uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust

esttab m1 m2 m3 m4 m5 m6 m7 m8 using "regression.tex" , label ar2 pr2 star(* 0.1 ** 0.05 *** 0.01) replace

*-------------------------------------------------------------------------------*

* Detect multicollinearity issues
eststo clear
estat vif


*-------------------------------------------------------------------------------*
* Drop out agesrt and high_school because of multicollinearity issues

eststo m1: probit stock theta_w ambig rrp_gain_w rrp_loss_w if base_pack_quality == 2, robust 

* Control variables that drop out because of missing values, or too low observations: hs_student, other_hd, college, high_school

* every variable singularly
eststo m2: probit stock theta_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust

eststo m3: probit stock ambig Estonia_D Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust

* Incorporate all Variables of interest into the model
eststo m4: probit stock theta_w ambig rrp_gain_w rrp_loss_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust


*-------------------------------------------------------------------------------*
* invested in stocks
*-------------------------------------------------------------------------------*

eststo m5: regress invest_stock theta_w ambig rrp_gain_w rrp_loss_w if base_pack_quality == 2, robust 

eststo m6: regress invest_stock theta_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust

eststo m7: regress invest_stock ambig Estonia_D Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust

* Incorporate all Variables of interest into the model
eststo m8: regress invest_stock theta_w ambig rrp_gain_w rrp_loss_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust

esttab m1 m2 m3 m4 m5 m6 m7 m8 using "regression.tex" , b( %9.3f) label ar2 pr2 star(* 0.1 ** 0.05 *** 0.01) replace

* Check vif again
eststo clear
estat vif

*-------------------------------------------------------------------------------*
* % willingness to invest in stocks, Main Results
*-------------------------------------------------------------------------------*

eststo m1: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w if base_pack_quality == 2, robust

eststo m2: oprobit wstock theta_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust

eststo m3: oprobit wstock ambig Estonia_D Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust

eststo m4: oprobit wstock rrp_gain_w rrp_loss_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust

eststo m5: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust

esttab m1 m2 m3 m4 m5 using "regression.tex" , b( %9.3f) label pr2 star(* 0.1 ** 0.05 *** 0.01) replace

*-------------------------------------------------------------------------------*
* Extensions of Analysis
*-------------------------------------------------------------------------------*

* Rerun main regression with original answer to questions on risk preferences, control for outliers
* Use cook's distance for the simple regression on stock_invest, since it is a OLS
* Use the winsorized variables for the ordered probit model
* Include all of the original answers, but no control

 import excel "/Users/fabioferrara/Desktop/UZH/4. Semester/Masterarbeit/Daten/PANDA/PANDA_all_data.xlsx", sheet("data") firstrow clear

regress invest_stock XR3_USD_adjusted ambig XR1a_USD_adjusted XR2_USD_adjusted if base_pack_quality == 2

predict cooksdist, cooksd

summarize cooksdist


* In order to drop outliers, I use Cook's Distance. Cook's distance D_i is too high, when D_i > 4/(Observations - parameters in model) == 4/(2504-5) = 0.00160064

drop if cooksdist > 0.00160064

eststo m1: regress invest_stock XR3_USD_adjusted ambig XR1a_USD_adjusted XR2_USD_adjusted if base_pack_quality == 2

* Use only original answer of loss aversion and all control variables

 import excel "/Users/fabioferrara/Desktop/UZH/4. Semester/Masterarbeit/Daten/PANDA/PANDA_all_data.xlsx", sheet("data") firstrow clear

regress invest_stock XR3_USD_adjusted age student unemployed uni_degree if base_pack_quality == 2

predict cooksdist, cooksd

summarize cooksdist

* In order to drop outliers, I use Cook's Distance. Cook's distance D_i is too high, when D_i > 4/(Observations - parameters in model) == 4/(2504-8) = 0.001602564

drop if cooksdist > 0.001602564

eststo m2: regress invest_stock XR3_USD_adjusted age student unemployed uni_degree if base_pack_quality == 2

* Use only original answer of attitudes of risks in gains and losses and all control variables
* Note that the variable XR1b_USD_adjusted has been omitted, due to multicollinearity

 import excel "/Users/fabioferrara/Desktop/UZH/4. Semester/Masterarbeit/Daten/PANDA/PANDA_all_data.xlsx", sheet("data") firstrow clear
 
regress invest_stock XR1a_USD_adjusted XR2_USD_adjusted age student unemployed uni_degree if base_pack_quality == 2

predict cooksdist, cooksd

summarize cooksdist

* In order to drop outliers, I use Cook's Distance. Cook's distance D_i is too high, when D_i > 4/(Observations - parameters in model) == 4/(2502-9) = 0.001603206

drop if cooksdist > 0.001603206

eststo m3: regress invest_stock XR1a_USD_adjusted XR2_USD_adjusted age student unemployed uni_degree if base_pack_quality == 2

* Use all original answer and all control variables

import excel "/Users/fabioferrara/Desktop/UZH/4. Semester/Masterarbeit/Daten/PANDA/PANDA_all_data.xlsx", sheet("data") firstrow clear

regress invest_stock XR3_USD_adjusted ambig XR1a_USD_adjusted XR2_USD_adjusted age student unemployed uni_degree if base_pack_quality == 2

predict cooksdist, cooksd

summarize cooksdist

* In order to drop outliers, I use Cook's Distance. Cook's distance D_i is too high, when D_i > 4/(Observations - parameters in model) == 4/(2502-11) = 0.001604493

drop if cooksdist > 0.001604493

eststo m4: regress invest_stock XR3_USD_adjusted ambig XR1a_USD_adjusted XR2_USD_adjusted age student unemployed uni_degree if base_pack_quality == 2


esttab m1 m2 m3 m4 using "regression.tex" , b( %9.3f) label ar2 star(* 0.1 ** 0.05 *** 0.01) replace

*-------------------------------------------------------------------------------*
* Use original answer with main ordered probit model
* Cook's distance not available, so winsorize original variables for loss aversion and rrp in gains and in losses, respectively

eststo m1: oprobit wstock XR3_USD_adjusted_w ambig XR1a_USD_adjusted_w XR1b_USD_adjusted_w XR2_USD_adjusted_w if base_pack_quality == 2, robust

eststo m2: oprobit wstock XR3_USD_adjusted_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust

eststo m3: oprobit wstock XR1a_USD_adjusted_w XR1b_USD_adjusted_w XR2_USD_adjusted_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust

eststo m4: oprobit wstock XR3_USD_adjusted_w ambig XR1a_USD_adjusted_w XR1b_USD_adjusted_w XR2_USD_adjusted_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust

esttab m1 m2 m3 m4 using "regression.tex" ,  b( %9.3f) label pr2 star(* 0.1 ** 0.05 *** 0.01) replace


*-------------------------------------------------------------------------------*
* Rerun main regression with different subsets of control variables
*-------------------------------------------------------------------------------*

* With socioeconomic factors: age, gender, employment, education, marriage

eststo m1: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D

eststo m2: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent if base_pack_quality == 2, robust

eststo m3: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w financial_lit CRT trust if base_pack_quality ==2, robust

eststo m4: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent if base_pack_quality ==2, robust

eststo m5: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D financial_lit CRT trust if base_pack_quality ==2, robust

eststo m6: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality ==2, robust

esttab m1 m2 m3 m4 m5 m6 using "regression.tex" , b( %9.3f) label pr2 star(* 0.1 ** 0.05 *** 0.01) replace

*-------------------------------------------------------------------------------*
* Rerun regression of stocks, ==1 invested in stocks, ==0 not invested
*-------------------------------------------------------------------------------*
eststo clear

count if istock ==1 & stock !=1
count if stock == 0 & stock !=0
count if stock == 1 & istock ==0

import excel "/Users/fabioferrara/Desktop/UZH/4. Semester/Masterarbeit/Daten/Kopie von PANDA_all_data.xlsx", sheet("data") firstrow clear

eststo m1: probit istock theta_w ambig rrp_gain_w rrp_loss_w Taiwan_D China_D Vietnam_D Japan_D if base_pack_quality == 2, robust 

eststo m2: probit istock theta_w ambig rrp_gain_w rrp_loss_w age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent if base_pack_quality == 2, robust

eststo m3: probit istock theta_w ambig rrp_gain_w rrp_loss_w financial_lit CRT trust if base_pack_quality == 2, robust

eststo m4: probit istock theta_w ambig rrp_gain_w rrp_loss_w Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent if base_pack_quality == 2, robust

eststo m5: probit istock theta_w ambig rrp_gain_w rrp_loss_w Taiwan_D China_D Vietnam_D Japan_D financial_lit CRT trust if base_pack_quality == 2, robust

eststo m6: probit istock theta_w ambig rrp_gain_w rrp_loss_w age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust

eststo m7: probit istock theta_w ambig rrp_gain_w rrp_loss_w Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust

esttab m1 m2 m3 m4 m5 m6 m7 using "regression.tex" , b( %9.3f) label pr2 star(* 0.1 ** 0.05 *** 0.01) replace


*-------------------------------------------------------------------------------*
* check risk preferences when controlling for UAI
*-------------------------------------------------------------------------------*

eststo m1: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w UAI if base_pack_quality == 2, robust

eststo m2: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D UAI if base_pack_quality == 2, robust

eststo m3: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent UAI if base_pack_quality == 2, robust

eststo m4: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w financial_lit CRT trust UAI if base_pack_quality == 2, robust

eststo m5: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust UAI if base_pack_quality == 2, robust

esttab m1 m2 m3 m4 m5 using "regression.tex" , b( %9.3f) label pr2 star(* 0.1 ** 0.05 *** 0.01) replace

eststo clear

*-------------------------------------------------------------------------------*
* check risk preferences when controlling for cultural variables
*-------------------------------------------------------------------------------*

eststo m1: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w IDV PDI MAS UAI if base_pack_quality == 2, robust

eststo m2: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D IDV PDI MAS UAI if base_pack_quality == 2, robust

eststo m3: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent IDV PDI MAS UAI if base_pack_quality == 2, robust

eststo m4: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w financial_lit CRT trust IDV PDI MAS UAI if base_pack_quality == 2, robust

eststo m5: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust IDV PDI MAS UAI if base_pack_quality == 2, robust

esttab m1 m2 m3 m4 m5 using "regression.tex" , b( %9.3f) label pr2 star(* 0.1 ** 0.05 *** 0.01) replace

*-------------------------------------------------------------------------------*
* check risk preferences per country 
*-------------------------------------------------------------------------------*

eststo m1: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w age gender student uni_degree econ maths financial_lit CRT trust if base_pack_quality == 2 & Taiwan_D ==1, robust

eststo m2: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w age gender student uni_degree econ maths financial_lit CRT trust if base_pack_quality == 2 & China_D ==1, robust

eststo m3: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w age gender student uni_degree econ maths financial_lit CRT trust if base_pack_quality == 2 & Vietnam_D ==1, robust

eststo m4: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w age gender student uni_degree econ maths financial_lit CRT trust if base_pack_quality == 2 & Germany_D ==1, robust

esttab m1 m2 m3 m4 using "regression.tex" , b( %9.3f) label nonumbers mtitles("Taiwan" "China" "Vietnam" "Germany")  pr2 star(* 0.1 ** 0.05 *** 0.01) replace

*-------------------------------------------------------------------------------*
*Without students
eststo m1: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w age gender uni_degree econ maths financial_lit CRT trust if base_pack_quality == 2 & Taiwan_D ==1 & student!=1 , robust

eststo m2: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w age gender uni_degree econ maths financial_lit CRT trust if base_pack_quality == 2 & China_D ==1 & student!=1 , robust

eststo m3: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w age gender uni_degree econ maths financial_lit CRT trust if base_pack_quality == 2 & Vietnam_D ==1 & student!=1, robust

eststo m4: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w age gender uni_degree econ maths financial_lit CRT trust if base_pack_quality == 2 & Germany_D ==1 & student!=1, robust

esttab m1 m2 m3 m4 using "regression.tex" , b( %9.3f) label nonumbers mtitles("Taiwan" "China" "Vietnam" "Germany")  pr2 star(* 0.1 ** 0.05 *** 0.01) replace

*Only with students

eststo m1: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w age gender uni_degree econ maths financial_lit CRT trust if base_pack_quality == 2 & Taiwan_D ==1 & student==1 , robust

eststo m2: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w age gender uni_degree econ maths financial_lit CRT trust if base_pack_quality == 2 & China_D ==1 & student==1 , robust

eststo m3: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w age gender uni_degree econ maths financial_lit CRT trust if base_pack_quality == 2 & Vietnam_D ==1 & student==1, robust

eststo m4: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w age gender uni_degree econ maths financial_lit CRT trust if base_pack_quality == 2 & Germany_D ==1 & student==1, robust

esttab m1 m2 m3 m4 using "regression.tex" ,  b( %9.3f) label nonumbers mtitles("Taiwan" "China" "Vietnam" "Germany")  pr2 star(* 0.1 ** 0.05 *** 0.01) replace

*-------------------------------------------------------------------------------*
* Check main regression when excluding students & Taiwanese
*-------------------------------------------------------------------------------*
eststo clear

eststo m1: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w if base_pack_quality == 2 & student != 1 & Taiwan_D != 1, robust

eststo m2: oprobit wstock theta_w Estonia_D China_D Vietnam_D Japan_D age gender uni_degree econ maths Buddhism Christianity Confucianism Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2 & student != 1 & Taiwan_D != 1, robust

eststo m3: oprobit wstock ambig Estonia_D China_D Vietnam_D Japan_D age gender uni_degree econ maths Buddhism Christianity Confucianism Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2 & student != 1 & Taiwan_D !=1, robust

eststo m4: oprobit wstock rrp_gain_w rrp_loss_w Estonia_D China_D Vietnam_D Japan_D age gender uni_degree econ maths Buddhism Christianity Confucianism Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2 & student != 1 & Taiwan_D !=1, robust

eststo m5: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w Estonia_D China_D Vietnam_D Japan_D age gender uni_degree econ maths Buddhism Christianity Confucianism Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2 & student != 1 & Taiwan_D !=1, robust

esttab m1 m2 m3 m4 m5 using "regression.tex" , b( %9.3f) label pr2 star(* 0.1 ** 0.05 *** 0.01) replace


*-------------------------------------------------------------------------------*
* Check main regression when excluding non-students & Taiwanese
*-------------------------------------------------------------------------------*
eststo clear

eststo m1: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w if base_pack_quality == 2 & student == 1 & Taiwan_D !=1, robust

eststo m2: oprobit wstock theta_w Estonia_D China_D Vietnam_D Japan_D age gender uni_degree econ maths Buddhism Christianity Confucianism Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2 & student == 1 & Taiwan_D !=1, robust

eststo m3: oprobit wstock ambig Estonia_D China_D Vietnam_D Japan_D age gender uni_degree econ maths Buddhism Christianity Confucianism Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2 & student == 1 & Taiwan_D !=1, robust

eststo m4: oprobit wstock rrp_gain_w rrp_loss_w Estonia_D China_D Vietnam_D Japan_D age gender uni_degree econ maths Buddhism Christianity Confucianism Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2 & student == 1 & Taiwan_D !=1, robust

eststo m5: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w Estonia_D China_D Vietnam_D Japan_D age gender uni_degree econ maths Buddhism Christianity Confucianism Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2 & student == 1 & Taiwan_D !=1, robust

esttab m1 m2 m3 m4 m5 using "regression.tex" , b( %9.3f) label pr2 star(* 0.1 ** 0.05 *** 0.01) replace


*-------------------------------------------------------------------------------*
* Check main regression when excluding Taiwanese non-students
*-------------------------------------------------------------------------------*

drop if (Taiwan_D == 1 & student !=1)

eststo m1: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w if base_pack_quality == 2, robust

eststo m2: oprobit wstock theta_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust

eststo m3: oprobit wstock ambig Estonia_D Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust

eststo m4: oprobit wstock rrp_gain_w rrp_loss_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust

eststo m5: oprobit wstock theta_w ambig rrp_gain_w rrp_loss_w Estonia_D Taiwan_D China_D Vietnam_D Japan_D age gender student homemaker unemployed other_prof uni_degree econ maths Buddhism Christianity Confucianism Islam Taoism Marxism married parent financial_lit CRT trust if base_pack_quality == 2, robust

esttab m1 m2 m3 m4 m5 using "regression.tex" , b( %9.3f) label pr2 star(* 0.1 ** 0.05 *** 0.01) replace
