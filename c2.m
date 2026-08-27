%-----------------------SECOND ORDER STIFFNESS TENSOR---------------------%


%DESCRIPTION
%- Given the two Lame parameters, lambda and mu, the stiffness tensor
%relating stress and strain is calculated.


%Created by Brennan Dubuc [15-9-10].


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [C] = c2(lambda,mu)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  INFORMATION

% lambda        : first lame parameter [Pa].
%
% mu            : second lame parameter [Pa].

%%  FILL ENTRIES

%create the size of the matrix.
C   = zeros(3,3,3,3);
for a   = 1:3
    for b   = 1:3
        for c   = 1:3
            for d   = 1:3
                C(a,b,c,d)  = lambda*(a==b)*(c==d)+mu*((a==c)*(b==d)+(a==d)*(b==c));
            end
        end
    end
end












