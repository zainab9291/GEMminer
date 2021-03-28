function [flagSenExist,flagPaperExist,messag,filterSen,indexx,existFilter,filterParag,FilterParagID,OutFilter,myfinAbstractList]=Table4complex2(filterFileNam,yourQuery)
% [ MyQuery ] = QueryExcel( exlFile,exlIndex );
% yourQuery=MyQuery{:};
flagSenExist=1;
flagPaperExist=1;
messag='';
filterSen='';
indexx='';
existFilter='';
filterParag='';
FilterParagID='';
OutFilter='';
myfinAbstractList='';
%yourQuery=['(' yourQuery ')'];
%theQuery=[yourQuery ' AND Saccharomyces cerevisiae'];
theQuery=yourQuery;
[ Result_your_query ] = myQueryID( theQuery );
if isempty(Result_your_query)
    flagPaperExist=0;
    messag='No Result Id';
    disp('No Result Id')
else
resultID=Result_your_query;

stepnum=100;
[ myfinAbstractList ] = AbstractListBuild1( resultID ,stepnum );
allabs=myfinAbstractList.Abstract;
[filterSen,indexx,existFilter] = Filter_File( filterFileNam ,allabs );
%to get ID of sentences
% for a=1:numel(filterSen)
%     for b=1:numel(filterSen{a})
%         ind=indexx{a}{b};
%         FilterSenID=myfinAbstractList.ID(ind);
%     end
% end
        
if isempty(filterSen)
    flagSenExist=0;
    messag='No documents match your filters';
    disp('No documents match your filters')
else
[myPMCID,AllIDpaper]=FULLTEXTFilter(filterFileNam,myfinAbstractList);
if isempty(AllIDpaper)
    flagPaperExist=0;
    messag='No allowed full paper for your filters';
     disp('No allowed full paper for your filters')
else
% return myPMCID ID that have full paper access 
%[AllParag] = ExtractAllParag( myPMCID );
[AllParag,IDParag] = ExtractAllParag( myPMCID,AllIDpaper );
fullPaperParag.ID=IDParag;
fullPaperParag.Parag=AllParag;
%[Parag,IDParag] = ExtractParag( myPMCID );
% for i=1:numel(AllParag)
%     [filterParag{i},indexxp{i},existFilter{i}] = Filter_File_Parag( filterFileNam ,AllParag{i});
%     %[filterParag,indexxp,existFilter,IDpaper{i}] = Filter_File_Parag( filterFileNam ,AllParag{i},IDParag{i});
%     
% end
cc={''};
hh={''};
for i=1:numel(AllParag)
    messag = sprintf('step number %d of %d',i,numel(AllParag));
    disp(messag)
    if isempty(fullPaperParag.Parag{i})
        if i~=numel(AllParag)
            %we do not need the last one to be empty this will make ????
            %??????
       cc={''};
       hh={''};
%         else
%             cc{end+1}='';
%             hh{end+1}='';
            
        end
    else
    [filterParag,indexxp,existFilterp] = Filter_File_Parag( filterFileNam ,fullPaperParag.Parag{i});
    c=filterParag{:};
     cc=[cc c];
     h=existFilterp{:};
     hh=[hh h];
%      if ~isempty(c{:})
%     h=fullPaperParag.ID{i};
%     hh=[hh h];
%      end
    
    %[filterParag,indexxp,existFilter,IDpaper{i}] = Filter_File_Parag( filterFileNam ,AllParag{i},IDParag{i});
    end
end
cc=cc(~cellfun('isempty',cc));
hh=hh(~cellfun('isempty',hh));

%to return ids for filtered paragraphs
%and to return filters
if isempty(cc) && isempty(hh)
    flagPaperExist=0;
else
[OutFilter]=ReturnFilterArray(cc,hh);
for k=1:numel(cc)
for n=1:numel(fullPaperParag.Parag)
g=ismember(fullPaperParag.Parag{n},cc{k});
f=find(g);
if ~isempty(f)
FilterParagID{k}=fullPaperParag.ID{n};
end
end
end
filterParag=cc;
FilterParagID;
OutFilter;
end
end
end
end

   

