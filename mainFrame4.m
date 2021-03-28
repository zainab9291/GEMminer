N=['mainFrame' yourQuery '.html'];
filename1 = fullfile(FolderpathNam, N);
fptr = fopen(filename1, 'w');
%fptr=fopen('mainFrame.html','w');
fprintf(fptr,'<!DOCTYPE html>');

fprintf(fptr,'<html>\n');
            fprintf(fptr,'<head>\n');
            fprintf(fptr,'<script type="text/javascript">\n');
            fprintf(fptr,'function loadFrame()\n');
            fprintf(fptr,'{\n');
            fprintf(fptr,'var s=document.getElementById("platform").value;\n');

            fprintf(fptr,'document.getElementById("loadContainer").innerHTML=""\n');
            fprintf(fptr,'var iframe = document.createElement("iframe");\n');
            fprintf(fptr,'iframe.src = s;\n');
            fprintf(fptr,'iframe.height="2000";\n');
            fprintf(fptr,'iframe.width="100%%";\n');
            fprintf(fptr,'document.getElementById("loadContainer").appendChild(iframe);\n');
            
            fprintf(fptr,'}\n');
            fprintf(fptr,'</script>\n');
            fprintf(fptr,'</head>\n');
            fprintf(fptr,'<body>\n');
            if flagSenExist==0
                fprintf(fptr,'<p style="font-size:50px; text-align:center;">%s</p>',messag);
            else

            fprintf(fptr,'<div style="color: purple; ; height: 80px;">\n');
            fprintf(fptr,'<form>\n');
            fprintf(fptr,'<h1>%s</h1>\n',yourQuery);
                fprintf(fptr,'Select result :\n');
                fprintf(fptr,'<select id=''platform'' onchange="loadFrame()">\n');
                    fprintf(fptr,'<option value="result%s.html">Filtered Sentences</option>\n',yourQuery);
                    fprintf(fptr,'<option value="resultParag%s.html">Filtered Paragraph </option>\n',yourQuery);
                    
                fprintf(fptr,'</select>\n');

            fprintf(fptr,'</form>\n');
            fprintf(fptr,'</div>\n');

            fprintf(fptr,'<div id="loadContainer" style=""></div>\n');
            fprintf(fptr,'</body>\n');
            fprintf(fptr,'</html>\n');
            fclose(fptr);
            end