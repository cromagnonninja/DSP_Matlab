function[k] = DSP_lab8_lattice(N,vec)
% n-1 coefficients will be the output
    disp(vec);
    k = zeros(1,N);
    disp(k);
    disp(vec(N));
    for j=1:N-1
        n = N + 1 - j;
        a = vec;
        k(n-1) = a(n);
        vec = [];
        for i=1:n
            x  = a(i) - k(n-1)*a(n+1-i);
            x = x/(1 - k(n-1)*k(n-1));
            if i<n
                vec = [vec x];
            end
        end
        disp(vec);
    end