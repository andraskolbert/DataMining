*------------------------------------------------------------*;
* Formula Code;
*------------------------------------------------------------*;
R_energy =(1/3)*(energy - MIN(energy,energy)) /(MAX(energy,energy) - MIN(energy,energy)) ;
R_electro =(1/3)*(1-(acousticness - MIN(acousticness,acousticness)) /(MAX(acousticness,acousticness) - MIN(acousticness,acousticness))) ;
R_loud =(1/3)* (loudness- MIN(loudness,loudness)) /(MAX(loudness,loudness) - MIN(loudness,loudness)) ;
