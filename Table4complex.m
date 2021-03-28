%function [finTable]=Table4complex(filterFileNam,exlFileQuery,exlIndex)
% [ MyQuery ] = QueryExcel( exlFile,exlIndex );
% yourQuery=MyQuery{:};
flagPaperExist=1;
theQuery=[yourQuery 'AND Saccharomyces cerevisiae'];
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
    flagPaperExist=0;
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
    if isempty(fullPaperParag.Parag{i})
       cc={''};
       hh={''};
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
FilterParagID
OutFilter
end
end
end
end

   

