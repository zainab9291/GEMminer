function [Parags,IDpaper] = ExtractParag( myPMCID,IDpaper)
% extract pragraphs from URL
PMCID=char(myPMCID);
base = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/';
url2=[base 'efetch.fcgi?db=pmc&id=' PMCID];
FULLTEXT=webread(url2);
Parags = regexp(FULLTEXT,'<(\p)>(.*?)</\p>','match');
%IDParag=regexp(FULLTEXT,'<Id>(.*)<Id>','match');
