%--------------------------MATERIAL PROPERTIES----------------------------%


%DESCRIPTION
%- Returns material properties.

%NOTES
%- All materials are cubic anisotropic elastic solids.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [rho,c2,cv2,c3,cv3] = matprop_cub(mat)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  INFORMATION

% mat       : number designating the material properties to be output.
%               -germanium
%                   - 1.1 (McSkimin1964)
%               -silicon
%                   - 2.1 (McSkimin1964)
%               -copper
%                   - 3.1 (Hiki1966)
%               -silver
%                   - 4.1 (Hiki1966)
%               -gold
%                   - 5.1 (Hiki1966)


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
    c44     = 0;
    c111    = 0;
    c112    = 0;
    c123    = 0;
    c144    = 0;
    c166    = 0;
    c456    = 0;
%%  germanium.
elseif mat == 1.1
    rho     = 5323;
    c11     = 128.5e9;
    c12     = 48.26e9;
    c44     = 66.80e9;
    c111    = -710e9;
    c112    = -389e9;
    c123    = -18e9;
    c144    = -23e9;
    c166    = -292e9;
    c456    = -53e9;
%%  silicon.
elseif mat == 2.1
    rho     = 2331;
    c11     = 165.8e9;
    c12     = 63.92e9;
    c44     = 79.62e9;
    c111    = -825e9;
    c112    = -451e9;
    c123    = -64e9;
    c144    = -12e9;
    c166    = -310e9;
    c456    = -64e9;
%%  copper.
elseif mat == 3.1
    rho     = 8960;
    c11     = 166.1e9;
    c12     = 119.9e9;
    c44     = 75.6e9;
    c111    = -1271e9;
    c112    = -814e9;
    c123    = -50e9;
    c144    = -3e9;
    c166    = -780e9;
    c456    = -95e9;
%%  silver.
elseif mat == 4.1
    rho     = 10490;
    c11     = 122.2e9;
    c12     = 90.7e9;
    c44     = 45.4e9;
    c111    = -843e9;
    c112    = -529e9;
    c123    = 189e9;
    c144    = 56e9;
    c166    = -637e9;
    c456    = 83e9;
%%  gold.
elseif mat == 5.1
    rho     = 19300;
    c11     = 192.9e9;
    c12     = 163.8e9;
    c44     = 41.5e9;
    c111    = -1729e9;
    c112    = -922e9;
    c123    = -233e9;
    c144    = -13e9;
    c166    = -648e9;
    c456    = -12e9;
%%  other.
elseif strcmp(mat,'custom') == 1
    fprintf('\n---------------------------------\n')
    fprintf(' Enter material properties below\n')
    fprintf('---------------------------------\n')
    rho     = input('Density [kg/m^3] : ');
    c11     = 1e9*input('c11 [GPa] : ');
    c12     = 1e9*input('c12 [GPa] : ');
    c44     = 1e9*input('c44 [GPa] : ');
    c111    = 1e9*input('c111 [GPa] : ');
    c112    = 1e9*input('c112 [GPa] : ');
    c123    = 1e9*input('c123 [GPa] : ');
    c144    = 1e9*input('c144 [GPa] : ');
    c166    = 1e9*input('c166 [GPa] : ');
    c456    = 1e9*input('c456 [GPa] : ');
else
    error('Material number not found')
end
%%  voigt - second order.
cv2 = cv2_c(c11,c12,c44);
%%  voigt - third order.
cv3 = cv3_c(c111,c112,c144,c166,c123,c456);

%%  FULL TENSORS

%%  second order.
c2  = cv2c2(cv2);
%%  third order.
c3  = cv2c3(cv3);






