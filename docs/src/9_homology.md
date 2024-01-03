# Main sequence homology

Goals:

- Homology
- Main-sequence homology (mass-radius relationship)

For reference, this section is based on chapter 7 of the lectures on stellar evolution by Onno Pols, available at https://www.astro.ru.nl/~onnop/education/stev_utrecht_notes/.

## Homology

So far we have derived a series of equations of stellar structure and evolution. Here we will consider stable stellar models, where we take time derivatives to be negligible to the other terms. We have

$$\frac{\mathrm{d}r}{\mathrm{d}m}=\frac{1}{4\pi r^2\rho},\quad\text{Continuity equation}$$
$$\frac{\mathrm{d}P}{\mathrm{d}m}=-\frac{Gm}{4\pi r^4},\quad\text{Hydrostatic equilibrium (HSE)}$$
$$\frac{\mathrm{d}L}{\mathrm{d}m}=\varepsilon_\mathrm{nuc},\quad\text{Energy equation}$$
$$\frac{\mathrm{d}T}{\mathrm{d}m}=-\frac{Gm}{4\pi r^4}\frac{T}{P}\nabla,\quad
\nabla=\begin{cases}
\nabla_\mathrm{rad},\;\nabla_\mathrm{rad}<\nabla_\mathrm{ad} \\
\nabla_\mathrm{ad},\;\nabla_\mathrm{rad}>\nabla_\mathrm{ad} &
\end{cases}$$

The last equation, which comes from the mode of energy transport, is often called the temperature equation. Beware that $\nabla=\nabla_\mathrm{ad}$ is a significant simplification, as for convection to transport any energy at all we need $\nabla>\nabla_\mathrm{ad}$, as we discussed when we derived a form of mixing-length theory. Since we are considering static models, we drop the partial derivative signs.

The equations above pose a significant problem, as even if we make simplistic assumptions about opacities and nuclear reaction rates they are highly non-linear and are not amicable to find analytical solutions. So instead, we will take a different approach. Consider we have a star of mass $M_1$ for which we have a solution to the structure equations, meaning we know $r_1(m)$, $P_1(m)$, $T_1(m)$ and $L_1(m)$. We will then consider a star of mass $M_2$, together with a corresponding solution $r_2(m)$, $P_2(m)$, $T_1(2)$ and $L_2(m)$. To relate both models we will write the equations of stellar structure in terms of a relative mass coordinate

$$x=\frac{m_1}{M_1}=\frac{m_2}{M_2}.$$

For each star, quantities at the same $x$ then mean that we consider them at the same relative mass coordinate. Now, we will assume that both models are such that their radii follow

$$\frac{r_1(x)}{r_2(x)}=\frac{R_1}{R_2}.\tag{7.1}$$

Such two models are called homologous, which means layers of both models at the same mass coordinate are related by a fixed expansion or contraction factor.

Under the assumption of homology we can study how different solutions behave with changing mass and radius, without actually knowing any solution precisely. We do this by considering what $(7.1)$ implies for the solution to the equations of stellar structure for the second star. We apply this logic to each of the equations of stellar structure in the following subsections.

### Continuity equation
Let's start by considering the continuity equation for star 1:

$$\frac{\mathrm{d}r_1}{\mathrm{d}m_1}=\frac{1}{4\pi r_1^2 \rho_1}.$$

We can replace the derivative with one with respect to $x$,

$$\frac{\mathrm{d}r_1}{\mathrm{d}m_1}=\frac{\mathrm{d}r_1}{\mathrm{d}x}\frac{\mathrm{d}x}{\mathrm{d}m_1}=\frac{1}{M_1}\frac{\mathrm{d} r_1}{\mathrm{d}x},$$

such that

$$\frac{\mathrm{d}r_1}{\mathrm{d}x}=\frac{M_1}{4\pi r_1^2 \rho_1}.\tag{7.2}$$

