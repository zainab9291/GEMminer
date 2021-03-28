function [ Model,React,Meta ] = ModelReactMetaFunc1( fileName )
%ModelReacGeneFunc take paper number extract model name , reactions and metabolites information 
[Abstract,words,words_count]=wordCountPubMed1_11_2016(fileName);
Model=unique(regexp(Abstract,'i\w+\d+','match'));
if numel(Model)>=2
    Model={'there is two or more Model'};
end
if numel(Model)==0
    
       
       Model={' '};
end
React=regexp(Abstract,'((\d+)|(\d+)\,(\d+)) reaction','match');
if numel(React)>=2
    React={'there is two or more reactions'};
end
    
if numel(React)==0
    
        React={' '};
end
Meta=regexp(Abstract,'((\d+)|(\d+)\,(\d+)) (metabolites|\w+ metabolites)','match');
if numel(Meta)>=2
    Meta={'there is two or more Meta'};
end
% if numel(Meta)==0
%     
%         Meta=regexp(Abstract,'(\d+)\,(\d+) \w+ metabolites','match');
%         if numel(Meta)>=2
%     Meta={'there is two or more Meta'};
% end
% end
if numel(Meta)==0
    
        Meta={' '};
end



end

