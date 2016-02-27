function [ entropy ] = getEntropy( numYes, numNo )
% for calculating the entropy of one column
% number of yesses and nos in a column
%THIS IS A HACK BECAUSE WE ARE ASSUMING BINARY VALUES
total = numYes + numNo;

a = numYes/total;
b = numNo/total;

c = -a*log2(a);
d = -b*log2(b);

%dealing with Nan!
if(a == 0)
  c = 0;  
end

if(b == 0)
   d = 0;
end
entropy = c+d;

end

