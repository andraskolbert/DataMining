*------------------------------------------------------------* ;
* Plot3: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    ClaimsRate(ASC) Compensation(ASC) CustomerAge(ASC) CustomerMonetaryValue(ASC)
   EducationalDegree(ASC) FirstPolicyYear(ASC) GeographicLivingArea(ASC)
   GrossMonthlySalary(ASC) HasChildren(ASC) Health(ASC) Household(ASC) Life(ASC)
   Motor(ASC)
%mend DMDBClass;
*------------------------------------------------------------*;
* Plot3: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS1.Ids2_DATA
dmdbcat=WORK.Plot3_DMDB
maxlevel = 23
nonorm
;
class %DMDBClass;
run;
quit;
*------------------------------------------------------------*;
* Plot3: Creating univariate histograms;
*------------------------------------------------------------*;
goptions ftext="SWISS";
goptions nodisplay device=PNG;
axis1 width=2 offset=(1,1) label=(rotate=90 angle=270) minor=none;
axis2 width=2 minor=none;
pattern1 value=solid;
proc gchart
data=EMWS1.Ids2_DATA gout=WORK.Plot3GRAPH;
*;
title "ClaimsRate";
vbar ClaimsRate /
name = "ClaimsRate" description = "ClaimsRate"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "Compensation";
vbar Compensation /
name = "Compensation" description = "Compensation"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "CustomerAge";
vbar CustomerAge /
name = "CustomerAge" description = "CustomerAge"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "CustomerMonetaryValue";
vbar CustomerMonetaryValue /
name = "CustomerMonetaryValue" description = "CustomerMonetaryValue"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "EducationalDegree";
vbar EducationalDegree /
name = "EducationalDegree" description = "EducationalDegree"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "FirstPolicyYear";
vbar FirstPolicyYear /
name = "FirstPolicyYear" description = "FirstPolicyYear"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "GeographicLivingArea";
vbar GeographicLivingArea /
name = "GeographicLivingArea" description = "GeographicLivingArea"
FREQ
type=FREQ
noframe
missing
discrete
raxis=axis1 maxis=axis2;
run;
title "GrossMonthlySalary";
vbar GrossMonthlySalary /
name = "GrossMonthlySalary" description = "GrossMonthlySalary"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "HasChildren";
vbar HasChildren /
name = "HasChildren" description = "HasChildren"
FREQ
type=FREQ
noframe
missing
discrete
raxis=axis1 maxis=axis2;
run;
title "Health";
vbar Health /
name = "Health" description = "Health"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "Household";
vbar Household /
name = "Household" description = "Household"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "Life";
vbar Life /
name = "Life" description = "Life"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "Motor";
vbar Motor /
name = "Motor" description = "Motor"
FREQ
type=FREQ
noframe
missing
raxis=axis1 maxis=axis2;
run;
quit;
title;
goptions display;
*------------------------------------------------------------*;
* Plot3: Copying graphs to node folder;
*------------------------------------------------------------*;
filename gsasfile "F:\Dropbox\NOVA\1st\DataMining\Project\DataMining\Insurance\SAS_Miner\Insurance\Workspaces\EMWS1\Plot3\GRAPH\ClaimsRate.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT3GRAPH nofs;
replay CLAIMSRA;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "F:\Dropbox\NOVA\1st\DataMining\Project\DataMining\Insurance\SAS_Miner\Insurance\Workspaces\EMWS1\Plot3\GRAPH\Compensation.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT3GRAPH nofs;
replay COMPENSA;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "F:\Dropbox\NOVA\1st\DataMining\Project\DataMining\Insurance\SAS_Miner\Insurance\Workspaces\EMWS1\Plot3\GRAPH\CustomerMonetaryValue.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT3GRAPH nofs;
replay CUSTOME1;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "F:\Dropbox\NOVA\1st\DataMining\Project\DataMining\Insurance\SAS_Miner\Insurance\Workspaces\EMWS1\Plot3\GRAPH\CustomerAge.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT3GRAPH nofs;
replay CUSTOMER;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "F:\Dropbox\NOVA\1st\DataMining\Project\DataMining\Insurance\SAS_Miner\Insurance\Workspaces\EMWS1\Plot3\GRAPH\EducationalDegree.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT3GRAPH nofs;
replay EDUCATIO;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "F:\Dropbox\NOVA\1st\DataMining\Project\DataMining\Insurance\SAS_Miner\Insurance\Workspaces\EMWS1\Plot3\GRAPH\FirstPolicyYear.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT3GRAPH nofs;
replay FIRSTPOL;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "F:\Dropbox\NOVA\1st\DataMining\Project\DataMining\Insurance\SAS_Miner\Insurance\Workspaces\EMWS1\Plot3\GRAPH\GeographicLivingArea.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT3GRAPH nofs;
replay GEOGRAPH;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "F:\Dropbox\NOVA\1st\DataMining\Project\DataMining\Insurance\SAS_Miner\Insurance\Workspaces\EMWS1\Plot3\GRAPH\GrossMonthlySalary.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT3GRAPH nofs;
replay GROSSMON;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "F:\Dropbox\NOVA\1st\DataMining\Project\DataMining\Insurance\SAS_Miner\Insurance\Workspaces\EMWS1\Plot3\GRAPH\HasChildren.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT3GRAPH nofs;
replay HASCHILD;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "F:\Dropbox\NOVA\1st\DataMining\Project\DataMining\Insurance\SAS_Miner\Insurance\Workspaces\EMWS1\Plot3\GRAPH\Health.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT3GRAPH nofs;
replay HEALTH;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "F:\Dropbox\NOVA\1st\DataMining\Project\DataMining\Insurance\SAS_Miner\Insurance\Workspaces\EMWS1\Plot3\GRAPH\Household.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT3GRAPH nofs;
replay HOUSEHOL;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "F:\Dropbox\NOVA\1st\DataMining\Project\DataMining\Insurance\SAS_Miner\Insurance\Workspaces\EMWS1\Plot3\GRAPH\Life.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT3GRAPH nofs;
replay LIFE;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "F:\Dropbox\NOVA\1st\DataMining\Project\DataMining\Insurance\SAS_Miner\Insurance\Workspaces\EMWS1\Plot3\GRAPH\Motor.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT3GRAPH nofs;
replay MOTOR;
quit;
goptions device=win;
filename gsasfile;
