
function [] = finalInfoWeb1( ExcelFileNam ,ColNum,filterFile,FolderpathNam)
%this function take excel file and name of coloumn with filter file  make quires then return
%all html files
% FolderpathNam='E:\Projects\Matlab\Master\allCountMatrix\allCountMatrix\TRY';
% filterFile='myFilter.txt';
% ColNum='B';

f=ExcelFileNam;
%f='Plos.xlsx';
%f='CompExcl.xlsx';
Cnum=ColNum;
[num,txt,raw]=xlsread(f,[Cnum ':' Cnum]);
%above statements for extract coloumns from excel
for i=1:numel(txt)
i
disp(txt)
yourQuery=txt(i);
yourQuery=yourQuery{:};
yourQuery=['(' yourQuery ')'];
filterFileNam=filterFile;
Table4complex
FolderpathNam=FolderpathNam;
HTTAble3
HTTAbleP3
mainFrame3
end
indexSidebar1( ExcelFileNam,FolderpathNam);

