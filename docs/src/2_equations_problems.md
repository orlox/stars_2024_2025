# Exercises

## List of exercises

### 1: Constant density star 
Consider a star with constant density,

$$\rho(m)=\rho_\mathrm{c},\quad m(r) =\frac{4\pi}{3}r^3 \rho_\mathrm{c}.$$

Use the equation of hydrostatic equilibrium in its Eularian form,

$$\frac{\partial P}{\partial r} = -\rho g=-\frac{\rho G m(r)}{r^2},$$

to obtain the interior pressure of the star as a function of the central pressure $P_\mathrm{c}$ and $r/R$, where $R$ is the total radius of the star. Assume that the pressure at the surface of the star is much smaller than the central pressure.

### 2: Lower bound on central pressure of the Sun
Using the Lagrangian form of the equation of hydrostatic equilibrium,

$$\frac{\partial P}{\partial m}=-\frac{Gm}{4\pi r^4},$$

place a lower bound on the central density of the sun by making use of the basic property that anywhere within the stellar interior we have that $r<R_\odot$.

### 3: Dynamical instability

Consider a polytropic equation of state of the form

$$P = K \rho^\gamma,$$

where $C$ is a constant. If the density of a fluid element is perturbed slightly by an amount $\delta \rho\ll\rho$, then the pressure is perturbed by an amount

$$P_0+\delta P = K (\rho_0+\delta\rho)^\gamma \simeq K\rho_0^\gamma\left(1+\frac{\gamma \delta\rho}{\rho_0}\right),$$

where $P_0$ and $r_0$ are the unperturbed values of pressure and density. It follows that the perturbations on density and pressure can be related to each other:

$$\frac{\delta P}{P_0}=\gamma\frac{\delta \rho}{\rho_0}.$$

Using this answer the following questions:

- If the radii $r_0(m)$ of each mass shell in a star is perturbed by $\delta r=\alpha r_0$ (where $\alpha\ll 1$ is a small positive number independent of $m$), show that the stellar density is perturbed at each point by an amount $\delta \rho/\rho_0=-3\alpha$ at each point of the star. To do this, take the continuity equation of the unperturbed fluid,  

    $$\displaystyle\frac{\partial r_0}{\partial m}=\frac{1}{4\pi\rho_0 r_0^2},$$

    and find $\delta \rho/\rho_0$ from its perturbed form  

    $$\displaystyle\frac{\partial (r_0+\alpha r_0)}{\partial m}=\frac{1}{4\pi(\rho_0+\delta \rho) (r_0+\alpha r_0)^2},$$

    by ignoring perturbation terms of quadratic order.

- Assume the unperturbed star is in hydrostatic equilibrium,  

    $$\displaystyle\frac{1}{4\pi r_0^2}a_r=-\frac{\partial P_0}{\partial m}-\frac{G m}{4\pi r_0^4}=0,$$

    where $a_r$ is the radial component of the acceleration. Compute the resulting acceleration after the perturbation $\delta r=\alpha r_0$. For which values of $\gamma$ does the resulting acceleration point inwards or outwards? What does this say about stability?

### Mass-Radius relationship for a polytrope

The structure of a star with a polytropic equation of state $P=K \rho^{1+1/n}$ can be computed using the Lane-Emden equation,

$$\frac{1}{z^2}\frac{d}{dz}\left(z^2\frac{d w_n}{d z}\right)=-w_n^n,$$

where

$$\rho=\rho_\mathrm{c}w_n^n, \quad P=P_c w_n^{1+n}, \quad r = r_n z, \quad r_n^2\equiv\frac{(n+1)P_\mathrm{c}}{4\pi G \rho_\mathrm{c}^2}.$$

The central boundary conditions for this equation are $w_n(0)=1$ and $w_n'(0)=0$, while the surface is defined by the first zero of $w_n$, at which point we define $z_1$ and $R=r_n z_1$.

