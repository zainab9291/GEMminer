function [] = IWebsiteFinal( ExcelFileNam,FolderpathNam,ForColor,ColNum)
N='AWebsiteFinal.html';
%filename1 = fullfile('E:\Projects\Matlab\Master\allCountMatrix\allCountMatrix\finalHtml', N);
%FolderpathNam='E:\Projects\Matlab\Master\allCountMatrix\allCountMatrix\PlosPP';
filename1 = fullfile(FolderpathNam, N);
fptr = fopen(filename1, 'w');

fprintf(fptr,'<!DOCTYPE html>');

fprintf(fptr,'<html>');
fprintf(fptr,'<head>');
fprintf(fptr,'<meta name="viewport" content="width=device-width, initial-scale=1">');
fprintf(fptr,'<style>');
fprintf(fptr,'body {');
  fprintf(fptr,'font-family: "Lato", sans-serif;');
fprintf(fptr,'}');

fprintf(fptr,'.sidenav {');
  fprintf(fptr,'height: 100%%;');
  fprintf(fptr,'width: 0;');
  fprintf(fptr,'position: fixed;');
  fprintf(fptr,'z-index: 1;');
  fprintf(fptr,'top: 0;');
  fprintf(fptr,'left: 0;');
  fprintf(fptr,'background-color: #111;');
  fprintf(fptr,'overflow-x: hidden;');
  fprintf(fptr,'transition: 0.5s;');
  fprintf(fptr,'padding-top: 60px;');

fprintf(fptr,'}');
fprintf(fptr,'#mySidenav{');

  fprintf(fptr,'overflow-y: auto;');
fprintf(fptr,'}');

fprintf(fptr,'.sidenav a {');
  fprintf(fptr,'padding: 8px 8px 8px 32px;');
  fprintf(fptr,'text-decoration: none;');
  fprintf(fptr,'font-size: 20px;');
  fprintf(fptr,'color: #818181;');
  fprintf(fptr,'display: block;');
  fprintf(fptr,'transition: 0.3s;');
fprintf(fptr,'}');

fprintf(fptr,'.sidenav a:hover {');
  fprintf(fptr,'color: #f1f1f1;');
fprintf(fptr,'}');

fprintf(fptr,'.sidenav .closebtn {');
  fprintf(fptr,'position: absolute;');
  fprintf(fptr,'top: 0;');
  fprintf(fptr,'right: 25px;');
  fprintf(fptr,'font-size: 36px;');
  fprintf(fptr,'margin-left: 50px;');
fprintf(fptr,'}');

fprintf(fptr,'#main {');
  fprintf(fptr,'transition: margin-left .5s;');
  fprintf(fptr,'padding: 16px;');
fprintf(fptr,'}');

fprintf(fptr,'@media screen and (max-height: 450px) {');
  fprintf(fptr,'.sidenav {padding-top: 15px;}');
  fprintf(fptr,'.sidenav a {font-size: 18px;}');
fprintf(fptr,'}');
fprintf(fptr,'ul,#myUL {');
 fprintf(fptr,'list-style-type: none;');
fprintf(fptr,'}');
fprintf(fptr,'li{');
  fprintf(fptr,'list-style-type: none;');
fprintf(fptr,'}');

fprintf(fptr,'#myUL {');
  fprintf(fptr,'margin: 0;');
  fprintf(fptr,'padding: 0;');
fprintf(fptr,'}');

fprintf(fptr,'.caret {');
 fprintf(fptr,'cursor: pointer;');
 fprintf(fptr,'color: white;');
  fprintf(fptr,'-webkit-user-select: none; /* Safari 3.1+ */');
 fprintf(fptr,'-moz-user-select: none; /* Firefox 2+ */');
 fprintf(fptr,'-ms-user-select: none; /* IE 10+ */');
 fprintf(fptr,'user-select: none;');
fprintf(fptr,'}');

fprintf(fptr,'.caret::before {');
  fprintf(fptr,'content: "\\25B6";');
  fprintf(fptr,'color: white;');
 fprintf(fptr,'display: inline-block;');
  fprintf(fptr,'margin-right: 6px;');
  fprintf(fptr,'padding-top: 1em;');
