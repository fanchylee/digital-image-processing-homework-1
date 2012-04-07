function myequalize(inPic,outPic);
in = imread(inPic);
[i j k]=size(in);
if k==1;
	[counts ,x]=imhist(in);
	counts_normalized=counts./(i*j);
	[i_counts j_counts] = size(counts_normalized);
	Tmat = tril(ones([i_counts i_counts]));
	s_float = Tmat*counts_normalized*255;
	s_int = uint8(s_float);
	out = s_int(in + 1);
else 
	if k==3;
		hsv_in=rgb2hsv(double(in)./255);
		hsv_in(:,:,3) = double(myequalize(uint8(255.*hsv_in(:,:,3))))./255;
		out = uint8(255.*hsv2rgb(hsv_in));
	end
end
imwrite(out,outPic);
