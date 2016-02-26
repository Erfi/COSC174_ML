%Erfan Azad
%Date: 25 Feb 2016
%Description: Applies the given filter to each column of
%the given dataMatrix
function [ filteredMatrix ] = applyFilter( dataMatrix, filter )
    filteredMatrix = zeros(size(dataMatrix));
    for col = 1:size(dataMatrix,2)
        filteredMatrix(:,col) = filtfilt(filter,dataMatrix(:,col));
    end
end

