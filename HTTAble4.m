%A={'Zainb'}
if flagSenExist~=0
FileNam2='myBoldfilter2.txt';
FileNam=filterFileNam;
N=['result' yourQuery '.html'];
%N='resultgenomeScalespecific.html';
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
        fprintf(fptr,'<th>Filter</th>'); 
        fprintf(fptr,'<th>Abstract Sentence</th>');
        fprintf(fptr,'<th>sentences ID </th>');
fprintf(fptr,'</tr>');

for i=1:numel(filterSen)
    
       kk=myFormatFontH(FileNam,filterSen{i});
       kk=myFormatFontH(FileNam2,kk);
       
       if iscell(kk)

       kk=cell2mat(kk);
       end
        fprintf(fptr,'<tr>');
    %fprintf(fptr,'<td>Copi vesiles</td>');
    fprintf(fptr,'<td>%s</td>', existFilter{i});
    fprintf(fptr,'<td>%s</td>',kk);
    
    NUrl=['https://www.ncbi.nlm.nih.gov/pubmed/?term=' cell2mat(myfinAbstractList.ID(indexx{i}))];
   
    fprintf(fptr,'<td><a href="%s" target="_blank">%s</a></td>',NUrl,cell2mat(myfinAbstractList.ID(indexx{i})));
    
    
        
    %fprintf(fptr,'<td> </td>');
    fprintf(fptr,'</tr>');
    
end

  
fprintf(fptr,'</table>\n');


fprintf(fptr,'</body>\n');
fprintf(fptr,'</HTML>\n');

fclose(fptr);
end