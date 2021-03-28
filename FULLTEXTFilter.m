function [myPMCID,AllIDpaper]=FULLTEXTFilter(FileNam,myfinAbstractList)
%load('myfinAbstractList4COPIvesicle.mat')
%allabs=myfinAbstractList.Abstract;
%FileNam='tryfilter.txt';

allabs=myfinAbstractList.Abstract;
[filterSen,indexx,existFilter] = Filter_File(FileNam,allabs );
filteredID='';
IDPaper={''};

for i=1:numel(filterSen)
    messag = sprintf('step number %d of %d',i,numel(filterSen));
    disp(messag)
%     for j=1:numel(filterSen{i})
        filteredID{i}=myfinAbstractList.ID(indexx{i});
%         filteredID{i,j}=myfinAbstractList.ID(indexx{i}{j});
%     end
end
filteredID=filteredID(~cellfun('isempty',filteredID));
filteredID = vertcat(filteredID{:});
%unpack or unnest nested cell array
data=cellfun(@str2num,filteredID);
%convert cell array to double
for i=1:numel(data)
    messag = sprintf('step number %d of %d',i,numel(data));
    disp(messag)
[myPMCID{i}]=FULLTEXTFilterSen(data(i));
if ~isempty(myPMCID{i})
    IDPaper{i}=data(i);
    %ID4PMC this is id that have pmc or id that have fullpaper
end
   
pause(1)
end
myPMCID=myPMCID(~cellfun('isempty',myPMCID));
myPMCID = vertcat(myPMCID{:});
IDPaper=IDPaper(~cellfun('isempty',IDPaper));
AllIDpaper=IDPaper;
