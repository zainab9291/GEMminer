base = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/';

%strIdList='23371062';
%strIdList='23394468';
strIdList='8555649';
url=[base 'efetch.fcgi?db=pubmed&id=' strIdList];
mycontent=urlread(url);
allword=mycontent;
SplitString=regexp(allword,'abstract "','split');
SplitString{2};
myabstract=SplitString{2};
s1=regexp(myabstract,'.[\s]*"','split')
s1{1}
ss1=regexp(myabstract,'\."','split')%not true
ss1{1}
sss1=regexp(myabstract,'\."|\. "','split')%not true
sss1{1}
s1theTrueone=regexp(myabstract,'.",\n','split')%semitrue
s1theTrueone{1}
s1theTrueone1=regexp(myabstract,'\.[\s]*",\n'|'[\s]*",\n','split')%true in shaa allah
s1theTrueone1{1}
