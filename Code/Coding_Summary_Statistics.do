* ---------------------------------------------------------------------------- *
* ---------------------------------------------------------------------------- *
* Maser's Thesis 
* Fabio Ferrara
* 17-607-094
* ---------------------------------------------------------------------------- *
* ---------------------------------------------------------------------------- *
* Impact of loss aversion, ambiguity aversion, attitudes of risks in gains and losses on stock market participation: Results 
* ---------------------------------------------------------------------------- *
* Summary statistics and data cleaning
*------------------------------------------------------------------------------*

* Import data set
import excel "/Users/fabioferrara/Desktop/UZH/4. Semester/Masterarbeit/Daten/PANDA/PANDA_all_data.xlsx", sheet("data") firstrow clear

* Prepare data
* Convert numeric variables to string variables
destring stock, replace
destring age, replace
destring hdegree, replace
destring Buddhism, replace
destring Christianity, replace
destring Confucianism, replace
destring Islam, replace
destring Taoism, replace
destring Marxism, replace
destring married, replace
destring gender, replace
destring children, replace

*------------------------------------------------------------------------------*
* Create all necessary variables for the analysis

* Control variables

** profession 
* 1= high school student, 2= university student,  3= employed by state, 4= employed private, 5= self employed, 6= housemaker, 7= no job, 8= others

* students are university students
generate student = 1 if profession == 2
		replace student = 0 if profession == 1 | profession == 3  | profession == 4 | profession == 5 | 		profession == 6 | profession == 7 | profession == 8

generate hs_student = 1 if profession == 1 
		replace hs_student = 0 if profession == 2 | profession == 3  | profession == 4 | profession == 5 | 			profession == 6 | profession == 7 | profession == 8

* Employed refers to employed by state, employed private and self employed
generate employed = 1 if profession == 3 | profession == 4 | profession == 5
		replace employed = 0 if profession == 1 | profession == 2 | profession == 6 | profession == 7 | 		profession == 8

* Homemaker
generate homemaker = 1 if profession == 6
		replace homemaker = 0 if profession == 1 | profession == 2 | profession == 3 | profession == 4 | 		profession == 5 | profession == 7 | profession == 8


* Unemployed
generate unemployed = 1 if profession == 7
		replace unemployed = 0 if profession ==1 | profession  == 2 | profession == 3 | profession == 4 | 			profession == 5 | profession == 6 | profession == 8

* Others
generate other_prof = 1 if profession == 8
		replace other_prof = 0 if profession ==1 | profession  == 2 | profession == 3 | profession == 4 | 			profession == 5 | profession == 6 | profession == 7 

** Highest degree
* AJ varialbe: 1= secondary school/Hauptschulabschluss, 2= high school/Mittlere Reife, 3= vocational school/college/Abitur, 4= undergraduate degree/Bachelor, 5= master[in German: Master, Magister oder Diplom], 6= PhD, 7= others

* Secondary school
generate sec_school = 1 if AJ == 1 
		replace sec_school = 0 if AJ==2 | AJ==3 | AJ==4 | AJ==5 | AJ==6 | AJ==7

* High school
generate high_school = 1 if AJ ==2
		replace high_school = 0 if AJ==1 | AJ==3 | AJ==4 | AJ==5 | AJ==6 | AJ==7


* College
generate college = 1 if AJ ==3
		replace college = 0 if AJ==1 | AJ==2 | AJ==4 | AJ==5 | AJ==6 | AJ==7

* uni_degree when profession is 4= undergraduate degree/Bachelor, 5= Master[in German: Master, Magister oder Diplom], 6= PhD

* Others
generate other_hd = 1 if AJ == 7
		replace other_hd = 0 if AJ==1 | AJ==2 | AJ==3 | AJ==4 | AJ==5 | AJ==6

** Field of study
* 3= economics and business studies, 2= mathemathical base fields & ingenieuring 1= human science and social science 
* Economics and Business

generate econ = 1 if FOG_classification == 3 | major_classification == 3 
		replace econ = 0 if FOG_classification==1 | FOG_classification == 2 | major_classification == 1 | 			major_classification == 2
		replace econ = 1 if FOG_classification == 3 & major_classification == 1
		replace econ = 1 if FOG_classification == 3 & major_classification == 2

