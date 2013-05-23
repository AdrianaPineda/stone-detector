function [ aStart, aEnd, bStart, bEnd ] = range_b( up )
%Returns the range for iterator b

aStart=0.15*l1+left;
aEnd=0.85*l1+left;

if up
    bStart=120;
    bEnd=257;
else
    bStart=254;
    bEnd=357;
end

end

