function [FULLTEXT, PMCID]=FULLTEXTwordCountPubMed(fileName)
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
mycontent=urlread(url1);
flag=regexp(mycontent,'PMC\d+','match');
if numel(flag)==0
    FULLTEXT='';
    PMCID='';
else
    PMCID=regexp(flag,'\d+','match');
    %PMCID=num2str(PMCID{:});
    PMCID=char(PMCID{:});
url2=[base 'efetch.fcgi?db=pmc&id=' PMCID];
FULLTEXT=urlread(url2);
%read url and store it on FULLTEXT variable
%PMCID=regexp(flag,'\d+','match');
end



%regexp(FULLTEXT,'((\d+)|(\d+)\,(\d+)) reaction','match')