* Mathematical base fields & Ingenieuring 
generate maths = 1 if FOG_classification == 2 | major_classification == 2
		replace maths = 0 if FOG_classification == 1 | FOG_classification == 3 | major_classification == 1 | 		major_classification == 3
		replace maths = 1 if FOG_classification == 2 & major_classification == 1
		replace maths = 1 if FOG_classification == 2 & major_classification == 3

* Human Science and Social Science
generate HSnSS = 1 if FOG_classification == 1 | major_classification == 1 
		replace HSnSS = 0 if FOG_classification == 2 | FOG_classification == 3 | major_classification == 2 | 		major_classification == 3 
		replace HSnSS = 1 if FOG_classification == 1 & major_classification == 3
		replace HSnSS = 1 if FOG_classification == 1 & major_classification == 2

* Aggregate CRT questions
drop CRT
rename correct_answers CRT
label variable CRT "CRT"

*------------------------------------------------------------------------------*
* Outcome variables

* Adjustments for the different currencies

* XR3 == loss aversion response
generate XR3_USD_adjusted = XR3 / 0.7786 if Germany_D == 1
	replace XR3_USD_adjusted = XR3 / 0.5241 if Estonia_D == 1
	replace XR3_USD_adjusted = XR3 / 3.5055 if China_D == 1
	replace XR3_USD_adjusted = XR3 / 15.1123 if Taiwan_D == 1
	replace XR3_USD_adjusted = XR3 / 107.4543 if Japan_D == 1
	replace XR3_USD_adjusted = XR3 / 6709.192 if Vietnam_D == 1

* XR1a == RRP in gains response
generate XR1a_USD_adjusted = XR1a / 0.7786 if Germany_D == 1
		replace XR1a_USD_adjusted = XR1a / 0.5241 if Estonia_D == 1
		replace XR1a_USD_adjusted = XR1a / 3.5055 if China_D == 1
		replace XR1a_USD_adjusted = XR1a / 15.1123 if Taiwan_D == 1
		replace XR1a_USD_adjusted = XR1a / 107.4543 if Japan_D == 1
		replace XR1a_USD_adjusted = XR1a / 6709.192 if Vietnam_D == 1

* XR1b == RRP in gains response
generate XR1b_USD_adjusted = XR1b / 0.7786 if Germany_D == 1
		replace XR1b_USD_adjusted = XR1b / 0.5241 if Estonia_D == 1
		replace XR1b_USD_adjusted = XR1b / 3.5055 if China_D == 1
		replace XR1b_USD_adjusted = XR1b / 15.1123 if Taiwan_D == 1
		replace XR1b_USD_adjusted = XR1b / 107.4543 if Japan_D == 1
		replace XR1b_USD_adjusted = XR1b / 6709.192 if Vietnam_D == 1

* XR2 == RRP in losses response
generate XR2_USD_adjusted = XR2 / 0.7786 if Germany_D == 1
		replace XR2_USD_adjusted = XR2 / 0.5241 if Estonia_D == 1
		replace XR2_USD_adjusted = XR2 / 3.5055 if China_D == 1
		replace XR2_USD_adjusted = XR2 / 15.1123 if Taiwan_D == 1
		replace XR2_USD_adjusted = XR2 / 107.4543 if Japan_D == 1
		replace XR2_USD_adjusted = XR2 / 6709.192 if Vietnam_D == 1

* Create winsorized variables for ordered probit models
xtile XR3_USD_adjusted_qntile = XR3_USD_adjusted, nquantiles(200)
generate XR3_USD_adjusted_w = XR3_USD_adjusted if XR3_USD_adjusted_qntile > 5 & XR3_USD_adjusted_qntile < 195

xtile XR1a_USD_adjusted_qntile = XR1a_USD_adjusted, nquantiles(200)
generate XR1a_USD_adjusted_w = XR1a_USD_adjusted if XR1a_USD_adjusted_qntile > 5 & XR1a_USD_adjusted_qntile < 195

xtile XR1b_USD_adjusted_qntile = XR1b_USD_adjusted, nquantiles(200)
generate XR1b_USD_adjusted_w = XR1b_USD_adjusted if XR1b_USD_adjusted_qntile > 5 & XR1b_USD_adjusted_qntile < 195

xtile XR2_USD_adjusted_qntile = XR2_USD_adjusted, nquantiles(200)
generate XR2_USD_adjusted_w = XR2_USD_adjusted if XR2_USD_adjusted_qntile > 5 & XR2_USD_adjusted_qntile < 195

