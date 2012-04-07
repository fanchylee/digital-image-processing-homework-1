function color_balance(inPic,outPic,Rw,Gw,Bw);
in=imread(inPic);
meanIntensity=(Rw+Gw+Bw)/3;
in(:,:,1)=double(in(:,:,1)).*meanIntensity./Rw;
in(:,:,2)=double(in(:,:,2)).*meanIntensity./Gw;
in(:,:,3)=double(in(:,:,3)).*meanIntensity./Bw;
imwrite(in,outPic);
