*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS1 "F:\Dropbox\NOVA\1st\DataMining\Project\DataMining\Songs\SAS_Miner\Songs\Workspaces\EMWS1";
*------------------------------------------------------------*;
* Ids: Creating DATA data;
*------------------------------------------------------------*;
data EMWS1.Ids_DATA (label="")
/ view=EMWS1.Ids_DATA
;
set DM.SONGS_WITHID;
run;
