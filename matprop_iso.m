%--------------------------MATERIAL PROPERTIES----------------------------%


%DESCRIPTION
%- Returns material properties.

%NOTES
%- All materials are isotropic elastic solids.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [rho,c_2,cv2,c_3,cv3] = matprop_iso(mat)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  INFORMATION

% mat       : number designating the material properties to be output.
%               -steel
%                   - 1.1 mild steel (Hirao1981).
%                   - 1.2 hecla 138a (0.4% C) (Smith1966).
%                   - 1.3 hecla 17 (0.6% C) (Smith1966).
%                   - 1.4 structural steel (Comsol).
%               -aluminum
%                   - 2.1 6061-T6 aluminum (Gandhi2012).
%               -titanium
%                   - 3.1 (Degtyar1998).
%               -iron
%                   - 4.1 armco iron (Hughes1957).


% rho       : density [kg/m^3].
%
% c_2       : fourth rank tensor of second order elastic moduli [Pa].
%
% cv2       : voigt notation form of second order elastic moduli [Pa].
%
% c_3       : sixth rank tensor of third order elastic moduli [Pa].
%
% cv3       : voigt notation form of third order elastic moduli [Pa].

%%  MATERIALS

%%  vacuum.
if mat == 0
    rho     = 0;
    lam     = 0;
    mu      = 0;
    ml      = 0;
    mm      = 0;
    mn      = 0;
%%  steel.
elseif mat == 1.1
    rho     = 7837;
    lam     = 107.4e9;
    mu      = 81.90e9;
    ml      = -206.5e9;
    mm      = -600e9;
    mn      = -800e9;
elseif mat == 1.2
    rho     = 7843;
    lam     = 109.0e9;
    mu      = 82.00e9;
    ml      = -426e9;
    mm      = -619e9;
    mn      = -708e9;
elseif mat == 1.3
    rho     = 7825;
    lam     = 110.5e9;
    mu      = 82.00e9;
    ml      = -328e9;
    mm      = -595e9;
    mn      = -668e9;
elseif mat == 1.4
    rho     = 7850;
    lam     = 115.0e9;
    mu      = 76.90e9;
    ml      = -300e9;
    mm      = -620e9;
    mn      = -720e9;
%%  aluminum.
elseif mat == 2.1
    rho     = 2700;
    lam     = 54.3e9;
    mu      = 27.2e9;
    ml      = -282e9;
    mm      = -339e9;
    mn      = -416e9;
%%  titanium.
elseif mat == 3.1
    rho     = 4460;
    lam     = 70.8e9;
    mu      = 36.5e9;
    ml      = -553e9;
    mm      = -63.3e9;
    mn      = +817e9;
%%  iron.
elseif mat == 4.1
    rho     = 7860;
    lam     = 110.0e9;
    mu      = 82.00e9;
    ml      = -348e9;
    mm      = -103e9;
    mn      = +110e9;
%%  other.
elseif strcmp(mat,'custom') == 1
    fprintf('\n---------------------------------\n')
    fprintf(' Enter material properties below\n')
    fprintf('---------------------------------\n')
    rho     = input('Density [kg/m^3] : ');
    lam     = 1e9*input('lambda [GPa] : ');
    mu      = 1e9*input('mu [GPa] : ');
    ml      = 1e9*input('l [GPa] : ');
    mm      = 1e9*input('m [GPa] : ');
    mn      = 1e9*input('n [GPa] : ');
else
    error('Material number not found')
end

%%  FULL TENSORS

%%  second order.
c_2 = c2(lam,mu);
%%  third order.
c_3 = c3(ml,mm,mn);

%%  VOIGT NOTATION

%%  second order.
cv2 = c22cv(c_2);
%%  third order.
cv3 = c32cv(c_3);






