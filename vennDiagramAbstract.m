%A={'Zainb'}
%vennDiagramAbstract
FileNam2='myBoldfilter2.txt';
FileNam=filterFileNam;
N=['result' yourQuery '.html'];
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
fprintf(fptr,'<HTML>\n');
fprintf(fptr,'<body>\n');
%fprintf(fptr,'<H1>my results  %s</H1>\n',cell2mat(A));


fprintf(fptr,'<table>\n');

fprintf(fptr,'<tr>');
        %fprintf(fptr,'<th>Complex</th>');
       
        fprintf(fptr,'<th>Abstract Paragraph</th>');
        fprintf(fptr,'<th>Paragraph ID </th>');
fprintf(fptr,'</tr>');

for i=1:numel(allabs)
    
     kk=myFormatFontH1(FileNam,allabs{i});
       kk=myFormatFontH1(FileNam2,kk);
       
       if iscell(kk)

       kk=cell2mat(kk);
       end
       
        fprintf(fptr,'<tr>');
    %fprintf(fptr,'<td>Copi vesiles</td>');
    
    fprintf(fptr,'<td>%s</td>',kk);
    
    NUrl=['https://www.ncbi.nlm.nih.gov/pubmed/?term=' cell2mat(myfinAbstractList.ID(i))];
   
    fprintf(fptr,'<td><a href="%s" target="_blank">%s</a></td>',NUrl,cell2mat(myfinAbstractList.ID(i)));
    
    
        
    %fprintf(fptr,'<td> </td>');
    fprintf(fptr,'</tr>');
    
end

  
fprintf(fptr,'</table>\n');


fprintf(fptr,'</body>\n');
fprintf(fptr,'</HTML>\n');

fclose(fptr);
