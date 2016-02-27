know_author = [0 1 0 1 0 1 0 1 1 1]';
is_long =     [0 1 1 1 1 0 0 0 0 1]';
has_research =[1 0 1 1 0 1 1 0 1 1]';
has_grade =   [1 1 1 1 0 1 0 0 1 1]';
has_lottery = [0 0 1 0 0 1 0 0 0 1]';
read =        [-1 -1 -1 -1 -1 1 1 1 1 -1]';

data = horzcat(know_author,is_long,has_research,has_grade, has_lottery,...
    read);

Hy = getEntropy(4,6)
Hauthor = getFeatureEntropy(know_author, read)
Hlong = getFeatureEntropy(is_long, read)
Hresearch = getFeatureEntropy(has_research, read)
Hgrade = getFeatureEntropy(has_grade, read)
Hlottery = getFeatureEntropy(has_lottery, read)

info(1) = Hy - Hauthor; %info gain of author
info(2) = Hy - Hlong;% info gain of long
info(3) = Hy - Hresearch; %info gain of research
info(4) = Hy - Hgrade;
info(5) = Hy - Hlottery;

[max, ind] = max(info)
