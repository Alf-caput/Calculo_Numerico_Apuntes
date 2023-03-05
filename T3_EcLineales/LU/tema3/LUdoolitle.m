function [l,u]=LUdoolitle(a)
 
n=length(a);
l=a*0; u=a*0;
for k=1:n
    u(k,k:n)=a(k,k:n)-l(k,1:k-1)*u(1:k-1,k:n);
    l(k,k)=1;
    l(k+1:n,k)=(a(k+1:n,k)-l(k+1:n,1:k-1)*u(1:k-1,k))/u(k,k);
end