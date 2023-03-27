function [RESULT_IMG]=SGfilt_1D(IMG, r, max_order,ox)
  
IMG= IMG';
PATCH_R=r;
PATCH_SIZE=PATCH_R*2+1;
SIZE_IMG=size(IMG);

length_weight=max_order+1;
target_order=ox+1;

X=[-r:r]';
EXPL_C{1}=ones(PATCH_SIZE,1);

for I=1:max_order
  EXPL_C{I+1}=X.^I;
end

Ex_Var=[];
for I=1:length_weight
  Ex_Var=[Ex_Var  reshape(EXPL_C{I}, [], 1)];
end

Inv_Ex_Var=pinv(Ex_Var);
W{target_order}=Inv_Ex_Var(ox+1,:)';

IMG_C=conv(flipud(W{target_order}),IMG);

IMG_C=IMG_C(1+2*r:end-2*r,1);




ORGIMG_U=IMG(1:1+2*r);
IMG_U=[];

for I=1:r
  X=[-r+I:r+I]';
  
  for I=1:max_order
    EXPL_C{I+1}=X.^I;
  end
  
  Ex_Var=[];
  for I=1:length_weight
    Ex_Var=[Ex_Var  reshape(EXPL_C{I}, [], 1)];
  end

  Inv_Ex_Var=pinv(Ex_Var);
  W{target_order}=flipud(Inv_Ex_Var(ox+1,:)');

  TMPIMGU=conv(W{target_order},ORGIMG_U);
  IMG_U=[TMPIMGU(2*r+1); IMG_U];

end


ORGIMG_L=IMG(end-2*r:end);
IMG_L=[];
for I=1:r
  X=[-r-I:r-I]';
  
  for I=1:max_order
    EXPL_C{I+1}=X.^I;
  end
  
  Ex_Var=[];
  for I=1:length_weight
    Ex_Var=[Ex_Var  reshape(EXPL_C{I}, [], 1)];
  end

  Inv_Ex_Var=pinv(Ex_Var);
  W{target_order}=flipud(Inv_Ex_Var(ox+1,:)');

  TMPIMGL=conv(W{target_order}, ORGIMG_L);
  IMG_L=[IMG_L;TMPIMGL(2*r+1)];

end

RESULT_IMG=[IMG_U; IMG_C; IMG_L]';
