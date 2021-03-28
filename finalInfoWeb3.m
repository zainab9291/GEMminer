
function [] = finalInfoWeb3( ExcelFileNam ,ColNum,filterFile,FolderpathNam)
%this function take excel file and name of coloumn with filter file  make quires then return
%all html files
% FolderpathNam='E:\Projects\Matlab\Master\allCountMatrix\allCountMatrix\finalHtmlZ';
%FolderpathNam='E:\Project\Master\allCountMatrix\allCountMatrix\finalHtmlZ';
% filterFile='myFilter.txt';
% ColNum='B';

f=ExcelFileNam;
%f='Plos.xlsx';
%f='CompExcl1IE2.xlsx';

Cnum=xlscol(ColNum);

%[num,txt,raw]=xlsread(f,[Cnum ':' Cnum]);
[num,txt,raw]=xlsread(f);
%above statements for extract coloumns from excel
filterFileNam=filterFile;
ForColor=ones(numel(txt),1);
for i=2:numel(txt)

yourQuery=txt(i);
yourQuery=yourQuery{:};
yourQuery=['(' yourQuery ')'];

[flagPaperExist,messag,filterSen,indexx,existFilter,filterParag,FilterParagID,OutFilter,myfinAbstractList]=Table4complex2(filterFileNam,yourQuery);
if flagPaperExist==0
    ForColor(i)=0;
end
HTTAble4
HTTAbleP4
mainFrame4
end
myHomePage(FolderpathNam);
resultStyle(FolderpathNam);
AWebsiteFinal( ExcelFileNam,FolderpathNam,ForColor,ColNum);

