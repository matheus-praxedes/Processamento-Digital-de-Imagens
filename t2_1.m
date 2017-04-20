pkg load image

function out_img = equalization(img, siz)
	
	[row col ch] = size(img);

	if(ch == 1)
		out_img = histeq(img, siz);
		
	elseif(ch == 3)
		img_R = img(:,:,1);
		img_G = img(:,:,2);
		img_B = img(:,:,3);

		img_R = histeq(img_R, siz);
		img_G = histeq(img_G, siz);
		img_B = histeq(img_B, siz);

		out_img = cat(3, img_R, img_G, img_B);

	endif

endfunction

function out_img = expansion(img)
	
	[row col ch] = size(img);

	if(ch == 1)
		out_img = imadjust(img, stretchlim(img,0),[]);
		
	elseif(ch == 3)
		img_R = img(:,:,1);
		img_G = img(:,:,2);
		img_B = img(:,:,3);

		img_R = imadjust(img_R, stretchlim(img_R,0),[]);
		img_G = imadjust(img_G, stretchlim(img_G,0),[]);
		img_B = imadjust(img_B, stretchlim(img_B,0),[]);

		out_img = cat(3, img_R, img_G, img_B);

	endif

endfunction

img1 = imread('/home/xeds/UFPB/Processamento Digital de Imagens - 2016.2/Trabalho 2/Octave/Processamento-Digital-de-Imagens/Imagens/contraste1.jpg'); %equalizacao - monocromatica
img2 = imread('/home/xeds/UFPB/Processamento Digital de Imagens - 2016.2/Trabalho 2/Octave/Processamento-Digital-de-Imagens/Imagens/contraste2.png'); %expansao - monocromatica
img3 = imread('/home/xeds/UFPB/Processamento Digital de Imagens - 2016.2/Trabalho 2/Octave/Processamento-Digital-de-Imagens/Imagens/rgb.jpg'); %colorida
img4 = imread('/home/xeds/UFPB/Processamento Digital de Imagens - 2016.2/Trabalho 2/Octave/Processamento-Digital-de-Imagens/Imagens/contraste3.jpg'); %colorida

new_img1 = equalization(img1,256);
new_img2 = expansion(img2);
new_img3 = expansion(equalization(img4,64));
new_img4 = equalization(expansion(img4),64);

subplot(1, 2, 1), imshow(img1), title('Imagem original');
subplot(1, 2, 2), imshow(new_img1), title('Imagem modificada');

%imwrite(new_img2,'saidaexp.png');

waitforbuttonpress();