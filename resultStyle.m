function [] = resultStyle(FolderpathNam)
N='resultStyle.css';
%filename1 = fullfile('E:\Projects\Matlab\Master\allCountMatrix\allCountMatrix\finalHtml', N);
%FolderpathNam='E:\Projects\Matlab\Master\allCountMatrix\allCountMatrix\PlosPP';
filename1 = fullfile(FolderpathNam, N);
fptr = fopen(filename1, 'w');
fprintf(fptr,'body {background-color: powderblue;}');
fprintf(fptr,'h1 { color: blue;}');
fprintf(fptr,'p {color: black;}');
fprintf(fptr,'span {font-size:16px; font-weight:bold;color: red;}');
fprintf(fptr,'a {text-decoration: none;}');
%fprintf(fptr,'text-decoration: none;');