* Generate istock variable
generate istock = 0 
		replace istock = 1 if invest_stock>0
        replace istock = . if missing(invest_stock)

*------------------------------------------------------------------------------*
* Label variables

label variable theta_w "Loss Aversion"
label variable ambig "Ambiguity Aversion"
label variable rrp_gain_w "RRP Gains"
label variable rrp_loss_w "RRP Losses"
label variable Estonia_D "Estonian"
label variable Taiwan_D "Taiwanese"
label variable China_D "Chinese"
label variable Vietnam_D "Vietnamese"
label variable Japan_D "Japanese"
label variable age "Age"
label variable gender "Male"
label variable student "Student"
label variable homemaker "Homemaker"
label variable unemployed "Unemployed"
label variable other_prof "Other Prof."
label variable uni_degree "Uni Degree"
label variable econ "Economics"
label variable maths "Mathematics"
label variable married "Married"
label variable parent "Parent"
label variable financial_lit "Financial Literacy"
label variable CRT "Cognitive Reflection"
label variable trust "Trust"
label variable UAI "Uncertainty Avoidance"
label variable IDV "Individualism"
label variable PDI "Power Distance"
label variable MAS "Masculinity"

*------------------------------------------------------------------------------*
* Export summary statistics
*------------------------------------------------------------------------------*
* Subsection 4.1

* Summary statistics variables of interst by stock
eststo: estpost tabstat theta_w ambig rrp_gain_w rrp_loss_w  if base_pack_quality == 2, statistics( count mean sd min max ) by(stock)

esttab using "summary_stats.tex" , cells( "theta_w(fmt(2)) ambig(fmt(2)) rrp_gain_w(fmt(2)) rrp_loss_w(fmt(2))" ) noobs label replace

eststo clear

* By wstock
eststo: estpost tabstat theta_w ambig rrp_gain_w rrp_loss_w  if base_pack_quality == 2, statistics( count mean sd min max ) by(wstock)

esttab using "summary_stats.tex" , cells( "theta_w(fmt(2)) ambig(fmt(2)) rrp_gain_w(fmt(2)) rrp_loss_w(fmt(2))" ) noobs label replace

*------------------------------------------------------------------------------*
* Including socioeconomic variables by stock

eststo clear

eststo: estpost tabstat age gender hs_student student employed homemaker unemployed other_prof sec_school high_school college uni_degree other_hd econ maths HSnSS married parent if base_pack_quality == 2, statistics( count mean) by(stock)

esttab using "summary_stats.tex" , cells( "age(fmt(2)) gender(fmt(2)) hs_student(fmt(2)) student(fmt(2)) employed(fmt(2)) homemaker(fmt(2)) unemployed(fmt(2)) other_prof(fmt(2)) sec_school(fmt(2)) high_school(fmt(2)) college(fmt(2)) uni_degree(fmt(2)) other_hd(fmt(2)) econ(fmt(2)) maths(fmt(2)) HSnSS(fmt(2)) married(fmt(2)) parent(fmt(2))" ) noobs label replace

* By wstock
eststo clear

eststo: estpost tabstat age gender hs_student student employed homemaker unemployed other_prof high_school college uni_degree other_hd econ maths HSnSS married parent if base_pack_quality == 2, statistics( count mean) by(wstock)

esttab using "summary_stats.tex" , cells( "age(fmt(2)) gender(fmt(2)) hs_student(fmt(2)) student(fmt(2)) employed(fmt(2)) homemaker(fmt(2)) unemployed(fmt(2)) other_prof(fmt(2)) high_school(fmt(2)) college(fmt(2)) uni_degree(fmt(2)) other_hd(fmt(2)) econ(fmt(2)) maths(fmt(2)) HSnSS(fmt(2)) married(fmt(2)) parent(fmt(2))" ) noobs label replace

*------------------------------------------------------------------------------*
* Including Religion and individual characteristics by stock

eststo clear

eststo: estpost tabstat Buddhism Christianity Confucianism Islam Taoism Marxism financial_lit CRT trust eu_ppp_income if base_pack_quality == 2, statistics( count mean sd min max ) by(stock)

