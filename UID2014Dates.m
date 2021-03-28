%UID2014Dates
% allpaperyears
% listOfID
paper_year=zeros(numel(listOfID),1);
for i=1:numel(listOfID)
    messag = sprintf('Please wait step number %d of %d',i,numel(listOfID));
    disp(messag)
    paper_year(i) = DetYear(num2str(listOfID(i)));
end

 %allpaperyears=paper_year; 