clc
clear
close all

tic
%%
load Mask.mat;
load Comp.mat;
Thr = 2.3; %threshold
%% Threshold spatial
spatial_maps = zscore(spatial_maps);
spatial_maps(abs(spatial_maps)<Thr)=0;
OutVolume = zeros(size(Mask));
OutVolume(Mask>0) = spatial_maps;
%% Sign matching 
[~,PeakInd] = max(abs(OutVolume(:)));
if OutVolume(PeakInd)<0
    OutVolume = -OutVolume;
end
%% Show 3D glass brain
f_show_3D_brain(OutVolume,0.2);
%% Rotate brain
view([30 0])
D3 = get(gca,'children');
tic
while toc<12
    rotate(D3,[0,0,1],3)
    drawnow
end
%%
toc