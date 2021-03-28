function [myPMCID]=FULLTEXTFilterSen(fileName)
%fileName=24708835;
%fileName=18500999;
%fileName=3495970;
%fileName=22529767;pmcid=3329150
%fileName=22529767
ID=num2str(fileName);
%ID='3329150';
%convert filename number or ID  to string for use it in url 
base = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/';
url1=[base 'efetch.fcgi?db=pubmed&id=' ID];
mycontent=webread(url1);
flag=regexp(mycontent,'PMC\d{4,15}','match');
flag=unique(flag);
if numel(flag)==0
    FULLTEXT={''};
    myPMCID={''};
else
    myPMCID=regexp(flag,'\d+','match');
    %PMCID=num2str(PMCID{:});
    PMCID=char(myPMCID{:});
url2=[base 'efetch.fcgi?db=pmc&id=' PMCID];
FULLTEXT=webread(url2);
%read url and store it on FULLTEXT variable
%PMCID=regexp(flag,'\d+','match');
end
myPMCID=myPMCID(~cellfun('isempty',myPMCID));
% FULLTEXT=FULLTEXT(~cellfun('isempty',FULLTEXT));



%regexp(FULLTEXT,'((\d+)|(\d+)\,(\d+)) reaction','match')