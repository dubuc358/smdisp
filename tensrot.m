%-----------------------TENSOR COORDINATE ROTATION------------------------%


%DESCRIPTION
%- Rotates a tensor to a new coordinate system.

%NOTES
%- Tensor may be of rank 1,2,4, or 6.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [cr] = tensrot(c,a)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%  INFORMATION

% c         : tensor in original coordinate system.
%               -if the tensor is a vector, it must be entered in column
%               form.
%
% a         : 3x3 matrix of direction cosines.
%               -a(i,j) : direction cosine between y_i and x_j axes, where
%               y_i are the new coordinates and x_i the original.


% cr        : tensor in the rotated coordinate system.

%%  INITIALIZE

%%  dimensions.
%size.
s   = size(c);
%rank.
r   = length(s);
if r == 2
    if s(1) == 1 || s(2) == 1
        r   = 1;
    end
end

%%  ROTATE

if a == eye(3,3)
    %%  no rotation necessary.
    cr  = c;
else
    %%  rotation necessary.
    if strcmp(class(c),'sym') == 1
        cr  = sym(zeros(s));
    else
        cr  = zeros(s);
    end
    %%  rank 1.
    if r == 1
        cr  = a*c;
    %%  rank 2.
    elseif r == 2
        cr  = a*c*a.';
    %%  rank 3.
    elseif r == 3
        for i = 1:3
            for j = 1:3
                for k = 1:3
                    for u = 1:3
                        for v = 1:3
                            for w = 1:3
                                cr(i,j,k) = cr(i,j,k) + a(i,u)*a(j,v)*a(k,w)*...
                                                        c(u,v,w);
                            end
                        end
                    end
                end
            end
        end
    %%  rank 4.
    elseif r == 4
        for i = 1:3
            for j = 1:3
                for k = 1:3
                    for l = 1:3
                        for u = 1:3
                            for v = 1:3
                                for w = 1:3
                                    for x = 1:3
                                        cr(i,j,k,l) = cr(i,j,k,l) + a(i,u)*a(j,v)*a(k,w)*a(l,x)*...
                                                                    c(u,v,w,x);
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    %%  rank 6.
    elseif r == 6
        for i = 1:3
            for j = 1:3
                for k = 1:3
                    for l = 1:3
                        for m = 1:3
                            for n = 1:3
                                for u = 1:3
                                    for v = 1:3
                                        for w = 1:3
                                            for x = 1:3
                                                for y = 1:3
                                                    for z = 1:3
                                                        cr(i,j,k,l,m,n) = cr(i,j,k,l,m,n) +...
                                                                          a(i,u)*a(j,v)*a(k,w)*a(l,x)*a(m,y)*a(n,z)*...
                                                                          c(u,v,w,x,y,z);
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end









