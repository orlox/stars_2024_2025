# Exercises

## List of exercises

### 1: Timescales for different burning phases

Consider the main isotopes of hydrogen, helium, carbon and oxygen that are produced through nuclear reactions in stellar interiors:

| **isotope** | $Z$ | $A$ | $m/m_u$ |
|:-----------:|:---:|:---:|:----------:|
|    **H**    |  1  |  1  |  1.007825  |
|    **He**   |  2  |  4  |  4.002603  |
|    **C**   |  6  |  12  |  12.000000  |
|    **O**   |  8  |  16  |  15.994915  |

Simplify all nuclear burning stages by assuming that they proceed as (we ignore neon burning here):
- The star is composed purely of helium at the start
- All hydrogen is burnt into helium
- All helium is burnt into carbon
- All carbon is burnt into oxygen

If through these burning phases the star has a fixed luminosity, determine the duration of each core helium and core carbon burning relative to the core hydrogen burning phase. Ignore any energy loss through neutrinos.

### 2: Homology for radiative energy transport

Given the equation for the temperature gradient in a region where energy is transported through radiation, we have that

$$\frac{dT^4}{dm}=-\frac{3\kappa l}{16\pi^2 a c r^4}.$$

Assuming an ideal gas law without radiation, and an opacity of
the form $\kappa=\kappa_0 \rho^aT^b$ (with $a$ and $b$ constant) show that two homologous stars of constant opacity (but not necessarily equal opacity between them) satisfy the relationship

$$\left(\frac{T_2(x)}{T_1(x)}\right)^4=\frac{l_2(x)}{l_1(x)}\frac{M_2}{M_1}\frac{\kappa_2}{\kappa_1}\left(\frac{R_2}{R_1}\right)^4.$$

### 3: Homologous contraction

Consider the homology relations derived using the equation of continuity and the equation of hydrostatic equilibrium,

$$\frac{\rho_2(x)}{\rho_1(x)}=\frac{M_2}{M_1}\left(\frac{R_2}{R_1}\right)^{-3},\quad \frac{P_2(x)}{P_1(x)}=\left(\frac{M_2}{M_1}\right)^2\left(\frac{R_2}{R_1}\right)^{-4}.$$

These expressions can be used to describe a star contracting homologously with a fixed mass, meaning that $M_1=M_2$ and $R_1$ and $R_2$ represent the radii at two different stages of contraction. Show from this that as the star contracts homologously it satisfies

$$\frac{\dot{P}(m)}{P(m)}=-4\frac{\dot{R}}{R}=\frac{4}{3}\frac{\dot{\rho}(m)}{\rho(m)}.$$

Making use of the EOS quantities

$$\chi_T\equiv \left(\frac{\partial \ln P}{\partial \ln T}\right)_\rho, \quad \chi_\rho\equiv \left(\frac{\partial \ln P}{\partial \ln \rho}\right)_T,$$

show that

$$\frac{\dot{T}(m)}{T(m)}=\frac{1}{\chi_T}\left(\frac{4}{3}-\chi_\rho\right)\frac{\dot{\rho}(m)}{\rho(m)}=\frac{1}{\chi_T}\left(3\chi_\rho-4\right)\frac{\dot{R}}{R}.$$

What does this implies for the temperature of a star composed of an ideal gas? What about the temperature for a non-relativistic degenerate gas?

## Solutions

### 1: Timescales for different burning phases

If the luminosity is fixed, we only need to consider the mass difference per baryon through each burning stage. For Hydrogen burning we will have:

$$\frac{\Delta m_{H-He}}{m_\mathrm{u}}=\left(1.007825-\frac{4.002603}{4}\right)=0.007174.$$

We repeat this for all other stages:

$$\frac{\Delta m_{He-C}}{m_\mathrm{u}}=\left(\frac{4.002603}{4}-\frac{12}{12}\right)=0.000651,$$
$$\frac{\Delta m_{C-O}}{m_\mathrm{u}}=\left(\frac{12}{12}-\frac{15.994915}{16}\right)=0.000318.$$

