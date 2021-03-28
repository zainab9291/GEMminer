function [ MyQuery ] = QueryExcel( exlFile,exlIndex )
%we arranged all queries in excel so in this function we extract specific query by the name of cell

[ndata, text, alldata] = xlsread(exlFile, 1, exlIndex);
MyQuery =text;
end

