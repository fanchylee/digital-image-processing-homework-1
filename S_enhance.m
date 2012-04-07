function S_enhance(inPic,outPic);
in=imread(inPic);
hsv_in=rgb2hsv(double(in)./255);
hsv_in(:,:,2)=hsv_in(:,:,2).*1.5;
hsv_in(:,:,3)=hsv_in(:,:,3).*1.1;
rgb_in=hsv2rgb(hsv_in);
out=uint8(rgb_in.*255);
imwrite(out,outPic);
