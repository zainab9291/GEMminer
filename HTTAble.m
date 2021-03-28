A={'Zainb'}
fptr=fopen('result.html','w')
fprintf(fptr,'<!DOCTYPE html>');
fprintf(fptr,'<html>');
fprintf(fptr,'<head>');
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
fprintf(fptr,'</head>');
fprintf(fptr,'<body>\n');
fprintf(fptr,'<H1>my results  %s</H1>\n',cell2mat(A));

fprintf(fptr,'<table>\n');

fprintf(fptr,'<tr>');
        fprintf(fptr,'<th>Complex</th>');
        fprintf(fptr,'<th>Filter</th>'); 
        fprintf(fptr,'<th>Abstract Sentence</th>');
        fprintf(fptr,'<th> Sentence ID</th>');
        %fprintf(fptr,'<th>Paragraph </th>');
fprintf(fptr,'</tr>');

for i=1:numel(filterSen)
    for j=1:numel(filterSen{i})
        
        fprintf(fptr,'<tr>');
    fprintf(fptr,'<td>Copi vesiles</td>');
    fprintf(fptr,'<td>%s</td>', cell2mat(existFilter{i}));
    fprintf(fptr,'<td>%s</td>',filterSen{i}{j});
    fprintf(fptr,'<td>%s</td>',cell2mat(myfinAbstractList.ID(indexx{i}{j})));
    
    
    
        
    %fprintf(fptr,'<td> </td>');
    fprintf(fptr,'</tr>');
    end
end

  
fprintf(fptr,'</table>\n');


fprintf(fptr,'</body>\n');
fprintf(fptr,'</HTML>\n');

fclose(fptr);