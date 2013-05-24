function [res] = stoner(index_start, index_final, num_pacient)

res = -1;
for i=index_start:index_final
    disp(i);
    img = boneIntensityMap(getImageFromPacient(num_pacient, i));
    
    if res == -1
        res = img;
    else
        res = res + img;
    end
    
end

res = max(res - 1,0);
