y = fft(S2);
z = fft(S3); 
m = abs(y); 
p = abs(z);  
f = (0:length(y)-1)*1000/length(y); 

subplot(2,1,1)
plot(f,m)

subplot(2,1,2)
plot(f,p)