Homology requires that $r_1=r_2(R_1/R_2)$, so replacing on the left hand side we get

$$\left(\frac{R_1}{R_2}\right)\frac{\mathrm{d}r_2}{\mathrm{d}x}=\frac{M_1}{4\pi r_1^2\rho_1},$$

but $(7.2)$ must also hold by swapping indexes $1\rightarrow 2$, so

$$\left(\frac{R_1}{R_2}\right)\frac{M_2}{4\pi r_2^2 \rho_2}=\frac{M_1}{4\pi r_1^2 \rho_1}.$$

Finally, applying $(7.1)$ again we find that

$$\boxed{\frac{\rho_1(x)}{\rho_2(x)}=\frac{M_1}{M_2}\left(\frac{R_1}{R_2}\right)^{-3}},\tag{7.3}$$

### Equation of Hydrostatic Equilibrium

Now we will work with the equation of hydrostatic equilibrium (HSE). Similar to before, we find that

$$\frac{\mathrm{d}P}{\mathrm{d}x}=-\frac{Gm_1M_1}{4\pi r_1^4},$$
$$=-\frac{Gm_2M_2}{4\pi r_2^4}\left(\frac{m_1}{m_2}\right)\left(\frac{M_1}{M_2}\right)\left(\frac{r_2^4}{r_1^4}\right),$$
$$=\frac{\mathrm{d}P_2}{\mathrm{d}x}\left(\frac{M_1}{M_2}\right)^2\left(\frac{R_1}{R_2}\right)^{-4}.$$

We can integrate this for an arbitrary $x$ up to the surface ($x=1$), where ignoring surface pressure we obtain

$$\boxed{\frac{P_1(x)}{\mathrm{P_2(x)}}=\left(\frac{M_1}{M_2}\right)^2\left(\frac{R_1}{R_2}\right)^{-4}}\tag{7.4}$$

### Equation of state

By using the equation of state we can also connect pressure, density temperature and composition. Lets consider an ideal gas equation of state, without radiation pressure and a fixed mean molecular weight $\mu$,

$$P=\frac{\rho}{\mu m_\mathrm{u}}k_\mathrm{B}T.$$

We can consider this EOS for both stars with potentially different $\mu_1$ and $\mu_2$, in which case we get

$$\frac{P_1}{P_2}=\frac{\rho_1}{\rho_2}\left(\frac{\mu_1}{\mu_2}\right)^{-1}\frac{T_1}{T_2}.$$

Using $(7.3)$ and $(7.4)$ we find

$$\left(\frac{M_1}{M_2}\right)^2\left(\frac{R_1}{R_2}\right)^{-4}=\frac{M_1}{M_2}\left(\frac{R_1}{R_2}\right)^{-3}\left(\frac{\mu_1}{\mu_2}\right)^{-1}\frac{T_1}{T_2}$$
$$\rightarrow \boxed{\frac{T_1(x)}{T_2(x)}=\frac{\mu_1}{\mu_2}\frac{M_1}{M_2}\left(\frac{R_1}{R_2}\right)^{-1}}\tag{7.5}$$

### Radiative energy transport

Next, we will consider radiative energy transport. We have that

$$\frac{\mathrm{d}(T_1^4)}{\mathrm{d}x}=-\frac{3\kappa_1 l_1 M_1}{16\pi^2 a c r_1^4},\tag{7.6}$$

where we use $l=L(M)$ to reserve $L$ for the surface luminosity. We assume a general power-law form for the opacity,

$$\kappa = \kappa_0 \rho^a T^b. \tag{7.7}$$

For bound-free and free-free opacity, the Kramer's law indicates $a=1$ and $b=3.5$ in particular. As one of the exercises of today's session it is shown that $(7.5)$, $(7.6)$ and $(7.7)$ imply that