From this one finds that core helium burning lasts only $\sim 10\%$ of the duration of the core-hydrogen burning phase, while core-carbon burning lasts just $\sim 5\%$ of the core hydrogen burning phase. In practice most stars actually becomes more luminous through their evolution, exacerbating this further!

### 2: Homology for radiative energy transport

We start by changing the derivative to one with respect to $x=m/M$,

$$\frac{dT^4}{dx}=-\frac{3\kappa l M}{16\pi^2 a c r^4}.$$

We consider a solution to the equations of stellar structure which we denote with the subscript $1$, and consider another analogous solution with a subscript $2$. The equation for radiative energy transport for star $1$ can be written as

$$\frac{dT_1^4}{dx}=-\frac{3\kappa_1 l_1 M_1}{16\pi^2 a c r_1^4}=-\frac{3\kappa_2 l_2 M_2}{16\pi^2 a c r_2^4}\left[\frac{l_2}{l_1}\frac{M_1}{M_2}\frac{\kappa_2}{\kappa_1}\left(\frac{r_2}{r_1}\right)^4\right].$$

On the right hand side we identify the equation of radiative energy transport for star $2$, such that we have

$$\frac{dT_1^4}{dx}=\frac{dT_2^4}{dx}\left[\frac{l_2}{l_1}\frac{M_1}{M_2}\frac{\kappa_2}{\kappa_1}\left(\frac{r_2}{r_1}\right)^4\right].$$

The desired result is then obtained by integrating from an arbitrary value of $x$ all the way to the surface ($x=1$), while ignoring the temperature at the surface. We can take the entire term in the brackets as constant, as we have shown in class that an ideal gas law without radiation implies $T$ follows a simple homology relationship. This means $\kappa=\kappa_0\rho^a T^b$ will do to, so the equation of radiative energy transport implies the same thing for the luminosity.

### 3: Homologous contraction

Considering two homologous stars with the same mass but different radii, we get

$$\frac{\rho_2(x)}{\rho_1(x)}=\left(\frac{R_2}{R_1}\right)^{-3},\quad \frac{P_2(x)}{P_1(x)}=\left(\frac{R_2}{R_1}\right)^{-4}.$$

Fixing the values for star $2$, and taking the properties of star $1$ to represent those of a homologously contracting star, we obtain

$$\rho_1(x,t) = C_1(x) [R_1(t)]^{-3},\quad P_1(x,t) = C_2(x) [R_1(t)]^{-4},$$

from which the derivatives of density and pressure with respect to radius are straightforward to derive,

$$\frac{\dot{P}(m)}{P(m)}=-4\frac{\dot{R}}{R}=\frac{4}{3}\frac{\dot{\rho}(m)}{\rho(m)}.$$

To switch from pressure to density we make use of the relationship

$$\frac{dP}{P}=\chi_T\frac{dT}{T}+\chi_\rho\frac{d\rho}{\rho},$$

which combined with the previous equation results in

$$\chi_T \frac{\dot{T}}{T}+\chi_\rho\frac{\dot{\rho}}{\rho}=\frac{4}{3}\frac{\dot{\rho}(m)}{\rho(m)}.$$

Using the derived relationship between $\dot{R}/R$ and $\dot{\rho}/\rho$ we obtain the temperature time derivative as a function of the radial time derivative,

$$\frac{\dot{T}(m)}{T(m)}=\frac{1}{\chi_T}\left(3\chi_\rho-4\right)\frac{\dot{R}}{R}.$$

As contraction implies a negative $\dot{R}$, we find that the temperature will increase if the fluid has $\chi_\rho<4/3$. This is the case in particular for an ideal gas, specifically for the case where we can ignore radiation one has $\chi_\rho = 1$. If we instead consider a non-relativistic degenerate gas, we have instead that $\chi_\rho=5/3$, implying that a degenerate star will cool down with contraction.