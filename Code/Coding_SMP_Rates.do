* ---------------------------------------------------------------------------- *
* ---------------------------------------------------------------------------- *
* Maser's Thesis 
* Fabio Ferrara
* 17-607-094
* ---------------------------------------------------------------------------- *
* ---------------------------------------------------------------------------- *
* Stock market participation rates among countries
* ---------------------------------------------------------------------------- *
* SHARE data
*------------------------------------------------------------------------------*

* Germany == 12, Austria == 11, Italy == 16, Netherlands == 14, Spain == 15, Greece == 19, Switzerland == 20, France== 17, Denmark == 18, Sweden == 13
*------------------------------------------------------------------------------*
use "/Users/fabioferrara/Desktop/UZH/4. Semester/Masterarbeit/Daten/SHARE/sharew8_rel8-0-0_ALL_datasets_stata/sharew8_rel8-0-0_gv_imputations.dta"

* Clean the data
* For summary statistics, I use only data that is not imputed

keep if thinc_f == 3
keep if implicat == 1

*------------------------------------------------------------------------------*
* Merge data set with Income
*------------------------------------------------------------------------------*

 merge 1:1 mergeid using "/Users/fabioferrara/Desktop/UZH/4. Semester/Masterarbeit/Daten/SHARE/sharew8_rel8-0-0_ALL_datasets_stata/sharew8_rel8-0-0_as_edited.dta"

* Average Austria direct stock ownership

keep if country == 11

count if has_stocks == 1 
count if has_stocks == 5

count if has_stocks == 1 | has_stocks == 5

* Average Austria direct stock ownership = 6.9% 

* Creating Quartiles in Austria

xtile thinc_qrtl = thinc, nquantiles(4)

count if has_stocks == 1 & thinc_qrtl == 1 
count if has_stocks == 5 & thinc_qrtl == 1

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 1

* 1. Quartile:0.6%

count if has_stocks == 1 & thinc_qrtl == 2
count if has_stocks == 5 & thinc_qrtl == 2

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 2

* 2. Quartile:1.9% 

count if has_stocks == 1 & thinc_qrtl == 3
count if has_stocks == 5 & thinc_qrtl == 3

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 3

* 3. Quartile:8.6%

count if has_stocks == 1 & thinc_qrtl == 4
count if has_stocks == 5 & thinc_qrtl == 4

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 4

* 4. Quartile = 10.8%

