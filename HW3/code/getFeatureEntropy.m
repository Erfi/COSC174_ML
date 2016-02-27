function [ entropy ] = getFeatureEntropy( feature, label )
% calculates the entropy based ont he given feature

feature_yes = zeros(1,3);%y-yes, y_no, y-total
feature_no = zeros(1,3);%y-yes, y_no, y-total
total = length(label);%total labels


for i=1:length(feature)
   if(feature(i) == 1)%feature is 1
       feature_yes(3) = feature_yes(3)+1;
       if(label(i)==1)%corresponding label is 1
           feature_yes(1) = feature_yes(1)+1;
       else
           feature_yes(2) = feature_yes(2)+1; 
       end
   else %feature is 0
       feature_no(3) = feature_no(3)+1;
       if(label(i)==1)%corresponding label is 1
           feature_no(1) = feature_no(1)+1;
       else
           feature_no(2) = feature_no(2)+1; 
       end
   end
end


%calculate the entropy given the table that you made above!
entropy = (feature_yes(3)/total)*getEntropy(feature_yes(1),feature_yes(2))...
      + (feature_no(3)/total)*getEntropy(feature_no(1), feature_no(2));

end