- Show that the mass contained inside a given value of the coordinate $\xi$ is given by  
$m(z)=4\pi r_n^3 \rho_\mathrm{c}(-z^2 w_n'(z)).$
- Show that for an equation of state $P=K\rho^{5/3}$ higher mass stars have smaller radii.

## Solutions

### Constant density star

Using the expression of $m(r)$ we can write the hydrostatic equilibrium equation as,

$$\frac{\partial P}{\partial r} = -\frac{4\pi \rho_c^2 G}{3} r,$$

which can be integrated from the core to the surface

$$\int_0^R \frac{\partial P}{\partial r} dr = P_\mathrm{s} - P_\mathrm{c}=-\frac{4\pi \rho_c^2 G}{6} R^2.$$

Ignoring the surface pressure $P_\mathrm{s}$ we obtain the central density of the star

$$P_c = \frac{4\pi \rho_c^2 G}{6} R^2.$$

The pressure at an arbitrary radius can be obtained by changing the integration limits

$$\int_0^r \frac{\partial P}{\partial r} dr = P(r) - P_\mathrm{c}=-\frac{4\pi \rho_c^2 G}{6} (r^2-R^2)=P_\mathrm{c}(1-r^2/R^2).$$

### Lower bound on central pressure of the Sun

We can integrate the equation over mass, again ignoring central pressure:

$$\int_0^{M} \frac{\partial P}{\partial m} dm = -P_\mathrm{c}=-\int_0^{M} \frac{Gm}{4\pi r^4}$$

Since $r<R$, we can place a bound on the integral by replacing $r$ with $R$,

$$P_\mathrm{c} > \int_0^{M} \frac{Gm}{4\pi R^4}=\frac{GM^2}{8\pi R^4}.$$

It is quite common to write expressions like this for any star, but scaled to the properties of the Sun. We can do this by evaluating the expression for the solar radius and mass, while keeping the relevant power laws on mass and radius:

$$P_\mathrm{c}=\frac{GM^2}{8\pi R^4}\left(\frac{M}{M_\odot}\right)^2\left(\frac{R}{R_\odot}\right)^{-4}\simeq 4.5\times 10^{14}\;\mathrm{[dyne\;cm^{-2}]} \left(\frac{M}{M_\odot}\right)^2\left(\frac{R}{R_\odot}\right)^{-4}.$$

Considering one atmosphere is $\sim 10^6\;\mathrm{dyne\;cm^{-2}}$, this means the core of the sun has over eight orders of magnitude higher pressure than we get on our daily lives!

### Dynamical instability

We start by noting that:

$$\frac{1}{(r_0+\alpha r_0)^2} = \frac{1}{r_0^2(1+\alpha)^2}=\frac{1-2\alpha}{r_0^2}$$

and

$$\frac{1}{\rho_0+\delta \rho} = \frac{1}{\rho_0(1+\delta \rho/\rho_0)}=\frac{1-\delta \rho/\rho}{\rho_0}.$$

The continuity equation then reads as

$$\frac{\partial r_0}{\partial m}(1+\alpha)=\frac{1}{4\pi r_0^2 \rho_0}(1-2\alpha)(1-\delta\rho/\rho_0),$$

and replacing $\partial r_0/\partial m$ with the unperturbed continuity equation, while ignoring quadratic perturbation terms, gives us the desired result:

$$\frac{\delta \rho}{\rho_0}=-3\alpha,$$

which as expected is negative (a lowering of density) with expansion. With this we immediately know that $\delta P/P_0=-3\alpha\gamma$. Next we want to obtain the sign of the acceleration after the perturbation,

$$\frac{1}{4\pi (r_0+\alpha r_0)^2}\frac{\partial^2 r_0}{\partial t^2} = -\frac{\partial P_0}{\partial m}(1-3\alpha\gamma) - \frac{Gm}{4\pi r_0^4}(1-4\alpha).$$

Since we only care about the sign of the acceleration, we don't need to expand the left-hand side further. For the right-hand side we use the equation of hydrostatic equilibrium for the unperturbed state to obtain:

$$\frac{1}{4\pi (r_0+\alpha r_0)^2}\frac{\partial^2 r_0}{\partial t^2} = \frac{Gm}{4\pi r_0^4}\times \alpha(4-3\gamma).$$

This implies that for expansion ($\alpha>0$) we will get an outwards acceleration if $\gamma<4/3$, which is an unstable situation. Conversely, if we had contraction ($\alpha<0$) we would obtain a negative acceleration.

### Mass-Radius relationship for a polytrope

The mass of the star up to a certain radius can be obtained by integrating the continuity equation:

$$m(r)=\int_0^r 4\pi r^2 \rho dr.$$

Using $\rho = \rho_c w_n^n$ we find

$$m(r)=4\pi r^2 \rho_c \int_0^r r^2 w_n^n dr = 4\pi r_n^3 \rho_c \int_0^z z^2 w_n^n.$$

The integrand can be replaced using the Lane-Equation, which gives allows for immediate integration:

$$m(z)=4\pi r_n^3 \rho_c \int_0^z \frac{d}{d z}\left(-z^2 w_n'\right)=4\pi r_n^3 \rho_c (-z^2 w_n'),$$

giving the total mass when evaluated at $z=z_1$.

To obtain the mass-radius relationship, we note from the definition of $r_n$ that

$$R\propto r_n\propto \sqrt{\frac{P_\mathrm{c}}{\rho_c^2}}\propto \rho_c^{-1/2+1/2n},$$

and since $M\propto r_n^3\rho_c$ we get the scaling between mass and central density:

$$M\propto \rho_c^{-1/2+3/2n}.$$

Combining the equations for R and M we find that

$$R\propto M^\beta,\quad \beta=\frac{1-n}{3-n}.$$

A negative exponent, indicative of a decreasing radius with mass, happens between n=1 and 3.
One can use the case $n=0$, corresponding to constant density, as a validity check. What value of $\beta$ do you expect then?
An equation of state $P\propto \rho^{5/3}$ corresponds to $n=1.5$, and the above shows we expect more compact stars as mass increases.
As we will see in a few classes, this case corresponds to a fully degenerate non-relativistic gas, and can be used to describe the properties of white dwarfs. An equation of state $P\propto \rho^{4/3}$ corresponds to $n=3$, which we can see is a critical point where the above expression is undefined. Yet again, the $4/3$ value holds an important meaning!