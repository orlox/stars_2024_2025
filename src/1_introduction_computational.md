# Constructing an HR diagram

To run this lab locally you will need three additional files, {download}`solar_spectrum.dat<./solar_spectrum.dat>`, {download}`gaia_100pc_par_over_err_100.csv<gaia_100pc_par_over_err_100.csv>` and {download}`passband.dat<passband.dat>`.

The radiation coming out of a star can be approximated to first order using black body radiation. In this case the intensity is described by Planck's law,

$$B_\lambda(\lambda,T) = \frac{2h c^2}{\lambda^5}\frac{1}{\exp\left(\frac{hc}{\lambda k_\mathrm{B}T}\right)-1},$$

which describes the energy flux per unit area and unit solid angle. This function peaks at a value of $\lambda_\mathrm{max}=hc/(4.965 k_\mathrm{B}T)$. We can use this to normalize the distribution such that its peak value is $1$, which is useful for visualization. Below we define both $B_\lambda$ and its normalized version.

```julia
h = 6.6261e-27      # Planck's constant, cm^2 g s^-1
c = 2.99792458e10   # speed of light cm s^-1
k_B = 1.3807e-16    # Boltzmann constant erg K-1
σ = 2*π^5*k_B^4/(15*h^3*c^2) # Stefan-Boltzmann constant
function B_λ(λ,T) #λ in nm, T in Kelvin
    λ_cm = λ*1e-7
    return 2*h*c^2/λ_cm^5*(1/(exp(h*c/(λ_cm*k_B*T))-1))
end;
function normalized_B_λ(λ,T) #λ in nm, T in Kelvin
    peak_λ = h*c/(4.965*k_B*T)*1e7 #in nm
    return B_λ(λ,T)/B_λ(peak_λ,T)
end;
```