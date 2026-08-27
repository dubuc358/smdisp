%-------------------------------------------------------------------------%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [rho,c_2,cv_2,c_3,cv_3] = matsym(sym,mat)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  INFORMATION

% sym       : string indicating material symmetry.
%
% mat       : material number.

%%  CONSTANTS

if strcmp(sym,'iso') == 1%isotropic.
    [rho,c_2,cv_2,c_3,cv_3] = matprop_iso(mat);
elseif strcmp(sym,'ti') == 1%transversely isotropic.
    [rho,c_2,cv_2,c_3,cv_3] = matprop_ti(mat);
elseif strcmp(sym,'cub') == 1%cubic.
    [rho,c_2,cv_2,c_3,cv_3] = matprop_cub(mat);
end

