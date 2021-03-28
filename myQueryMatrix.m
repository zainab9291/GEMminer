function [countMatrix]=myQueryMatrix(yourQuery)
[ result_your_query ] = myQueryID( yourQuery);
result_your_query
[Abstract,mask,words_count]=wordCountPubMed1_11_2016(result_your_query(1));
for i=2:length(result_your_query)
i
[Abstract,words,words_count]=wordCountPubMed1_11_2016(result_your_query(i));
resultWords=union(mask,words);
mask=resultWords;
end
n=length(result_your_query);

for i=1:n
    [Abstract,words,words_count]=wordCountPubMed1_11_2016(result_your_query(i));
    for j=1:length(resultWords)
    result(j,i)=numel(regexp(Abstract,resultWords{j},'match'));
    end
    %disp(i)
end

countMatrix=cell(numel(resultWords)+1,n+1);
resultWords=resultWords';
result_your_query=num2cell(result_your_query);
countMatrix(1,2:end)= result_your_query;
countMatrix(2:end,1)=resultWords;
result=num2cell(result);
countMatrix(2:end,2:end)=result;


