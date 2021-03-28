function [filterSenB,filterSenA,indexxB,indexxA,existFilterA,existFilterB] = classpapers( cyear,filterSen,myfinAbstractList,indexx,existFilter)
%classification of inserted papers
filterSenB='';
filterSenA='';
indexxB='';
indexxA='';
existFilterB='';
existFilterA='';
for i=1:numel(filterSen)
    messag = sprintf('step number %d of %d',i,numel(filterSen));
    disp(messag)
    myfid=myfinAbstractList.ID(indexx{i});
[paper_year] = DetYear(myfid{:});

if paper_year < cyear
existFilterB{i}=existFilter{i};    
filterSenB{i}=filterSen{i};
indexxB{i}=indexx{i};
else
   existFilterA{i}=existFilter{i}; 
  filterSenA{i}=filterSen{i};  
  indexxA{i}=indexx{i};
end
     if i>1
     if mod(i,5)==0
     pause(3)
     end
     end
     
end
existFilterB=existFilterB(~cellfun('isempty',existFilterB));
existFilterA=existFilterA(~cellfun('isempty',existFilterA));
filterSenB=filterSenB(~cellfun('isempty',filterSenB));
filterSenA=filterSenA(~cellfun('isempty',filterSenA));
indexxB=indexxB(~cellfun('isempty',indexxB));
indexxA=indexxA(~cellfun('isempty',indexxA));
%end

