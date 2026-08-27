%------------------------THIRD ORDER STIFFNESS TENSOR---------------------%


%DESCRIPTION
%- Given the three Murnaghan constants, l m and n, the stiffness tensor
%relating stress and strain is calculated.


%Created by Brennan Dubuc [15-9-10].


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [C] = c3(l,m,n)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  FILL ENTRIES

%create the size of the matrix.
C   = zeros(3,3,3,3,3,3);
for a   = 1:3
    for b   = 1:3
        for c   = 1:3
            for d   = 1:3
                for e   = 1:3
                    for f   = 1:3
                        C(a,b,c,d,e,f)  = 2*(l-m+n/2)*(a==b)*(c==d)*(e==f)+...
                                          2*(m-n/2)*((a==b)*kdc(c,d,e,f)+...
                                                     (c==d)*kdc(e,f,a,b)+...
                                                     (e==f)*kdc(a,b,c,d))+...
                                                n/2*((a==c)*kdc(b,d,e,f)+...
                                                     (a==d)*kdc(b,c,e,f)+...
                                                     (b==c)*kdc(a,d,e,f)+...
                                                     (b==d)*kdc(a,c,e,f));
                    end
                end
            end
        end
    end
end












