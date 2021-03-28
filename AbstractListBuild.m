function [ AbstractList ] = AbstractListBuild( resultID )
% make aconnection between every id with its abstract 
%   by making cell matrix collecting them

 numID=numel(resultID);
 AbstractList=cell(numID,2);
 
 for j=1:100:numID
     SplitString={''};
     IDlist={''};
    
    h=resultID(j:j+99);
    strIdList=sprintf(',%d',h);
    strIdList(j)=' ';
    base = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/';
    url=[base 'efetch.fcgi?db=pubmed&id=' strIdList];
    mycontent=urlread(url);
    allword=mycontent;
    SplitString=regexp(allword,'abstract "','split');
    SplitString{1}='';
    SplitString(strcmp('',SplitString)) = [];
    %this line remove the empty element 

    for i=1:numel(SplitString)
        myabstract=SplitString{i};
        s1=regexp(myabstract,'."','split');
        %split the string to find  where the abstract ending in a xml
        s2=regexp(myabstract,'pmid','split');
        s3=regexp(s2{2},'\d+','match');
        
        Abstract=s1{1};
        ID=s3;
        
        SplitString{i}=Abstract;
        IDlist(i)=ID;
        
    end
%     a=IDlist'
%     a{1}
%     b=SplitString'
%     I=length(IDlist')
%     S=length(SplitString')
    
    AbsList=[IDlist',SplitString'];
    k=length(AbsList);
    AbstractList(j:(j+k)-1,:)=AbsList;
 end


end

