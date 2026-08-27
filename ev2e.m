%-------------------------------------------------------------------------%


%DESCRIPTION
%- Converts the strain in Voigt notation to the strain tensor.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [e] = ev2e(ev)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  INFORMATION

% ev    : 6x1 vector of strain in Voigt notation.


% e     : 3x3 strain tensor.

%%  CONVERT

e   = [    ev(1),1/2*ev(6),1/2*ev(5);...
       1/2*ev(6),    ev(2),1/2*ev(4);...
       1/2*ev(5),1/2*ev(4),    ev(3)];
   
   
   
   
   
   


