function    checkstrain(e)

t       = 0.05;
if max(max(abs(e))) > t
    msg     = ['Strain exceeded ',num2str(t),'. Small strain assumption may not hold.'];
    warning(msg)
end