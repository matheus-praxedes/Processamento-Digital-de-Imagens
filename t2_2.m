pkg load image

function out_img = mean(img, M , N)
	
	h = zeros(M, N);
	h(:) = 1/(M*N);

	[row col ch] = size(img);

	if(ch == 1)
		out_img = filter2(h, img);
		
	elseif(ch == 3)
		img_R = img(:,:,1);
		img_G = img(:,:,2);
		img_B = img(:,:,3);

		img_R = filter2(h, img_R);
		img_G = filter2(h, img_G);
		img_B = filter2(h, img_B);

		out_img = cat(3, img_R, img_G, img_B);

	endif

endfunction

img1 = imread('/home/xeds/UFPB/Processamento Digital de Imagens - 2016.2/Trabalho 2/Octave/Processamento-Digital-de-Imagens/Imagens/mono1024.jpg'); %monocromatica
img2 = imread('/home/xeds/UFPB/Processamento Digital de Imagens - 2016.2/Trabalho 2/Octave/Processamento-Digital-de-Imagens/Imagens/nfs1024.jpg'); %colorida

new_img1 = mean(img1,3,25);
new_img2 = mean(img2,3,25);

subplot(1, 2, 1), imshow(img2), title('Imagem original');
subplot(1, 2, 2), imshow(new_img2), title('Imagem modificada');

%imwrite(out_img, output_name);

waitforbuttonpress();