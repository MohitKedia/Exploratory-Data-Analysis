proc tabulate data=case2.mconfig;
var Retail_Price;
class Bundle_Apps;
table Bundle_Apps*Retail_Price*mean; 
run;