*preliminaries
clear
*set up
version 16.0 //specify version
capture log close //closes unclosed logs
set more off //prevents pausing when window is full


ssc install asdoc 
ssc install estout

*Bacon decomposition
net install ddtiming, from(https://tgoldring.com/code/)
net get ddtiming

ddtiming lvio shalll, i(fipsstat) t(year)

ddtiming lmur shalll, i(fipsstat) t(year)

ddtiming lrap shalll, i(fipsstat) t(year)

ddtiming laga shalll, i(fipsstat) t(year)

ddtiming lrob shalll, i(fipsstat) t(year)

ddtiming lpro shalll, i(fipsstat) t(year)

ddtiming lbur shalll, i(fipsstat) t(year)

ddtiming llar shalll, i(fipsstat) t(year)

ddtiming laut shalll, i(fipsstat) t(year)
