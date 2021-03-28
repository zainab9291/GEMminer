function [SenI] = mySenI(allabs)
%allabs=myfinAbstractList4COPIvesicle.Abstract;
for i=1:numel(allabs)
SenI{i}= ExtractSen(allabs(i));
end