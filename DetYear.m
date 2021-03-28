function [paper_year] = DetYear( Paper_ID )
%DetYear to detrminie the year of published paper
ID=Paper_ID;
base = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/';
url1=[base 'efetch.fcgi?db=pubmed&id=' ID];
mycontent=urlread(url1);
a=regexp(mycontent, 'imp {\n[^\n]*date std {\n[^\n]*year \d+', 'match');
b=a{:};
k=regexp(b,'\d+','match');
paper_year=str2num(k{:});

end

