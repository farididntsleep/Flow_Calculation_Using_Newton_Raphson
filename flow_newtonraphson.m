function Flow_Calculation
clc
clear all
rho = input('Enter the liquid density (g/cm^3): ');
mu = input('Enter the liquid viscosity (g/cm.s): ');
g = input('Enter the gravitational constant (cm/s^2): ');
h1 = input('Enter the liquid height in Tank 1 (cm): ');
h2 = input('Enter the liquid height in Tank 2 (cm): ');
D = input('Enter the pipe diameter (cm): ');
Le = input('Enter the equivalent pipe length (cm): ');
v_guess = input('Enter the initial guess for flow velocity (cm/s): ');
tol = input('Enter the tolerance: ');
eps = input('Enter the differentiation interval: ');

v_old = v_guess;
FX_old = calculate_FX(v_guess, h1, h2, rho, D, mu, Le, g);
if FX_old == 0
    Q = pi * D^2 * v_guess / 4;
    disp('----------------------------------');
    disp('          Calculation Result       ');
    disp(['Flow Velocity = ', num2str(v_guess), ' cm/s']);
    disp(['Flow Rate = ', num2str(Q), ' cm^3/s']);
    disp(['FX Value = ', num2str(FX_old)]);
    disp('----------------------------------');
else
    iterate = 1;
    while iterate == 1
        v = v_old + eps;
        FX_plus = calculate_FX(v, h1, h2, rho, D, mu, Le, g);
        v = v_old - eps;
        FX_min = calculate_FX(v, h1, h2, rho, D, mu, Le, g);
        dFdx = (FX_plus - FX_min) / (2 * eps);
        
        v = v_old - FX_old / dFdx;
        FX_new = calculate_FX(v, h1, h2, rho, D, mu, Le, g);
        if abs(v - v_old) < tol
            Q = pi * D^2 * v / 4;
            disp('----------------------------------');
            disp('          Calculation Result       ');
            disp(['Flow Velocity = ', num2str(v), ' cm/s']);
            disp(['Flow Rate = ', num2str(Q), ' cm^3/s']);
            disp(['FX Value = ', num2str(FX_new)]);
            disp('----------------------------------');
            break;
        else
            v_old = v;
            FX_old = FX_new;
        end
    end
end
end

function FX = calculate_FX(v, h1, h2, rho, D, mu, Le, g)
Re = rho * v * D / mu;
f = 0.0596 / (Re^0.215);
Q = pi * D^2 * v / 4;
Hm = 3000.5 - 2.2 * Q + 5.7E-4 * Q^2 - 7.8E-8 * Q^3;
FX = h2 - h1 + f * Le * v^2 / (2 * g * D) - Hm;
end
