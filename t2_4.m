pkg load image

function out_img = noise(img, typ = 0)

	[row col ch] = size(img);

	if(ch == 1)
		out_img = noise_mono(img, typ);

	elseif(ch == 3)
		out_img = noise_rgb(img, typ);

	endif

endfunction

function out_img = noise_rgb(img, typ)

	img_R = img(:,:,1);
	img_G = img(:,:,2);
	img_B = img(:,:,3);

	img_R = noise_mono(img_R, typ);
	img_G = noise_mono(img_G, typ);
	img_B = noise_mono(img_B, typ);

	out_img = cat(3, img_R, img_G, img_B);

endfunction

function out_img = noise_mono(img, typ)

	if(typ == 0)
		out_img = imnoise(img, 'salt & pepper');

	elseif(typ == 1)
		out_img = imnoise(img, 'gaussian');

	elseif(typ == 2)
		out_img = imnoise(img, 'speckle');

	endif

endfunction

function out_img_list = generate(img, n)

	for i = 1:n

		out_img_list{i} = noise(img);

	endfor 

endfunction	

function out_img = mean_images(img_list)

	[row col ch] = size(img_list{1});
	n = size(img_list, 2);

	out_img = uint32(zeros(row, col, ch));

	for img = img_list

		out_img += uint32(cell2mat(img));
		 
	endfor 

	out_img /= n;

	out_img = uint8(out_img);

endfunction

function out_img = median_images(img_list)

	aux = sort(img_list);

	out_img = aux{7};

endfunction

img1 = imread('/home/xeds/UFPB/Processamento Digital de Imagens - 2016.2/Trabalho 2/Octave/Imagens/mono1024.jpg'); %monocromatica
img2 = imread('/home/xeds/UFPB/Processamento Digital de Imagens - 2016.2/Trabalho 2/Octave/Imagens/nfs1024.jpg'); %colorida

new_img1 = generate(img1,15);
new_img2 = generate(img2,15);
new_img3 = mean_images(new_img2);
new_img4 = mean_images(new_img1);

imshow(new_img4);

%subplot(2, 2, 1), imshow(new_img2{1}), title('Imagem 1');
%subplot(2, 2, 2), imshow(new_img2{2}), title('Imagem 2');
%subplot(2, 2, 3), imshow(new_img2{3}), title('Imagem 3');
%subplot(2, 2, 4), imshow(new_img2{4}), title('Imagem 4');

%if(new_img2{1} == new_img2{2}) 
%
%	x = 5
%
%else
%	x = 1
%
%endif

%imwrite(out_img, output_name);

waitforbuttonpress();