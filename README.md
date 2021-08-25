# GEMminer
Text mining tool for Genome-Scale metabolic model

GEMminer help in facilitate modelling process by taking the query, filter file and PubMed database to help in extract parameters needed in modelling of cell. GEMminer is semi-automatic system it divides the results in to paragraphs and sentences then working on each sentence to mining in parameters then focus on the important literatures that have important parameters the show the results in HTML webpage.

Our system aims to retrieve parameters from a large amount of papers in databases it have three main processes Input, Processing and Output. 
Input process: The user inputs queries in an Excel sheet, filter file containing keywords, and path where the user wants to store the output. 
Processing process: GEMminer searches in PubMed with a list of IDs and then divides results into sentences and paragraphs. Finally, GEMminer then chooses the best sentences and paragraphs according to the filter file.
Output process: GEMminer generates an HTML site and the user can navigate the results. 
How to use GEMminer
 
Using GEMminer is so easy just Using one command in MATLAB
Which is finallnfoWeb4( ExcelFileNam,ColNum,filterFileNam,FolderpathNam)
 where : 
ExcelFileNam which is excel file of queries
ColNum which is queries column number in excel
filterFileNam which is name of txt file that contain filters
FolderpathNam which is path of folder that you need output html files will store in it

