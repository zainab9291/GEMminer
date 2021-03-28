
%function [] = finalInfoWeb2( ExcelFileNam ,ColNum,filterFile,FolderpathNam)
%this function take excel file and name of coloumn with filter file  make quires then return
%all html files
 FolderpathNam='E:\Projects\Matlab\Master\allCountMatrix\allCountMatrix\finalHtmlIE';
filterFile='myFilter.txt';
 ColNum=3;

%f=ExcelFileNam;
f='CompExclZ1.xlsx';
%f='CompExcl1IE.xlsx';
Cnum=xlscol(ColNum);
[num,txt,raw]=xlsread(f,[Cnum ':' Cnum]);
%above statements for extract coloumns from excel
filterFileNam=filterFile;
ForColor=ones(numel(txt),1);
%for i=53:numel(txt)
for i=99:numel(txt)
ttt=i
disp('ttt')
yourQuery=txt(i);
yourQuery=yourQuery{:};
yourQuery=['(' yourQuery ')'];
% if ~isequal(txt{i},txt{i-1})
[flagPaperExist,messag,filterSen,indexx,existFilter,filterParag,FilterParagID,OutFilter,myfinAbstractList]=Table4complex2(filterFileNam,yourQuery);
if flagPaperExist==0
    ForColor(i)=0;
end

HTTAble3
HTTAbleP3
mainFrame3
% else
% if flagPaperExist==0
%     ForColor(i)=0;
% end
% end
end

myHomePage(FolderpathNam);
resultStyle(FolderpathNam);
IWebsiteFinal( ExcelFileNam,FolderpathNam,ForColor,ColNum);

