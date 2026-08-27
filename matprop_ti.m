%--------------------------MATERIAL PROPERTIES----------------------------%


%DESCRIPTION
%- Returns material properties.

%NOTES
%- All materials are transversely isotropic anisotropic elastic solids.
%- The plane of isotropy is taken as normal to the x1 axis.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [rho,c2,cv2,c3,cv3] = matprop_ti(mat)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  INFORMATION

% mat       : number designating the material properties to be output.
%               -unidirectional graphite/epoxy t300/5208
%                   - 1.1 (Prosser1990)


% rho       : density [kg/m^3].
%
% c2        : fourth rank tensor of second order elastic moduli [Pa].
%
% cv2       : voigt notation form of second order elastic moduli [Pa].
%
% c3        : sixth rank tensor of third order elastic moduli [Pa].
%
% cv3       : voigt notation form of third order elastic moduli [Pa].

%%  MATERIALS

%%  vacuum.
if mat == 0
    rho     = 0;
    c11     = 0;
    c12     = 0;
    c23     = 0;
    c33     = 0;
    c66     = 0;
    c111    = 0;
    c112    = 0;
    c122    = 0;
    c123    = 0;
    c155    = 0;
    c223    = 0;
    c255    = 0;
    c266    = 0;
    c333    = 0;
%%  unidirectional graphite epoxy.
elseif mat == 1.1
    rho     = 1540;
    c11     = 108.4e9;
    c12     = 6.5e9;
    c23     = 6.78e9;
    c33     = 14.26e9;
    c66     = 5.27e9;
    c111    = -829e9;
    c112    = -236e9;
    c122    = -4e9;
    c123    = 65e9;
    c155    = -47e9;
    c223    = -89e9;
    c255    = -33.4e9;
    c266    = -49.1e9;
    c333    = -196e9;
%%  other.
elseif strcmp(mat,'custom') == 1
    fprintf('\n---------------------------------\n')
    fprintf(' Enter material properties below\n')
    fprintf('---------------------------------\n')
    rho     = input('Density [kg/m^3] : ');
    c11     = 1e9*input('c11 [GPa] : ');
    c12     = 1e9*input('c12 [GPa] : ');
    c23     = 1e9*input('c23 [GPa] : ');
    c33     = 1e9*input('c33 [GPa] : ');
    c66     = 1e9*input('c66 [GPa] : ');
    c111    = 1e9*input('c111 [GPa] : ');
    c112    = 1e9*input('c112 [GPa] : ');
    c122    = 1e9*input('c122 [GPa] : ');
    c123    = 1e9*input('c123 [GPa] : ');
    c155    = 1e9*input('c155 [GPa] : ');
    c223    = 1e9*input('c223 [GPa] : ');
    c255    = 1e9*input('c255 [GPa] : ');
    c266    = 1e9*input('c266 [GPa] : ');
    c333    = 1e9*input('c333 [GPa] : ');
else
    error('Material number not found')
end
%%  voigt - second order.
cv2 = cv2_t1(c11,c12,c23,c33,c66);
%%  voigt - third order.
cv3 = cv3_t1(c111,c112,c122,c123,c155,c223,c255,c266,c333);

%%  FULL TENSORS

%%  second order.
c2  = cv2c2(cv2);
%%  third order.
c3  = cv2c3(cv3);






