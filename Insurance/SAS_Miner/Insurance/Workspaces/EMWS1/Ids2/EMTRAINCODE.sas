*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS1 "F:\Dropbox\NOVA\1st\DataMining\Project\DataMining\Insurance\SAS_Miner\Insurance\Workspaces\EMWS1";
*------------------------------------------------------------*;
* Ids2: Creating DATA data;
*------------------------------------------------------------*;
data EMWS1.Ids2_DATA (label="")
/ view=EMWS1.Ids2_DATA
;
set DM.INSURANCE_BASE;
run;
