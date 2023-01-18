function [d_u] = find_d_u(u)
    d_u = zeros(1, 62);
    for n = 0:30
        d_u(n+1) = exp(-1j * pi * u * n * (n+1) / 63);
    end
    for n = 31:61
        d_u(n+1) = exp(-1j * pi * u * (n+1) * (n+2) / 63);
    end

end

