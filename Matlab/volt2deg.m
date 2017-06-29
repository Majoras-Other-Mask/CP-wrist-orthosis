function [angle]=volt2deg(voltage_array)

angle=(voltage_array/(12/1024))*(((12/1024)*360)/12);

angle=angle-angle(500);
end
