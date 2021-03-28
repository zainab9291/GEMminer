function [ Result_your_query ] = myQueryID( yourQuery )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
baseURL = 'http://eutils.ncbi.nlm.nih.gov/entrez/eutils/';
eutil = 'esearch.fcgi?';
dbParam = 'db=pubmed';
%termParam = '&term=glucose-6-phosphate isomerase';
termParam=['&term=' yourQuery];
RETMAX='&retmax=100000';
% mindate='&mindate=1999';
% maxdate='&maxdate=2012';
%esearchURL = [baseURL, eutil, dbParam, termParam, RETMAX ,mindate ,maxdate];
esearchURL = [baseURL, eutil, dbParam, termParam, RETMAX];
searchReport = webread(esearchURL);
matches = regexp(searchReport,'<Id>(.*)</Id>','match');
k=regexp(matches,'\w+\d+\w','match');
if isempty(k)
    Result_your_query=k;
    disp('No result querys')
else
c=char(k{1});
Result_your_query=str2num(c);
end
end

