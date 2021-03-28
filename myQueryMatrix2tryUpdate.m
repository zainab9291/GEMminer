function [resultWords result_your_query result]=myQueryMatrix2tryUpdate(yourQuery,m,n)
[ result_your_query ] = myQueryID( yourQuery);
result_your_query

%'glucose-6-phosphate isomerase'
[Abstract,mask,words_count]=wordCountPubMed1_11_2016(result_your_query(m));
for i=m+1:n
i
[Abstract,words,words_count]=wordCountPubMed1_11_2016(result_your_query(i));
resultWords=union(mask,words);
mask=resultWords;
end


for i=m:n
    [Abstract,words,words_count]=wordCountPubMed1_11_2016(result_your_query(i));
    for j=1:length(resultWords)
    result(j,i)=numel(regexp(Abstract,resultWords{j},'match'));
    end
    %disp(i)
end


resultWords=resultWords';



