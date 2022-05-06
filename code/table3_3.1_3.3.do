*preliminaries
clear
*set up
version 16.0 //specify version
capture log close //closes unclosed logs
set more off //prevents pausing when window is full


ssc install estout

****Table 3 

estimates clear 
xtset fipsstat year 

*log violent crime rate
xtreg lvio shalll aovio density rpcpi rpcui rpcim rpcrpo popstate ppbm* ppbf* ppwm* ppwf* ppnm* ppnf* yr*, fe
estimates store fe1

*log murder rate
xtreg lmur shalll aomur density rpcpi rpcui rpcim rpcrpo popstate ppbm* ppbf* ppwm* ppwf* ppnm* ppnf* yr*, fe
estimates store fe2

*log rape rate
xtreg lrap shalll aorap density rpcpi rpcui rpcim rpcrpo popstate ppbm* ppbf* ppwm* ppwf* ppnm* ppnf* yr*, fe
estimates store fe3

*log aggravated assault rate
xtreg laga shalll aoaga density rpcpi rpcui rpcim rpcrpo popstate ppbm* ppbf* ppwm* ppwf* ppnm* ppnf* yr*, fe
estimates store fe4 

*log robbery rate
xtreg lrob shalll aorob density rpcpi rpcui rpcim rpcrpo popstate ppbm* ppbf* ppwm* ppwf* ppnm* ppnf* yr*, fe
estimates store fe5 

*log property crime rate
xtreg lpro shalll aopro density rpcpi rpcui rpcim rpcrpo popstate ppbm* ppbf* ppwm* ppwf* ppnm* ppnf* yr*, fe
estimates store fe6 

*log burglary rate
xtreg lbur shalll aobur density rpcpi rpcui rpcim rpcrpo popstate ppbm* ppbf* ppwm* ppwf* ppnm* ppnf* yr*, fe
estimates store fe7 

*log larceny rate
xtreg llar shalll aolar density rpcpi rpcui rpcim rpcrpo popstate ppbm* ppbf* ppwm* ppwf* ppnm* ppnf* yr*, fe
estimates store fe8 

*log auto theft rate
xtreg laut shalll aoaut density rpcpi rpcui rpcim rpcrpo popstate ppbm* ppbf* ppwm* ppwf* ppnm* ppnf* yr*, fe
estimates store fe9

esttab fe1 fe2 fe3 fe4 fe5 using table3.11.rtf, cells(b(star fmt(4)) t(par fmt(2))) stats(N F r2) label title(Two-Way Fixed Effects Model) nonumbers mtitles("log(Violent Crime Rate)" "log(Murder Rate)" "log(Rape Rate)" "log(Aggravated Assault Rate)" "log(Robbery Rate)")

esttab fe6 fe7 fe8 fe9 using table3.2.rtf, cells(b(star fmt(4)) t(par fmt(2))) stats(N F r2) label title(Two-Way Fixed Effects Model) nonumbers mtitles("log(Property Crime Rate)" "log(Burglary Rate)" "log(Larceny Rate)" "log(Auto Theft Rate)")

