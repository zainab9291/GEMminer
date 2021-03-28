function [ Model,React,Meta,MDATAfrom,RDATAfrom,TDATAfrom ] = ModelReactMetaFunc2( fileName )
%ModelReacGeneFunc take paper number extract model name , reactions and metabolites information 
[Abstract,words,words_count]=wordCountPubMed1_11_2016(fileName);
Model=unique(regexp(Abstract,'i\w+\d+','match'));
MDATAfrom={'Abstract'};
if numel(Model)>=2
    Model={'there is two or more Model'};
end
if numel(Model)==0
    [FULLTEXT, PMCID]=FULLTEXTwordCountPubMed(fileName);
    
    if numel(PMCID)~=0
        
        Model=unique(regexp(FULLTEXT,'i\w+\d+','match'));
        MDATAfrom={'PMC full text'};
        if numel(Model)==0
            Model={' '};
            MDATAfrom={'the article has pmc put the publicher does not allow downloadind in xml'};
        elseif numel(Model)>=2
            Model={'there is two or more Model'};
            MDATAfrom={'PMC full text'};
        end
    else
    
       
       Model={' '};
       MDATAfrom={'notPMC'};
    end
    
end
React=unique(regexp(Abstract,'((\d+)|(\d+)\,(\d+)) reaction','match'));
if numel(React)==0
    
        React=unique(regexp(Abstract,'((\d+)|(\d+)\,(\d+))(\s reaction|\s\w+ reaction)','match'));
end
        
    
RDATAfrom={'Abstract'};
if numel(React)>=2
    React={'there is two or more reactions'};
end
    
if numel(React)==0
    [FULLTEXT, PMCID]=FULLTEXTwordCountPubMed(fileName);
    if numel(PMCID)~=0
        React=unique(regexp(FULLTEXT,'((\d+)|(\d+)\,(\d+)) reaction','match'));
        if numel(React)==0
    
        React=unique(regexp(Abstract,'((\d+)|(\d+)\,(\d+))(\s reaction|\s\w+ reaction)','match'));
        end
        %React=unique(regexp(FULLTEXT,'((\d+)|(\d+)\,(\d+))(\s reaction|\s\w+ reaction)','match'));
        RDATAfrom={'PMC full text'};
        if numel(React)==0
            React={' '};
            RDATAfrom={'the article has pmc put the publicher does not allow downloadind in xml'};
        elseif numel(React)>=2
            React={'there is two or more reactions'};
            RDATAfrom={'PMC full text'};
        end
    else
        
        React={' '};
         RDATAfrom={'notPMC'};
    end
end
Meta=unique(regexp(Abstract,'((\d+)|(\d+)\,(\d+)) (metabolites|\w+ metabolites)','match'));
if numel(Meta)==0
    Meta=unique(regexp(Abstract,'((\d+)|(\d+)\,(\d+))(\s metabolites|\s\w+ metabolites)','match'));
end
TDATAfrom={'Abstract'};
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
    [FULLTEXT, PMCID]=FULLTEXTwordCountPubMed(fileName);
    if numel(PMCID)~=0
        Meta=unique(regexp(FULLTEXT,'((\d+)|(\d+)\,(\d+)) (metabolites|\w+ metabolites)','match'));
        if numel(Meta)==0
    Meta=unique(regexp(Abstract,'((\d+)|(\d+)\,(\d+))(\s metabolites|\s\w+ metabolites)','match'));
        end
        %Meta=unique(regexp(FULLTEXT,'((\d+)|(\d+)\,(\d+))(\s metabolites|\s\w+ metabolites)','match'));
        TDATAfrom={'PMC full text'};
        if numel(Meta)==0
            Meta={' '};
            TDATAfrom={'the article has pmc put the publicher does not allow downloadind in xml'};
        elseif numel(Meta)>=2
            Meta={'there is two or more Meta'};
            TDATAfrom={'PMC full text'};
        end
    else
    
        Meta={' '};
        TDATAfrom={'notPMC'};
    end
end



end