count if  (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 1
count if (has_funds == 1 | has_stocks == 1 | has_funds == 5 | has_stocks== 5) & thinc_qrtl == 1

* Indirect ownership

count if has_stocks == 1 | has_funds == 1
count if has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1

* Average Austria indirect stock ownership = 20.8 % 

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 1
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 1

* 1. Quartile = 2.5%

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 2
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 2

* 2. Quartile = 8.3% 

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 3
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 3

* 3. Quartile = 25.7%

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 4
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 4

* 4. Quartile = 33.8%

*------------------------------------------------------------------------------*
use "/Users/fabioferrara/Desktop/UZH/4. Semester/Masterarbeit/Daten/SHARE/sharew8_rel8-0-0_ALL_datasets_stata/sharew8_rel8-0-0_as.dta", clear

* Clean the data
* For summary statistics, I use only data that is not imputed

keep if thinc_f == 3
keep if implicat == 1

*------------------------------------------------------------------------------*
* Merge data set with Income
*------------------------------------------------------------------------------*

 merge 1:1 mergeid using "/Users/fabioferrara/Desktop/UZH/4. Semester/Masterarbeit/Daten/SHARE/sharew8_rel8-0-0_ALL_datasets_stata/sharew8_rel8-0-0_as_edited.dta"

* Average Denmark direct stock ownership

keep if country == 18

count if has_stocks == 1 
count if has_stocks == 5

count if  has_stocks == 1 | has_stocks == 5

* Average Denmark direct stock ownership Denmark = 31.0% 

* Creating Quartiles in Denmark

xtile thinc_qrtl = thinc, nquantiles(4)

count if has_stocks == 1 & thinc_qrtl == 1 
count if has_stocks == 5 & thinc_qrtl == 1

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 1

* 1. Quartile: 27.1%

count if has_stocks == 1 & thinc_qrtl == 2
count if has_stocks == 5 & thinc_qrtl == 2

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 2

* 2. Quartile: 24.5%

count if has_stocks == 1 & thinc_qrtl == 3
count if has_stocks == 5 & thinc_qrtl == 3

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 3

* 3. Quartile: 73.4%

count if has_stocks == 1 & thinc_qrtl == 4
count if has_stocks == 5 & thinc_qrtl == 4

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 4

* 4. Quartile: 63.5%

* Average Denmark indirect stock ownership

count if has_stocks == 1 | has_funds == 1
count if has_stocks == 5 | has_funds == 5 | has_stocks == 1 | has_funds == 1

* Average Denmark indirect stock ownership = 42.2%

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 1
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 1

* 1. Quartile = 33.9%

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 2
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 2

* 2. Quartile = 35.8% 

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 3
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 3

* 3. Quartile = 41.6%

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 4
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 4

* 4. Quartile = 55.6%

*------------------------------------------------------------------------------*

use "/Users/fabioferrara/Desktop/UZH/4. Semester/Masterarbeit/Daten/SHARE/sharew8_rel8-0-0_ALL_datasets_stata/sharew8_rel8-0-0_as.dta", clear

* Clean the data
* For summary statistics, I use only data that is not imputed

keep if thinc_f == 3
keep if implicat == 1

*------------------------------------------------------------------------------*
* Merge data set with Income
*------------------------------------------------------------------------------*

 merge 1:1 mergeid using "/Users/fabioferrara/Desktop/UZH/4. Semester/Masterarbeit/Daten/SHARE/sharew8_rel8-0-0_ALL_datasets_stata/sharew8_rel8-0-0_as_edited.dta"

keep if country == 17

* Average direct stock ownership France

count if has_stocks == 1 
count if has_stocks == 5

count if  has_stocks == 1 | has_stocks == 5

* Average direct stock ownership France = 10.4%

* Creating Quartiles in France

xtile thinc_qrtl = thinc, nquantiles(4)

count if has_stocks == 1 & thinc_qrtl == 1 
count if has_stocks == 5 & thinc_qrtl == 1

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 1

* 1. Quartile: 1.2%

count if has_stocks == 1 & thinc_qrtl == 2
count if has_stocks == 5 & thinc_qrtl == 2

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 2

* 2. Quartile: 2.0%

count if has_stocks == 1 & thinc_qrtl == 3
count if has_stocks == 5 & thinc_qrtl == 3

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 3

* 3. Quartile: 9.6%

count if has_stocks == 1 & thinc_qrtl == 4
count if has_stocks == 5 & thinc_qrtl == 4

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 4

* 4. Quartile: 23.7%

* Average indirect stock ownership France

count if has_stocks == 1 | has_funds == 1
count if has_stocks == 5 | has_funds == 5 | has_stocks == 1 | has_funds == 1

* Average indirect stock ownership France = 17.5%

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 1
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 1

* 1. Quartile = 3.1%

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 2
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 2

* 2. Quartile = 5.2% 

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 3
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 3

* 3. Quartile = 14.8%

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 4
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 4

* 4. Quartile = 37.4%

*------------------------------------------------------------------------------*

use "/Users/fabioferrara/Desktop/UZH/4. Semester/Masterarbeit/Daten/SHARE/sharew8_rel8-0-0_ALL_datasets_stata/sharew8_rel8-0-0_as.dta", clear

* Clean the data
* For summary statistics, I use only data that is not imputed

keep if thinc_f == 3
keep if implicat == 1

*------------------------------------------------------------------------------*
* Merge data set with Income
*------------------------------------------------------------------------------*

 merge 1:1 mergeid using "/Users/fabioferrara/Desktop/UZH/4. Semester/Masterarbeit/Daten/SHARE/sharew8_rel8-0-0_ALL_datasets_stata/sharew8_rel8-0-0_as_edited.dta"
 
keep if country == 12

* Average Germany direct stock ownership

count if has_stocks == 1 
count if has_stocks == 5

count if  has_stocks == 1 | has_stocks == 5

* Average direct stock ownership Germany = 13.1% 

* Creating Quartiles in Germany

xtile thinc_qrtl = thinc, nquantiles(4)

count if has_stocks == 1 & thinc_qrtl == 1 
count if has_stocks == 5 & thinc_qrtl == 1

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 1

* 1. Quartile: 2.8%

count if has_stocks == 1 & thinc_qrtl == 2
count if has_stocks == 5 & thinc_qrtl == 2

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 2


* 2. Quartile: 5.8%

count if has_stocks == 1 & thinc_qrtl == 3
count if has_stocks == 5 & thinc_qrtl == 3

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 3

* 3. Quartile: 10.4%

count if has_stocks == 1 & thinc_qrtl == 4
count if has_stocks == 5 & thinc_qrtl == 4

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 4

* 4. Quartile: 20.9%

* Average indirect stock ownership Germany

count if has_stocks == 1 | has_funds == 1
count if has_stocks == 5 | has_funds == 5 | has_stocks == 1 | has_funds == 1

* Average Germany indirect stock ownership = 29.98%

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 1
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 1

* 1. Quartile = 8.1%

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 2
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 2

* 2. Quartile = 19.5% 

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 3
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 3

* 3. Quartile = 30.1%

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 4
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 4

* 4. Quartile = 38.7%

*------------------------------------------------------------------------------*

use "/Users/fabioferrara/Desktop/UZH/4. Semester/Masterarbeit/Daten/SHARE/sharew8_rel8-0-0_ALL_datasets_stata/sharew8_rel8-0-0_as.dta", clear

* Clean the data
* For summary statistics, I use only data that is not imputed

keep if thinc_f == 3
keep if implicat == 1

*------------------------------------------------------------------------------*
* Merge data set with Income
*------------------------------------------------------------------------------*

 merge 1:1 mergeid using "/Users/fabioferrara/Desktop/UZH/4. Semester/Masterarbeit/Daten/SHARE/sharew8_rel8-0-0_ALL_datasets_stata/sharew8_rel8-0-0_as_edited.dta"

keep if country == 16

* Average direct stock ownership Italy

count if has_stocks == 1 
count if has_stocks == 5

count if  has_stocks == 1 | has_stocks == 5

* Average direct stock ownership Italy = 2.1%

* Creating Quartiles in Italy

xtile thinc_qrtl = thinc, nquantiles(4)

count if has_stocks == 1 & thinc_qrtl == 1 
count if has_stocks == 5 & thinc_qrtl == 1

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 1

* 1. Quartile: 0.6%

count if has_stocks == 1 & thinc_qrtl == 2
count if has_stocks == 5 & thinc_qrtl == 2

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 2


* 2. Quartile: 0.6%

count if has_stocks == 1 & thinc_qrtl == 3
count if has_stocks == 5 & thinc_qrtl == 3

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 3

* 3. Quartile: 0.6%

count if has_stocks == 1 & thinc_qrtl == 4
count if has_stocks == 5 & thinc_qrtl == 4

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 4

* 4. Quartile: 3.5%

* Average indirect stock ownership Italy

count if has_stocks == 1 | has_funds == 1
count if has_stocks == 5 | has_funds == 5 | has_stocks == 1 | has_funds == 1

* Average indirect stock ownership Italy = 7.0%

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 1
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 1

* 1. Quartile = 2.5%

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 2
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 2

* 2. Quartile = 0.6% 

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 3
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 3

* 3. Quartile = 3.8%

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 4
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 4

* 4. Quartile = 15.3%

*------------------------------------------------------------------------------*

use "/Users/fabioferrara/Desktop/UZH/4. Semester/Masterarbeit/Daten/SHARE/sharew8_rel8-0-0_ALL_datasets_stata/sharew8_rel8-0-0_as.dta", clear

* Clean the data
* For summary statistics, I use only data that is not imputed

keep if thinc_f == 3
keep if implicat == 1

*------------------------------------------------------------------------------*
* Merge data set with Income
*------------------------------------------------------------------------------*

 merge 1:1 mergeid using "/Users/fabioferrara/Desktop/UZH/4. Semester/Masterarbeit/Daten/SHARE/sharew8_rel8-0-0_ALL_datasets_stata/sharew8_rel8-0-0_as_edited.dta"
 
keep if country == 15

* Average direct stock ownership Spain

count if has_stocks == 1 
count if has_stocks == 5

count if  has_stocks == 1 | has_stocks == 5

* Average direct stock ownership Spain = 5.3%

* Creating Quartiles in Spain

xtile thinc_qrtl = thinc, nquantiles(4)

count if has_stocks == 1 & thinc_qrtl == 1 
count if has_stocks == 5 & thinc_qrtl == 1

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 1

* 1. Quartile: 1.3%

count if has_stocks == 1 & thinc_qrtl == 2
count if has_stocks == 5 & thinc_qrtl == 2

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 2


* 2. Quartile: 0.6%

count if has_stocks == 1 & thinc_qrtl == 3
count if has_stocks == 5 & thinc_qrtl == 3

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 3

* 3. Quartile: 6.5%

count if has_stocks == 1 & thinc_qrtl == 4
count if has_stocks == 5 & thinc_qrtl == 4

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 4

* 4. Quartile: 7.8%


* Average indirect stock ownership Spain

count if has_stocks == 1 | has_funds == 1
count if has_stocks == 5 | has_funds == 5 | has_stocks == 1 | has_stocks == 1

* Average indirect stock ownership Spain = 8.8%

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 1
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 1

* 1. Quartile = 2.6%

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 2
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 2

* 2. Quartile = 2.7% 

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 3
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 3

* 3. Quartile = 6.5%

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 4
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 4

* 4. Quartile = 10.9%
*------------------------------------------------------------------------------*

use "/Users/fabioferrara/Desktop/UZH/4. Semester/Masterarbeit/Daten/SHARE/sharew8_rel8-0-0_ALL_datasets_stata/sharew8_rel8-0-0_as.dta", clear

* Clean the data
* For summary statistics, I use only data that is not imputed

keep if thinc_f == 3
keep if implicat == 1

*------------------------------------------------------------------------------*
* Merge data set with Income
*------------------------------------------------------------------------------*

 merge 1:1 mergeid using "/Users/fabioferrara/Desktop/UZH/4. Semester/Masterarbeit/Daten/SHARE/sharew8_rel8-0-0_ALL_datasets_stata/sharew8_rel8-0-0_as_edited.dta"

keep if country == 13

* Average direct stock ownership Sweden

count if has_stocks == 1 
count if has_stocks == 5

count if  has_stocks == 1 | has_stocks == 5

* Creating Quartiles in Sweden

xtile thinc_qrtl = thinc, nquantiles(4)

count if has_stocks == 1 & thinc_qrtl == 1 
count if has_stocks == 5 & thinc_qrtl == 1

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 1

* 1. Quartile: 15.6%

count if has_stocks == 1 & thinc_qrtl == 2
count if has_stocks == 5 & thinc_qrtl == 2

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 2


* 2. Quartile: 30.1%

count if has_stocks == 1 & thinc_qrtl == 3
count if has_stocks == 5 & thinc_qrtl == 3

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 3

* 3. Quartile: 37.4%

count if has_stocks == 1 & thinc_qrtl == 4
count if has_stocks == 5 & thinc_qrtl == 4

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 4

* 4. Quartile: 51.7%

* Average direct stock ownership Sweden = 38.1%

* Average indirect stock ownership Sweden

count if has_stocks == 1 | has_funds == 1
count if has_stocks == 5 | has_funds == 5 | has_stocks == 1 | has_stocks == 1

* Average indirect stock ownership Sweden = 61.3%

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 1
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 1

* 1. Quartile = 33.8%

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 2
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 2

* 2. Quartile = 49.3% 

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 3
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 3

* 3. Quartile = 64.9%

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 4
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 4

* 4. Quartile = 72.5%



*------------------------------------------------------------------------------*

use "/Users/fabioferrara/Desktop/UZH/4. Semester/Masterarbeit/Daten/SHARE/sharew8_rel8-0-0_ALL_datasets_stata/sharew8_rel8-0-0_as.dta", clear

* Clean the data
* For summary statistics, I use only data that is not imputed

keep if thinc_f == 3
keep if implicat == 1

*------------------------------------------------------------------------------*
* Merge data set with Income
*------------------------------------------------------------------------------*

 merge 1:1 mergeid using "/Users/fabioferrara/Desktop/UZH/4. Semester/Masterarbeit/Daten/SHARE/sharew8_rel8-0-0_ALL_datasets_stata/sharew8_rel8-0-0_as_edited.dta"

keep if country == 20

* Average direct stock ownership Switzerland

count if has_stocks == 1 
count if has_stocks == 5

count if  has_stocks == 1 | has_stocks == 5

* Average direct stock ownership Switzerland = 25.0%

* Creating Quartiles in Switzerland

xtile thinc_qrtl = thinc, nquantiles(4)

count if has_stocks == 1 & thinc_qrtl == 1 
count if has_stocks == 5 & thinc_qrtl == 1

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 1

* 1. Quartile: 11.7%

count if has_stocks == 1 & thinc_qrtl == 2
count if has_stocks == 5 & thinc_qrtl == 2

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 2


* 2. Quartile: 19.0%

count if has_stocks == 1 & thinc_qrtl == 3
count if has_stocks == 5 & thinc_qrtl == 3

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 3

* 3. Quartile: 70.2%

count if has_stocks == 1 & thinc_qrtl == 4
count if has_stocks == 5 & thinc_qrtl == 4

count if  (has_stocks == 1 | has_stocks == 5) & thinc_qrtl == 4

* 4. Quartile: 68.6%

* Average indirect stock ownership Switzerland

count if has_stocks == 1 | has_funds == 1
count if has_stocks == 5 | has_funds == 5 | has_stocks == 1 | has_funds == 1

* Average indirect stock ownership Switzerland = 41.2%

* 1. Quartile 

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 1
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 1

* 1. Quartile = 16.8%

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 2
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 2

* 2. Quartile = 31.0% 

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 3
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 3

* 3. Quartile = 43.0%

count if (has_stocks == 1 | has_funds == 1) & thinc_qrtl == 4
count if (has_stocks == 1 | has_funds == 1 | has_funds == 5 | has_stocks == 1) & thinc_qrtl == 4

* 4. Quartile = 52.4%

*------------------------------------------------------------------------------*
* Close log
log close
*------------------------------------------------------------------------------*
*------------------------------------------------------------------------------*
