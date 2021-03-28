function [ Model,React,Meta ] = ModelReactMetaFunc( fileName )
%ModelReacGeneFunc take paper number extract model name , reactions and metabolites information 
[Abstract,words,words_count]=wordCountPubMed1_11_2016(fileName);
Model=unique(regexp(Abstract,'i\w+\d+','match'));
if cellfun('isempty',Model)
    
        Model='there is no model name ';
end
React=regexp(Abstract,'(\d+) reaction','match');
if cellfun('isempty',React)
    
        React='there is no Reaction ';
end
Meta=regexp(Abstract,'(\d+) metabolites','match');
if cellfun('isempty',Meta)
    
        Meta=regexp(Abstract,'(\d+) \w+ metabolites','match');
end



end

