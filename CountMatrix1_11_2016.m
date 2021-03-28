function [countMatrix]=CountMatrix1_11_2016()
%this function to compare the similarity of words in abstract that have abstractID with other
%abstracts come from excel file
filename='impoData.xlsx';
% the following statments is working on excel file to extract the union of
% words from all abstracts in all IDs
[num,txt,raw]=xlsread(filename);
q=txt(2:end,9);
k=regexp(q(2),'\w+\d+\w','match');
f=cell2mat(k{:});
d=str2num(f);
c=zeros(1,length(q));
c(1)=d;
[Abstract,mask,words_count]=wordCountPubMed1_11_2016(d);
for i=2:length(q)
k=regexp(q(i),'\w+\d+\w','match');
f=cell2mat(k{:});
d=str2num(f);
c(i)=d;
[Abstract,words,words_count]=wordCountPubMed1_11_2016(d);
resultWords=union(mask,words);
mask=resultWords;
end
n=length(c);
%the following loop is to compare union of words in abstracts  with
%other abstracts coming from excel file
for i=1:n
    [Abstract,words,words_count]=wordCountPubMed1_11_2016(c(i));
    for j=1:length(resultWords)
    result(j,i)=numel(regexp(Abstract,resultWords{j},'match'));
    end
    %disp(i)
end

countMatrix=cell(numel(resultWords)+1,n+1);
resultWords=resultWords';
c=num2cell(c);
countMatrix(1,2:end)= c;
countMatrix(2:end,1)=resultWords;
result=num2cell(result);
countMatrix(2:end,2:end)=result;


