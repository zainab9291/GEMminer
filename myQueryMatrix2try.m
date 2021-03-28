function [resultWords result_your_query result]=myQueryMatrix2try(yourQuery,p)
[ result_your_query ] = myQueryID( yourQuery);
result_your_query
%'glucose-6-phosphate isomerase'
[Abstract,mask,words_count]=wordCountPubMed1_11_2016(result_your_query(1));
for i=2:p
i
[Abstract,words,words_count]=wordCountPubMed1_11_2016(result_your_query(i));
resultWords=union(mask,words);
mask=resultWords;
end


for i=1:p
    [Abstract,words,words_count]=wordCountPubMed1_11_2016(result_your_query(i));
    for j=1:length(resultWords)
    result(j,i)=numel(regexp(Abstract,resultWords{j},'match'));
    end
    %disp(i)
end


resultWords=resultWords';
%result_your_query=num2cell(result_your_query);
%result=num2cell(result);



