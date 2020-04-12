function [H S V] = rgb2hsv2 (R, G, B)
    # conversia unui vector de pixeli
    R1 = double(R) / 255;
    G1 = double(G) / 255;
    B1 = double(B) / 255;

    v = cat(1, R1, G1, B1);

    Cmax = max(v);
    Cmin = min(v);

    delta = Cmax - Cmin;

    delta_mod = delta;
    delta_mod(delta_mod == 0) = 1;

    H(Cmax == R1) = 60 * mod((G1 - B1)(Cmax == R1) ./ delta(Cmax == R1), 6);
    H(Cmax == G1) = 60 * ((B1 - R1)(Cmax == G1) ./ delta_mod(Cmax == G1) + 2);
    H(Cmax == B1) = 60 * ((R1 - G1)(Cmax == B1) ./ delta_mod(Cmax == B1) + 4);

    H(delta == 0) = 0;

    H = H / 360;

    S = delta ./ Cmax;
    S(Cmax == 0) = 0;

    V = Cmax;
endfunction
