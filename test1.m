 
 k=resultID(1001:1100,:);
 hh={''};
for i=1:length(k)
hh(i)={num2str(k(i))};
end
%convert double id array to cell array
 
 SplitString={''};
 IDlist={''};
    h=resultID(1001:1100);
    strIdList=sprintf(',%d',h);
    strIdList(1)=' ';
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
    
        %AbsList=[IDlist',SplitString'];
        clear AbsList
%         AbsList.ID={''};
%         AbsList.Abstract={''};
        AbsList.ID=IDlist';
        AbsList.Abstract=SplitString';
        
        setdiff(hh',AbsList.ID);
        %compare result id with our already id
