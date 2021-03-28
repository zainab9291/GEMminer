
function [] = myHomePage(FolderpathNam)
N='myHome.html';
%filename1 = fullfile('E:\Projects\Matlab\Master\allCountMatrix\allCountMatrix\finalHtml', N);
%FolderpathNam='E:\Projects\Matlab\Master\allCountMatrix\allCountMatrix\PlosPP';
filename1 = fullfile(FolderpathNam, N);
fptr = fopen(filename1, 'w');

fprintf(fptr,'<!DOCTYPE html>');
fprintf(fptr,'<html>');
fprintf(fptr,'<head>');
  fprintf(fptr,'<style>');

  fprintf(fptr,'body {');
    fprintf(fptr,'font-family: "Lato", sans-serif;');
  fprintf(fptr,'}');
    fprintf(fptr,'p {');
      fprintf(fptr,'padding-left: 3em;');
      fprintf(fptr,'padding-top: 2em;');
      fprintf(fptr,'font-weight: bold;');
      fprintf(fptr,'font-size: 40pt;');
      fprintf(fptr,'color: purple;');


    fprintf(fptr,'}');


  fprintf(fptr,'</style>');
fprintf(fptr,'</head>');
fprintf(fptr,'<body>');

fprintf(fptr,'<p align="center">Welcome in Text Mining Toolbox for GEM''s </p>');




fprintf(fptr,'</body>');
fprintf(fptr,'</html>');
