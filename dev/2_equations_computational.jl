# # Solving the Lane-Emden equation

#=
Let's compute some numerical solutions to the Lane-Embden equation. A good
reference which was used in the development of this exercise is the book by
[^Hansen2004].
=#

using Plots
using LaTeXStrings

##
#=
By defining the variables $y=dw/dz$, the
Lane-Emden equation can be written as two first-order differential equations:

$$w' = y$$
$$y' = -w^n -\frac{2}{z}y.$$

To numerically solve a continuous differential equation with a computer we need
to rely on a discretization. For example, if we evaluate $z$ in discrete steps
enumerated by $i$ with a spacing $\Delta z$, we have that:

$$z_i = i\Delta z.$$

In terms of this discretization, the pair of differential equations above can be
approximated as:

$$\frac{w_{i+1}-w_i}{\Delta z}=y_i$$
$$\frac{w_{i+1}-w_i}{\Delta z}=-w_i^n - \frac{2}{z} y_i.$$

This is known as the Euler method, and it lets us compute the values at cell
$i+1$ once we know the value at cell $i$. To integrate these equations we will
instead use a more precise method known as a fourth-order Runge-Kutta solver.
The values at cell $i+1$ are obtained in this method as

$$w_{i+1} = w_i +\frac{k_1}{6}+\frac{k_2}{3}+\frac{k_3}{3}+\frac{k_4}{6}$$
$$y_{i+1} = y_i +\frac{l_1}{6}+\frac{l_2}{3}+\frac{l_3}{3}+\frac{l_4}{6},$$

where

$$k_1 = \Delta z\times w'(z_i,w_i,y_i)$$
$$l_1 = \Delta z\times y'(z_i,w_i,y_i)$$
$$k_2 = \Delta z\times w'(z_i+\Delta z/2,w_i+k_1/2,y_i+l_1/2)$$
$$l_2 = \Delta z\times y'(z_i+\Delta z/2,w_i+k_1/2,y_i+l_1/2)$$
$$k_3 = \Delta z\times w'(z_i+\Delta z/2,w_i+k_2/2,y_i+l_2/2)$$
$$l_3 = \Delta z\times y'(z_i+\Delta z/2,w_i+k_2/2,y_i+l_2/2)$$
$$k_4 = \Delta z\times w'(z_i+\Delta z,w_i+k_3,y_i+l_3)$$
$$l_4 = \Delta z\times y'(z_i+\Delta z,w_i+k_3,y_i+l_3).$$

The objective is then to start from the center of the star and integrate
outwards until we reach the first zero of $y$, which represents the stellar
surface. One complication however is that the differential equation for $y'$ is
undefined at the center $(x=0)$. This can be circumvented by using a series
approximation near the center, which is straightforward to derive using the
boundary conditions:

$$w(z)=1-\frac{1}{6}z^2 +\frac{n}{120}z^4
-\frac{n(8n-5)}{15120}z^6+\mathcal{O}(z^8).$$

In the code cell below we define the differential equations as well as a method
to do a single Runge-Kutta step, which returns a tuple with the new $(y,z)$
values in the following cell. We also define the function that approximates $y$
and $z$ for small $\xi$.
=#

dwdz(z,w,y,n) = y
dydz(z,w,y,n) = -w^n-2*y/z

function RK_step(z,w,y,n,Δz)
    k₁ = Δz*dwdz(z,w,y,n)
    l₁ = Δz*dydz(z,w,y,n)

    k₂ = Δz*dwdz(z+Δz/2,w+k₁/2,y+l₁/2,n)
    l₂ = Δz*dydz(z+Δz/2,w+k₁/2,y+l₁/2,n)

    k₃ = Δz*dwdz(z+Δz/2,w+k₂/2,y+l₂/2,n)
    l₃ = Δz*dydz(z+Δz/2,w+k₂/2,y+l₂/2,n)

    k₄ = Δz*dwdz(z+Δz,w+k₃,y+l₃,n)
    l₄ = Δz*dydz(z+Δz,w+k₃,y+l₃,n)

    return (
        w+k₁/6+k₂/3+k₃/3+k₄/6,
        y+l₁/6+l₂/3+l₃/3+l₄/6,
        )
end

w_smallz(z,n) = 1 - 1/6*z^2 + n/120*z^4 -n*(8*n-5)/1520*z^6
y_smallz(z,n) = - 1/3*z + n/30*z^3 -3*n*(8*n-5)/760*z^5

##
#=
Now we will integrate these equations. We start at a small of $z$ and integrate
the equations until $z=20$ (hoping we find a zero by then). Below we do this for $n=1$
=#

#setup grid in z
Δz = 1e-4
n = 1
nsteps = 200_000
zvals = LinRange(Δz,Δz*nsteps,nsteps)

#initialize first value of w and y using series approximation
wvals = zeros(nsteps);yvals = zeros(nsteps)
wvals[1] = w_smallz(Δz, n)
yvals[1] = y_smallz(Δz, n)

#Perform the Runge-Kutta integration
for i in 2:nsteps
    next_values = RK_step(zvals[i-1], wvals[i-1], yvals[i-1], n, Δz)
    wvals[i] = next_values[1]
    yvals[i] = next_values[2]
end


plot(xlabel=L"$z$", ylabel=L"$w$");
#plot!(xvals, 1 .- xvals.^2 ./ 6,label="Analytical") #solution for n=0
plot!(zvals, sin.(zvals)./zvals, linewidth=4,label="Analytical"); #solution for n=1
#plot!(xvals, 1 ./ sqrt.(1 .+ xvals.^2 ./3),label="Analytical")    #solution for n=5
plot!(zvals, wvals, linewidth=6, linestyle=:dash,label="Numerical")

##
#=
To compute the ratio of central density to average density, we define a function
to performs this integration for arbitrary $n$ and looks for the first point
where $w=0$, which gives $z_1$ that corresponds to the surface.
=#

function rhoc_div_rho_avg(n)
    #setup grid in z
    Δz = 1e-4
    nsteps = 200_000
    zvals = LinRange(Δz,Δz*nsteps,nsteps)

    #initialize first value of w and y using series approximation
    wvals = zeros(nsteps);yvals = zeros(nsteps)
    wvals[1] = w_smallz(Δz, n)
    yvals[1] = y_smallz(Δz, n)

    #Perform the Runge-Kutta integration
    for i in 2:nsteps
        next_values = RK_step(zvals[i-1], wvals[i-1], yvals[i-1], n, Δz)
        wvals[i] = next_values[1]
        yvals[i] = next_values[2]
        if wvals[i] < 0
            return 1/3*(-zvals[i]/yvals[i])
        end
    end

    print("Error, did not find zero for n=$n")
end

##

nvals = [0,1,2,3,4]
rhoc_div_rho_avg_vals = rhoc_div_rho_avg.(nvals)

plot(xlabel=L"$n$", ylabel=L"$\rho_\mathrm{c}/\langle \rho \rangle$", yscale=:log)
plot!(nvals, rhoc_div_rho_avg_vals, linewidth=4,label="")

#=
We see that the higher the polytropic index is, the more concentrated the star is.
=#

#=
[^Hansen2004]:
    Stellar interiors : physical principles, structure, and evolution, 2nd ed., by C.J. Hansen, S.D. Kawaler, and V. Trimble. New York: Springer-Verlag, 2004.
    https://ui.adsabs.harvard.edu/abs/2004sipp.book.....H/abstract
=#