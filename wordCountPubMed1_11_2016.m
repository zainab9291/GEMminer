function [Abstract,words,words_count]=wordCountPubMed1_11_2016(fileName)
%fileName=24708835;
%fileName=18500999;
%fileName=3495970;
ID=num2str(fileName);
    %ID=num2str(22529767);
    %convert filename number or ID  to string for use it in url 
    base = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/';
    url=[base 'efetch.fcgi?db=pubmed&id=' ID];
mycontent=urlread(url);
%read url and store it on mycontent variable
allword=mycontent;
SplitString=regexp(allword,'abstract "','split');
%split the string to find where the abstract begining in a allword  
if length(SplitString)>1
    myabstract=SplitString{2};
else
    myabstract=' ' ;
end
%access second  element that contain abstract beganing  from  cell array SplitString 
s1=regexp(myabstract,'."','split');
%split the string to find  where the abstract ending in a xml  
Abstract=s1{1};
%access first  element that contain abstract  from  cell array s1 
myword=regexp(Abstract,' ','split');
%split ABstract to words
myword1=regexp(myword,'\.','split');
%remove . from words
%because the previous regular exepresion return nested cell array the
%following loop from line 24-28 is to un-nest this array
n = length(myword1);
word= cell(1,n);
for i = 1:n
    word{i} = cell2mat(myword1{i});
end%end for
%disp(word)comp
words = unique(word);
for i=1:numel(words)
    
%     if ismember(words(i),'a')||ismember(words(i),'an')||ismember(words(i),'the')||ismember(words(i),'for')...
%             ||ismember(words(i),'is')||ismember(words(i),'in')||ismember(words(i),'on')...
%             ||ismember(words(i),'at')||ismember(words(i),'are')||ismember(words(i),'of')...
%             ||ismember(words(i),'to')||ismember(words(i),'by')||ismember(words(i),'The')...
%             ||ismember(words(i),'with')||ismember(words(i),'(')||ismember(words(i),')')...
%             ||ismember(words(i),'"')
%             
%         words{i}=[];
%     end
%for i=1:numel(words);
words{i}=filter_word(words{i});
words{i}=remove_Symbols(words{i});
end
words=words(~cellfun('isempty',words));
%the following loop to count occurence of each word
words_count=zeros(1,numel(words));
for i=1:numel(words)
  words_count(i)=sum(ismember(word,words(i)));
end





