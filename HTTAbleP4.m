%A={'Zainb'}

FileNam2='myBoldfilter2.txt';
FileNam=filterFileNam;
N=['resultParag' yourQuery '.html'];
%N='resultParaggenomeScalespecific.html';
filename1 = fullfile(FolderpathNam, N);
fptr = fopen(filename1, 'w');
fprintf(fptr,'<!DOCTYPE html>');
fprintf(fptr,'<html>');
fprintf(fptr,'<head>');
fprintf(fptr,'<link rel="stylesheet" href="resultStyle.css">');
fprintf(fptr,'<style>');
fprintf(fptr,'table, th, td {');
 fprintf( fptr,'border: 1px solid black;');
  fprintf(fptr,'border-collapse: collapse;');
fprintf(fptr,'}');
fprintf(fptr,'th, td {');
  fprintf(fptr,'padding: 5px;');
  fprintf(fptr,'text-align: left;');
fprintf(fptr,'}');
fprintf(fptr,'</style>');
%fprintf(fptr,'<HTML>\n');
fprintf(fptr,'<body>\n');
%fprintf(fptr,'<H1>my results  %s</H1>\n',cell2mat(A));

if flagPaperExist==0
                fprintf(fptr,'<p style="font-size:50px; text-align:center;">%s</p>',messag);
 else
fprintf(fptr,'<table>\n');

fprintf(fptr,'<tr>');
        
        fprintf(fptr,'<th>Paragraph ID </th>');
        fprintf(fptr,'<th>Paragraph </th>');
        fprintf(fptr,'<th>Filter </th>');
fprintf(fptr,'</tr>');

for i=1:numel(filterParag)
   
    kk=myFormatFontH(FileNam,filterParag{i});
    kk=myFormatFontH(FileNam2,kk);
    kk=strrep(kk,'<caption>',' ');
    fprintf(fptr,'<tr>');
    NUrlP=['https://www.ncbi.nlm.nih.gov/pubmed/?term=' num2str(FilterParagID{i})];
    fprintf(fptr,'<td><a href="%s" target="_blank">%s</a></td>',NUrlP,num2str(FilterParagID{i}));
    fprintf(fptr,'<td>%s</td>',kk);
    fprintf(fptr,'<td>%s</td>',OutFilter{i});
     fprintf(fptr,'</tr>');
    
    
end
    %fprintf(fptr,'<td> </td>');
    %fprintf(fptr,'</tr>');
    
  fprintf(fptr,'</table>\n');


fprintf(fptr,'</body>\n');
fprintf(fptr,'</HTML>\n');

fclose(fptr);
end