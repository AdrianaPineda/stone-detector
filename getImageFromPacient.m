function [ output_image ] = getImageFromPacient( num_pacient, index )

%Loads the ith image according to the pacient being analyzed
    if num_pacient==1
        output_image=toGrayScale(loadImageAcevedo(index));
    elseif num_pacient==2
        output_image=toGrayScale(loadImagePinzon(index));
    elseif num_pacient==3
        output_image=toGrayScale(loadImageRomero(index));
    else
        output_image=toGrayScale(loadImageZapata(index));
    end
    
end

