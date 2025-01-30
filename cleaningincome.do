*Set up your directory, e.g.     cd "/Users/cgalli/desktop/methodsclass/quant"*


use GSS2018and2021.dta

tab income, m
tab income, m nolabel

** nolabel command tells you the underlying code assigned to categories, you need this information to clean data and create new variable **

*** Generate a new variable that removes individuals with missing data from the sample ***

gen famincome=.

*** replacing all non-response values as missing**

replace famincome=. if income==13
replace famincome=. if income==".a"
replace famincome=. if income==".i"
replace famincome=. if income==".s"

*** recoverig all values that have information from your original variable** 
replace famincome=1 if income==1
replace famincome=2 if income==2
replace famincome=3 if income==3
replace famincome=4 if income==4
replace famincome=5 if income==5
replace famincome=6 if income==6
replace famincome=7 if income==7
replace famincome=8 if income==8
replace famincome=9 if income==9
replace famincome=10 if income==10
replace famincome=12 if income==12

tab famincome

*** This is your new variable, notice that it no longer has helpful labels, you need to relable the responses followig the coding scheme of the original variable, see below ***

label define famincomel 1 "lt $1000" 2 "$1000 to 2999" 3 "$3000 to 3999" 4 "$4000 to 4999" 5 "$5000 to 5999" 6  "$6000 to 6999" 7 "$7000 to 7999" 8 "$8000 to 9999" 9 "$10000 - 14999" 10 "$15000 - 19999" 11 "$20000 - 24999" 12 "$25000 or more"

label values famincome famincomel

**** Now you can tabulate your variable and get a labeled easry to read tabulation showing descriptive results***

tab famincome

/*

*****   famincome |      Freq.     Percent        Cum.
---------------+-----------------------------------
      lt $1000 |        116        2.40        2.40
 $1000 to 2999 |         81        1.67        4.07
 $3000 to 3999 |         41        0.85        4.92
 $4000 to 4999 |         25        0.52        5.44
 $5000 to 5999 |         35        0.72        6.16
 $6000 to 6999 |         21        0.43        6.59
 $7000 to 7999 |         32        0.66        7.26
 $8000 to 9999 |         98        2.03        9.28
$10000 - 14999 |        309        6.39       15.67
$15000 - 19999 |        217        4.49       20.16
$25000 or more |      3,862       79.84      100.00
---------------+-----------------------------------
         Total |      4,837      100.00

*/
