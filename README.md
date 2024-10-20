# Flow Calculation Using Newton-Raphson

This repository contains a MATLAB implementation for calculating fluid flow velocity and rate between two tanks using the Newton-Raphson method. The calculation involves solving Bernoulli's equation iteratively and computing the flow rate using pipe and fluid properties.

## Problem Overview

A liquid is pumped from Tank 1 to Tank 2 through a pipe of known diameter using a centrifugal pump. The goal is to calculate the flow velocity and flow rate between the tanks based on input parameters such as fluid density, viscosity, pipe dimensions, and tank heights. The solution utilizes the Newton-Raphson method to iteratively compute the velocity.

## Code Description

- **Flow_Calculation.m**: Main script to calculate flow velocity and rate using input parameters such as liquid density, viscosity, pipe diameter, and more.
- **calculate_FX.m**: A helper function that computes the residual of the Bernoulli equation and the pump head equation.

## Input Parameters

- `rho`: Liquid density (g/cm³)
- `mu`: Liquid viscosity (g/cm·s)
- `g`: Gravitational constant (cm/s²)
- `h1`: Height of the liquid in Tank 1 (cm)
- `h2`: Height of the liquid in Tank 2 (cm)
- `D`: Pipe diameter (cm)
- `Le`: Equivalent pipe length (cm)
- `v_guess`: Initial guess for the flow velocity (cm/s)
- `tol`: Tolerance for Newton-Raphson convergence
- `eps`: Differentiation interval for Newton-Raphson method

## Output

The program outputs:
- Flow velocity (cm/s)
- Flow rate (cm³/s)
- Convergence value (FX)

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/Flow_Calculation_Using_Newton_Raphson.git
