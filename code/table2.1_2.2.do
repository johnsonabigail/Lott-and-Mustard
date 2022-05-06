*preliminaries
clear
*set up
version 16.0 //specify version
capture log close //closes unclosed logs
set more off //prevents pausing when window is full


ssc install asdoc 

****Table 2.1 & 2.2

asdoc sum shalll aovio aopro aomur aorap aoaga aorob aobur aolar aoaut ratvio ratpro ratmur ratrap ratrob rataga ratbur ratlar rataut rpcpi rpcui rpcim rpcrpo density popstate, stat(N mean sd) label replace save(sumstats1.doc)

asdoc sum ppbm1019 ppbf1019 ppwm1019 ppwf1019 ppnm1019 ppnf1019 ppbm2029 ppbf2029 ppwm2029 ppwf2029 ppnm2029 ppnf2029 ppbm3039 ppbf3039 ppwm3039 ppwf3039 ppnm3039 ppnf3039 ppbm4049 ppbf4049 ppwm4049 ppwf4049 ppnm4049 ppnf4049 ppbm5064 ppbf5064 ppwm5064 ppwf5064 ppnm5064 ppnf5064 ppbm65o ppbf65o ppwm65o ppwf65o ppnm65o ppnf65o, stat(N mean sd) label replace save(sumstats2.doc)
