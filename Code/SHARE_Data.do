* ---------------------------------------------------------------------------- *
* ---------------------------------------------------------------------------- *
* Maser's Thesis 
* Fabio Ferrara
* 17-607-094
* ---------------------------------------------------------------------------- *
* ---------------------------------------------------------------------------- *
* Participation Rates: Share data 
* ---------------------------------------------------------------------------- *

* Load data from SHARE Wave 8
. use "/Users/fabioferrara/Desktop/UZH/4. Semester/Masterarbeit/Daten/sharew8_rel8-0-0_ALL_datasets
> _stata/sharew8_rel8-0-0_as.dta"

* rename stock market participation variables
rename as063_ has_stocks
rename as064_ has_funds

* identify "Yes" and "No" code in the data
* Yes = 1
* No = 5

* clean data from missing values and refusals
keep if has_stocks !=.
keep if has_funds !=.

keep if has_stocks != -1
keep if has_funds != -1

keep if has_stocks != -2
keep if has_funds != -2

* identifying country codes
* Netherlands = 14
* Germany = 12
* Italy = 16 
* Austria = 11
* Swedern = 13
* Spain = 15 
* France = 17 
* Denmark = 18
* Switzerland = 20
* Israel = 25

* Calculate average stock market participation rate of each country of interest
* Netherlands
count if has_stocks == 1 & country == 14
count if has_stocks == 5 & country == 14

* Germany
count if has_stocks == 1 & country == 12
count if has_stocks == 5 & country == 12

* Italy
count if has_stocks == 1 & country == 16
count if has_stocks == 5 & country == 16

* Austria
count if has_stocks == 1 & country == 11
count if has_stocks == 5 & country == 11

* Sweden 
count if has_stocks == 1 & country == 13
count if has_stocks == 5 & country == 13

* Spain
count if has_stocks == 1 & country == 15
count if has_stocks == 5 & country == 15

* France
count if has_stocks == 1 & country == 17
count if has_stocks == 5 & country == 17

* Denmark
count if has_stocks == 1 & country == 18
count if has_stocks == 5 & country == 18

* Switzerland 
count if has_stocks == 1 & country == 20
count if has_stocks == 5 & country == 20

* Israel
count if has_stocks == 1 & country == 25
count if has_stocks == 5 & country == 25


* Calculate average stock market participation over time
* Apply the commands from above to all the different waves
* Create table for graph

input Netherlands Germany Italy Austria Sweden Spain France Denmark Switzerland Israel
0.165 0.138 0.052 0.068 0.43 0.039 0.138 0.415 0.267 0.11
0.153 0.14 0.054 0.072 0.432 0.038 0.122 0.388 0.253 0
0.098 0.117 0.038 0.065 0.392 0.04 0.1 0.316 0.221 0.087	
0 0.108 0.031 0.065 0.37 0.031 0.101 0.292 0.23 0.083
0 0.118 0.03 0.055 0.38 0.042 0.119 0.321 0.213 0
0.104 0.131 0.021 0.069 0.381 0.053 0.103 0.31 0.25 0.081
end

gen Waves = "W2" "W4" "W5" "W6" "W7" "W8"


* Merge dataset with information about income through "mergeid" variable 

