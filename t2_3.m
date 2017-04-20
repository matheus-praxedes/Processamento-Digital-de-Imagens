pkg load image


function out_img = median(img, siz)
	
	[row col ch] = size(img);

	if(ch == 1)
		out_img = medfilt2(img, [siz siz]);

	elseif(ch == 3)
		img_R = img(:,:,1);
		img_G = img(:,:,2);
		img_B = img(:,:,3);

		img_R = medfilt2(img_R, [siz siz]);
		img_G = medfilt2(img_G, [siz siz]);
		img_B = medfilt2(img_B, [siz siz]);

		out_img = cat(3, img_R, img_G, img_B);

	endif

endfunction


img1 = imread('/home/xeds/UFPB/Processamento Digital de Imagens - 2016.2/Trabalho 2/Octave/Processamento-Digital-de-Imagens/Imagens/mono1024.jpg'); %monocromatica
img2 = imread('/home/xeds/UFPB/Processamento Digital de Imagens - 2016.2/Trabalho 2/Octave/Processamento-Digital-de-Imagens/Imagens/nfs1024.jpg'); %colorida

new_img1 = median(img1,15);
new_img2 = median(img2,15);

subplot(1, 2, 1), imshow(img1), title('Imagem original');
subplot(1, 2, 2), imshow(new_img1), title('Imagem modificada');

%imwrite(out_img, output_name);

waitforbuttonpress();