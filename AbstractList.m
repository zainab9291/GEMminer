function [ AbsList,lost] = AbstractList(resultID,s,e)
% make aconnection between every id with its abstract 
%   by making cell matrix collecting them

% numID=length(resultID);
% numloop=fix(numID/100);
% for j=1:numloop

 
 k=resultID(s:e,:);
 hh={''};
for i=1:length(k)
hh(i)={num2str(k(i))};
end
%convert double id array to cell array
 
 SplitString={''};
 IDlist={''};
    h=resultID(s:e);
    strIdList=sprintf(',%d',h);
    strIdList(1)='';
    base = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/';
    url=[base 'efetch.fcgi?db=pubmed&id=' strIdList];
    url
    mycontent=webread(url);
    allword=mycontent;
    SplitString=regexp(allword,'abstract "','split');
    SplitString{1}='';
    SplitString(strcmp('',SplitString)) = [];
    %this line remove the empty element 

    for i=1:numel(SplitString)
        myabstract=SplitString{i};
        %s1=regexp(myabstract,'."','split');
        s1=regexp(myabstract,'\.[\s]*",\n','split');
        %split the string to find  where the abstract ending in a xml
        s2=regexp(myabstract,'pmid','split');
        s3=regexp(s2{2},'\d+','match');
        
        Abstract=s1{1};
        ID=s3;
        
        SplitString{i}=Abstract;
        IDlist(i)=ID;
    end
    clear AbsList
        %AbsList=[IDlist',SplitString'];
        AbsList.ID=IDlist';
        AbsList.Abstract=SplitString';
        
        %lost=setdiff(hh',AbsList(:,1));
        lost=setdiff(hh',AbsList.ID);
        %compare result id with our already id


end