esttab using "summary_stats.tex" , cells( "Buddhism(fmt(2)) Christianity(fmt(2)) Confucianism(fmt(2)) Islam(fmt(2)) Taoism(fmt(2)) Marxism(fmt(2)) financial_lit(fmt(2)) CRT(fmt(2)) trust(fmt(2)) eu_ppp_income(fmt(2))" ) noobs label replace

* By wstock
eststo clear

eststo: estpost tabstat Buddhism Christianity Confucianism Islam Taoism Marxism financial_lit CRT trust if base_pack_quality == 2, statistics( count mean sd min max ) by(wstock)

esttab using "summary_stats.tex" , cells( "Buddhism(fmt(2)) Christianity(fmt(2)) Confucianism(fmt(2)) Islam(fmt(2)) Taoism(fmt(2)) Marxism(fmt(2)) financial_lit(fmt(2)) CRT(fmt(2)) trust(fmt(2)) eu_ppp_income(fmt(2))" ) noobs label replace

*------------------------------------------------------------------------------*
* By country

eststo clear

eststo: estpost tabstat wstock theta_w ambig rrp_gain_w rrp_loss_w age gender student  if base_pack_quality == 2, statistics(count mean sd min max ) by(country)

esttab using "summary_stats.tex", cells("wstock(fmt(2)) theta_w(fmt(2)) ambig(fmt(2)) rrp_gain_w(fmt(2)) rrp_loss_w(fmt(2)) age(fmt(2)) gender(fmt(2)) student(fmt(2))") noobs label replace

eststo clear

eststo: estpost tabstat high_school college uni_degree econ maths HSnSS financial_lit CRT trust if base_pack_quality == 2, statistics(count mean sd min max ) by(country)

esttab using "summary_stats.tex", cells("high_school(fmt(2)) college(fmt(2)) uni_degree(fmt(2)) econ(fmt(2)) maths(fmt(2)) HSnSS(fmt(2)) financial_lit(fmt(2)) CRT(fmt(2)) trust(fmt(2))") noobs label replace

*------------------------------------------------------------------------------*
* Correlation matrix 
corrtex stock wstock theta_w ambig rrp_gain_w rrp_loss_w age gender student employed homemaker unemployed other_prof high_school uni_degree other_hd econ maths HSnSS married parent financial_lit CRT trust if base_pack_quality == 2, file(corrtable.tex) digits(2) landscape replace

*------------------------------------------------------------------------------*
* Descriptive statistics in appendix
* Subsection 4.1

* Stock and Istock
count if stock == 0 & istock == 0 & base_pack_quality == 2
count if stock == 1 & istock == 0 & base_pack_quality == 2

count if stock == 0 & istock == 1 & base_pack_quality == 2
count if stock == 1 & istock == 1 & base_pack_quality == 2

*------------------------------------------------------------------------------*

* Wstock and Istock
count if wstock == 1 & istock == 0 & base_pack_quality == 2
count if wstock == 2 & istock == 0 & base_pack_quality == 2

count if wstock == 1 & istock == 0 & base_pack_quality == 2
count if wstock == 2 & istock == 0 & base_pack_quality == 2

count if wstock == 1 & istock == 1 & base_pack_quality == 2
count if wstock == 2 & istock == 1 & base_pack_quality == 2

count if wstock == 3 & istock == 0 & base_pack_quality == 2
count if wstock == 4 & istock == 0 & base_pack_quality == 2

count if wstock == 3 & istock == 1 & base_pack_quality == 2
count if wstock == 4 & istock == 1 & base_pack_quality == 2

*------------------------------------------------------------------------------*

* Wstock and Stock
count if wstock == 1 & stock == 0 & base_pack_quality == 2
count if wstock == 2 & stock == 0 & base_pack_quality == 2

count if wstock == 1 & stock == 1 & base_pack_quality == 2
count if wstock == 2 & stock == 1 & base_pack_quality == 2

count if wstock == 3 & stock == 0 & base_pack_quality == 2
count if wstock == 4 & stock == 0 & base_pack_quality == 2

count if wstock == 3 & stock == 1 & base_pack_quality == 2
count if wstock == 4 & stock == 1 & base_pack_quality == 2

count if wstock == 3 & stock == 1 & base_pack_quality == 2
count if wstock == 4 & stock == 1 & base_pack_quality == 2

*----------------------------------------------------------------------------*
* Close log
log close
*----------------------------------------------------------------------------*
*----------------------------------------------------------------------------*
