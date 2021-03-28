function [ myfinAbstractList ] = AbstractListBuild1( resultID ,stepnum )
% make aconnection between every id with its abstract 
%   by making cell matrix collecting them
% stepnum for number of paper we can download once  in each loop
 numID=numel(resultID);
 myAbstractList={''};
 a=stepnum-1;
 
 
 for j=1:stepnum:numID
      messag = sprintf('step number %d of %d',j,numID);
    disp(messag)
     if j+a<=length(resultID)
     [ AbsList,lost] = AbstractList(resultID,j,j+a);
     
     if j>1
     if mod(j,3000)==1
     pause(240)
     end
     end
     if numel(AbsList.ID{:})==0
         k=numel(AbsList.ID{:});
     else
     k=numel(AbsList.ID);
     end
    %myAbstractList(j:(j+k)-1,1)=AbsList(:,1);
    myAbstractList(j:(j+k)-1,1)=AbsList.ID;
    %myAbstractList(j:(j+k)-1,2)=AbsList(:,2);
     myAbstractList(j:(j+k)-1,2)=AbsList.Abstract;
     else
         [ AbsList,lost] = AbstractList(resultID,j,length(resultID));
         %k=length(AbsList);
         if ~isequal(AbsList.ID,{''})
             k=length(AbsList.ID);
        % myAbstractList(j:length(resultID),1)=AbsList(:,1);
        % myAbstractList(j:length(resultID),1)=AbsList.ID;
          myAbstractList(j:(j+k)-1,1)=AbsList.ID;
         %myAbstractList(j:length(resultID),2)=AbsList(:,2);
         %myAbstractList(j:length(resultID),2)=AbsList.Abstract;
         myAbstractList(j:(j+k)-1,2)=AbsList.Abstract;
         end
    
     end
 end
 %myAbstractList=myAbstractList(~cellfun('isempty',myAbstractList));
 myfinAbstractList.ID=myAbstractList(:,1);
 myfinAbstractList.Abstract=myAbstractList(:,2);
  myfinAbstractList.ID=myfinAbstractList.ID(~cellfun('isempty',myfinAbstractList.ID));
  myfinAbstractList.Abstract=myfinAbstractList.Abstract(~cellfun('isempty',myfinAbstractList.Abstract));
 %this two lines for remove empty cell


end

