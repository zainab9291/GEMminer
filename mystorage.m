function [finalstorage]=mystorage(yourQuery)
[ result_your_query ] = myQueryID( yourQuery);
a=1;
b=20;
mystorage={};

for i=1:numel(result_your_query)
    [resultWords result_your_query result]=myQueryMatrix2tryUpdate(yourQuery,a,b);
    a=b+1;
    b=a+20;
    n=numel(resultWords);
    m=numel(mystorage);
    for j=1:n
        mystorage(m+j)=resultWords(j);
    end
end
finalstorage=mystorage;
