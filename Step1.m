clear all; close all;
clc

A = zeros(32,32);
Amax=256;
sigma = 1;

choix=-5+(5+5)*rand(2,1);
coord=choix+16;

[x,y]=meshgrid(1:size(A,1),1:size(A,2));

A = A + gauss2D(x,y,coord(1),coord(2),sigma, Amax);

figure(1); 
imagesc(A); colormap('gray'); axis image
saveas(figure(1),"Création d'une particule",'png')

N=2

[maxi,pos]=max(A(:))
[lig,col]=ind2sub(size(A),pos);

zoom=A(lig-N:lig+N,col-N:col+N);

vect_sol=[0 0 0];
[Imax]=max(zoom(:))
[solution]=lsqnonlin(@(vect_sol)ecart(vect_sol,zoom,sigma),[N, N, Imax])

figure(2);
imagesc(A)
axis image
colormap('gray')
hold on
plot(coord(1),coord(2),'bo')
plot(solution(1)+col-N-1,solution(2)+lig-N-1,'rx')
saveas(figure(2),"Trouver le centre", 'png')
