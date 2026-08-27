%-------------------------------------------------------------------------%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function    [a,b,da] = tensors(s1,s2,ds1,ds2,c_2,cv_2,c_3,rot,N)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a       = zeros(N,3,3,3,3);
b       = zeros(N,3,3,3,3);
da      = zeros(N,3,3,3);
w       = zeros(3,3);
dw      = zeros(3,3);
for i = 1:N%cycle through each thickness position.
    %convert stress to strain.
    sv      = [s1(i),s2(i),zeros(1,4)].';%voigt stress vector.
    dsv     = [ds1(i),ds2(i),zeros(1,4)].';%voigt stress derivative vector.
    ev      = cv_2\sv;%voigt strain vector.
    dev     = cv_2\dsv;%voigt strain derivative vector.
    e       = ev2e(ev);%strain matrix.
    de      = ev2e(dev);%strain derivative matrix.
    %compute tensors.
    a_temp  = ca0(rot,c_2,c_3,e,w);%equation of motion.
    b_temp  = cb0(rot,c_2,c_3,e,w);%constitutive equation.
    da_temp = ca0p(rot,c_2,c_3,de,dw);%equation of motion derivative.
    a(i,:,:,:,:) = a_temp(:,:,:,:);
    b(i,:,:,:,:) = b_temp(:,:,:,:);
    da(i,:,:,:)  = da_temp(:,:,:);
    %check for large strains.
    checkstrain(e)
end