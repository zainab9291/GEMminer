function [ k] = TOEASYReadURL( ID)
ID=num2str(ID);
%convert filename number or ID  to string for use it in url
base = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/';
url=[base 'efetch.fcgi?db=pubmed&id=' ID];
%urlread(url)
k=urlread(url);
end

