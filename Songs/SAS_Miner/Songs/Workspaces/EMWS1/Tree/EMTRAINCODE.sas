*------------------------------------------------------------*;
* Tree: Create decision matrix;
*------------------------------------------------------------*;
data WORK.genre;
  length   genre                            $  32
           COUNT                                8
           DATAPRIOR                            8
           TRAINPRIOR                           8
           DECPRIOR                             8
           DECISION1                            8
           DECISION2                            8
           DECISION3                            8
           DECISION4                            8
           DECISION5                            8
           ;

  label    COUNT="Level Counts"
           DATAPRIOR="Data Proportions"
           TRAINPRIOR="Training Proportions"
           DECPRIOR="Decision Priors"
           DECISION1="ROCK"
           DECISION2="POP"
           DECISION3="METAL"
           DECISION4="JAZZ"
           DECISION5="CLASSICAL"
           ;
  format   COUNT 10.
           ;
genre="ROCK"; COUNT=445; DATAPRIOR=0.19551845342706; TRAINPRIOR=0.19551845342706; DECPRIOR=.; DECISION1=1; DECISION2=0; DECISION3=0; DECISION4=0; DECISION5=0;
output;
genre="POP"; COUNT=465; DATAPRIOR=0.2043057996485; TRAINPRIOR=0.2043057996485; DECPRIOR=.; DECISION1=0; DECISION2=1; DECISION3=0; DECISION4=0; DECISION5=0;
output;
genre="METAL"; COUNT=465; DATAPRIOR=0.2043057996485; TRAINPRIOR=0.2043057996485; DECPRIOR=.; DECISION1=0; DECISION2=0; DECISION3=1; DECISION4=0; DECISION5=0;
output;
genre="JAZZ"; COUNT=463; DATAPRIOR=0.20342706502636; TRAINPRIOR=0.20342706502636; DECPRIOR=.; DECISION1=0; DECISION2=0; DECISION3=0; DECISION4=1; DECISION5=0;
output;
genre="CLASSICAL"; COUNT=438; DATAPRIOR=0.19244288224956; TRAINPRIOR=0.19244288224956; DECPRIOR=.; DECISION1=0; DECISION2=0; DECISION3=0; DECISION4=0; DECISION5=1;
output;
;
run;
proc datasets lib=work nolist;
modify genre(type=PROFIT label=genre);
label DECISION1= 'ROCK';
label DECISION2= 'POP';
label DECISION3= 'METAL';
label DECISION4= 'JAZZ';
label DECISION5= 'CLASSICAL';
run;
quit;
*------------------------------------------------------------* ;
* Tree: Tree Variables Macro ;
*------------------------------------------------------------* ;
%macro EM_TREEVARS;
    acousticness danceability energy instrumentalness loudness
%mend EM_TREEVARS;
*------------------------------------------------------------* ;
* Tree: Tree Targets Macro ;
*------------------------------------------------------------* ;
%macro EM_TREETARGETS;
    genre
%mend EM_TREETARGETS;
data EMWS1.EM_Tree / view=EMWS1.EM_Tree;
set EMWS1.GrfExpl_TRAIN(keep=%EM_TREEVARS %EM_TREETARGETS);
run;
*------------------------------------------------------------* ;
* Tree: Interval Inputs Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    acousticness danceability energy instrumentalness loudness
%mend INTINPUTS;
*------------------------------------------------------------* ;
* Tree: Binary and Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;

%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Tree: Ordinal Inputs Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* Tree: Run ARBOR procedure;
*------------------------------------------------------------*;
proc arbor data=EMWS1.EM_Tree
Leafsize=5
Mincatsize = 5
Maxbranch=2
Maxdepth=6
alpha = 0.2
Padjust=
CHAIDBEFORE
DEPTH
MAXRULES=5
MAXSURRS=0
Missing=USEINSEARCH
Exhaustive=5000
event='ROCK'
;
;
input %INTINPUTS
/ level = interval;
target genre / level=NOMINAL
Criterion=PROBCHISQ
;
;
Performance DISK
NodeSize=20000
;
Assess
NoValidata
measure=MISC
;
SUBTREE BEST
;
MAKEMACRO NLEAVES=nleaves;
save
MODEL=EMWS1.Tree_EMTREE
SEQUENCE=EMWS1.Tree_OUTSEQ
IMPORTANCE=EMWS1.Tree_OUTIMPORT
NODESTAT=EMWS1.Tree_OUTNODES
SUMMARY=EMWS1.Tree_OUTSUMMARY
STATSBYNODE=EMWS1.Tree_OUTSTATS
Topology=EMWS1.Tree_OUTTOPOLOGY
Pathlistnonmissing = EMWS1.Tree_OUTPATH
Rules = EMWS1.Tree_OUTRULES
;
code file="F:\Dropbox\NOVA\1st\DataMining\Project\DataMining\Songs\SAS_Miner\Songs\Workspaces\EMWS1\Tree\EMPUBLISHSCORE.sas"
group=Tree
;
code file="F:\Dropbox\NOVA\1st\DataMining\Project\DataMining\Songs\SAS_Miner\Songs\Workspaces\EMWS1\Tree\EMFLOWSCORE.sas"
group=Tree
residual
;
score data=EMWS1.EM_Tree out=_NULL_
outfit=WORK.FIT1
role=TRAIN
;
run;
quit;
%put &nleaves;
data EMWS1.Tree_OUTFIT;
merge WORK.FIT1;
run;
data EMWS1.Tree_OUTIMPORT;
set EMWS1.Tree_OUTIMPORT;
label NAME = "%sysfunc(sasmsg(sashelp.dmine, meta_name_vlabel, noquote))" LABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_label_vlabel, noquote))" NRULES = "%sysfunc(sasmsg(sashelp.dmine, rpt_nrules_vlabel, noquote))" IMPORTANCE =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_importance_vlabel, noquote))" NSURROGATES = "%sysfunc(sasmsg(sashelp.dmine, rpt_nsurrogates_vlabel, noquote))"
;
run;