fprintf(fptr,'}');

fprintf(fptr,'.caret-down::before {');
  fprintf(fptr,'-ms-transform: rotate(90deg);');
  fprintf(fptr,'-webkit-transform: rotate(90deg);');
  fprintf(fptr,'transform: rotate(90deg);');
fprintf(fptr,'}');

fprintf(fptr,'.nested {');
  fprintf(fptr,'display: none;');
fprintf(fptr,'}');

fprintf(fptr,'.active {');
  fprintf(fptr,'display: block;');
fprintf(fptr,'}');
fprintf(fptr,'</style>');
fprintf(fptr,'</head>');
fprintf(fptr,'<body>');

fprintf(fptr,'<div id="mySidenav" class="sidenav">');

  fprintf(fptr,'<ul id="myUL">');
  
    fprintf(fptr,'<li><span class="caret">Yeast Secretory Machine</span>');
      fprintf(fptr,'<ul class="nested">');
      [a  data]=xlsread(ExcelFileNam);
level1=unique(data(:,1),'stable');
for i=2:numel(level1)


        fprintf(fptr,'<li><span class="caret">%s</span>\n',cell2mat(level1(i)));
        Index=find(ismember(data(:,1),level1(i)));
          fprintf(fptr,'<ul class="nested">\n');
          for j=1:numel(Index)
              C=cell2mat(data(Index(j),ColNum));
              N=['mainFrame(' C ').html'];
              
              if ForColor(Index(j))==0
                 fprintf(fptr,'<li><a href="%s" target="iframe_a" style="color:red;">%s</a></li>\n',N,C);
              else
            fprintf(fptr,'<li><a href="%s" target="iframe_a">%s</a></li>\n',N,C);
              end
          
          
          end
           fprintf(fptr,'</ul>\n');
           fprintf(fptr,'</li>\n');
end

          
      

      fprintf(fptr,'</ul>');
    fprintf(fptr,'</li>');
  fprintf(fptr,'</ul>');
       


fprintf(fptr,'</div>');

fprintf(fptr,'<div id="main">');
  fprintf(fptr,'<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; </span>');

  fprintf(fptr,'<span style="font-size:30px; color:purple; padding-left: 15em; " > GEM toolbox</span>');

 
  fprintf(fptr,'<iframe  id="myf"  src="myHome.html" width="100%%" height="2000" name="iframe_a" frameborder="0"></iframe>');

fprintf(fptr,'</div>');

fprintf(fptr,'<script>');
fprintf(fptr,'function openNav() {');
  fprintf(fptr,'var e = document.getElementById("mySidenav");');
    fprintf(fptr,'if (e.style.width == "250px")');
    fprintf(fptr,'{');
        fprintf(fptr,'e.style.width = "0px";');
        fprintf(fptr,'document.getElementById("main").style.marginLeft= "0";');
    fprintf(fptr,'}');
    fprintf(fptr,'else');
    fprintf(fptr,'{');
       fprintf(fptr,'e.style.width = "250px";');
  fprintf(fptr,'document.getElementById("main").style.marginLeft = "250px";');
    fprintf(fptr,'}');
fprintf(fptr,'}');
fprintf(fptr,'var toggler = document.getElementsByClassName("caret");');
fprintf(fptr,'var i;');

fprintf(fptr,'for (i = 0; i < toggler.length; i++) {');
  fprintf(fptr,'toggler[i].addEventListener("click", function() {');
    fprintf(fptr,'this.parentElement.querySelector(".nested").classList.toggle("active");');
    fprintf(fptr,'this.classList.toggle("caret-down");');
  fprintf(fptr,'});');
fprintf(fptr,'}');

fprintf(fptr,'/*function closeNav() {');
  fprintf(fptr,'document.getElementById("mySidenav").style.width = "0";');
  fprintf(fptr,'document.getElementById("main").style.marginLeft= "0";')
fprintf(fptr,'}*/');
fprintf(fptr,'</script>');

fprintf(fptr,'</body>');
fprintf(fptr,'</html>');
