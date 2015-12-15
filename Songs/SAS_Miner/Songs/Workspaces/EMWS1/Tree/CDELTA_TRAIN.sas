if name = '_NODE_' then do;
role = 'SEGMENT';
level = 'NOMINAL';
end;
if upcase(name) = 'ACOUSTICNESS' then role = 'INPUT';
else
if upcase(name) = 'DANCEABILITY' then role = 'INPUT';
else
if upcase(name) = 'LOUDNESS' then role = 'INPUT';
else
if upcase(name) = 'INSTRUMENTALNESS' then role = 'INPUT';
else
if upcase(name) = 'ENERGY' then role = 'INPUT';
if upcase(name) = 'Q_genrerock' then role = "ASSESS";
if upcase(name) = 'Q_genrepop' then role = "ASSESS";
if upcase(name) = 'Q_genremetal' then role = "ASSESS";
if upcase(name) = 'Q_genrejazz' then role = "ASSESS";
if upcase(name) = 'Q_genreclassical' then role = "ASSESS";