$$\left(\frac{T_1(x)}{T_2(x)}\right)^4=\frac{l_1(x)}{l_2(x)}\frac{M_1}{M_2}\frac{\kappa_1}{\kappa_2}\left(\frac{R_1}{R_2}\right)^{-4}.$$

Further applying $(7.5)$ provides the homology relationship for luminosity:

$$\boxed{\frac{l_1(x)}{l_2(x)}=\left(\frac{\mu_1}{\mu_2}\right)^4\left(\frac{M_1}{M_2}\right)^3\left(\frac{\kappa_1}{\kappa_2}\right)^{-1}}.\tag{7.8}$$

From this we see that the surface luminosity of homologous models scales steeply with mass,

$$L\propto \kappa^{-1}\mu^{4}M^3.$$

Note that this is independent of the energy source powering the star!

### Main sequence homology

The relationships derived so far allow us to determine how the different properties of a homogeneous star scale with mass and radius. These relationships can be used to describe a star that is out of thermal equilibrium, where its energy source comes from sinking in its own potential well. Placing an extra homology constraint can the allow us to determine a mass-radius relationship. We can do this by applying the equation of thermal equilibrium,

$$\frac{\mathrm{d}l}{\mathrm{d}m}=\varepsilon_\mathrm{nuc}.$$

It is by including this that we have information on the nuclear burning process and can thus discuss the main sequence (meaning, the core-hydrogen burning phase). From the exercises of the previous class we saw that one can approximate a reaction rate using a power law in temperature, such that

$$\varepsilon_\mathrm{nuc}=\varepsilon_0 \rho T^\nu.$$

With this the equation of thermal equilibrium reads

$$\frac{\mathrm{d}l_1}{\mathrm{d}x}=\varepsilon_0 M_1 \rho_1 T_1^\nu$$
$$=\frac{\mathrm{d}l_2}{\mathrm{d}x}\frac{M_1}{M_2}\frac{\rho_1}{\rho_2}\left(\frac{T_1}{T_2}\right)^\nu.$$

All terms in parenthesis are not functions of $x$ given $(7.3)$ and $(7.5)$ so we can integrate from the core to an arbitrary $x$ to find (where we take $l(0)=0$),

$$\frac{l_1(x)}{l_2(x)}=\frac{M_1}{M_2}\frac{\rho_1}{\rho_2}\left(\frac{T_1}{T_2}\right)^\nu.$$

But we already have homology relationships for $l(x)$ (eq. $(7.8)$), $\rho(x)$ (eq. $(7.3)$) and $T(x)$ (eq. $(7.5)$). If we make use of these we get

$$\left(\frac{\mu_1}{\mu_2}\right)^4\left(\frac{M_1}{M_2}\right)^3\left(\frac{\kappa_1}{\kappa_2}\right)^{-1}=\frac{M_1}{M_2}\cdot \frac{M_1}{M_2}\left(\frac{R_1}{R_2}\right)^{-3}\cdot \left(\frac{\mu_1}{\mu_2}\right)^\nu\left(\frac{M_1}{M_2}\right)^\nu\left(\frac{R_1}{R_2}\right)^{-\nu},$$

From which we get a direct relationship between the mass and the radius,

$$\frac{R_1}{R_2}=\left(\frac{\mu_1}{\mu_2}\right)^{(\nu-4)/(\nu-3)}\left(\frac{M_1}{M_2}\right)^{(\nu-1)/(\nu+3)}\left(\frac{\kappa_1}{\kappa_2}\right)^{1/(\nu+3)}.$$

For the conditions at which stars undergo PP and CNO burning in their cores one has that $\nu\simeq 4$ and $\nu\simeq 18$ respectively. So, ignoring the dependence in opacity, we see that the radius of the star at the zero-age main sequence (start of hydrogen burning with homogeneous composition) is expected to increase with mass. Although this might appear obvious, it is not. In particular this is the opposite to what we found for degenerate stars, which we can approximate through polytropic models that have a decreasing radius with mass.