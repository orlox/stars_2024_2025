# Exercises

## List of exercises

### 1: The Eddington limit

The pressure in a gas with radiation can be divided in its contributions from each component,

$$P=P_\mathrm{gas} + P_\mathrm{rad},\quad P_\mathrm{rad}=\frac{aT^4}{3}.$$

The equation of hydrostatic equilibrium can then be expressed as

$$\frac{\partial P_\mathrm{gas}}{\partial r} + \frac{\partial P_\mathrm{rad}}{\partial r} = -\frac{Gm\rho}{r^2}.$$

Using this, find the value of the luminosity for which the radiation pressure would overcome the gravitational force. For this purpose use the expression for the temperature gradient under the assumption that all energy is transported by radiation,

$$\frac{d T}{dr}=\frac{-3}{16 \pi a c}\frac{\kappa \rho l}{r^2 T^3}.$$

This luminosity is known as the Eddington luminosity $L_\mathrm{edd}$, and you should find that

$$L_\mathrm{edd} = \frac{4\pi G m c}{\kappa}.$$

What is the Eddington luminosity of the Sun in units of the solar luminosity $L_\odot\sim 4\times 10^{33}\;\mathrm{[erg\;s^{-1}]}$? For the other constants use $G\sim 7\times 10^{-8}\;\mathrm{[cm^3\;g^{-1}\;s^{-2}]}$, $c\sim 3\times 10^{10}\;\mathrm{[cm\;s^{-1}]}$,, $M_\odot\sim 2\times 10^{33} \mathrm{[g]}$ and approximate the opacity with the electron scattering opacity $\kappa_\mathrm{es}\sim 0.2(1+X)\;\mathrm{[cm^2\;g^{-1}]}$.

### 2: Black hole accretion

Let us do something more exotic. Consider a black hole which accretes an amount $\Delta m$ of mass. Under the right conditions, a lot of energy can be produced in this way, releasing a significant fraction of the rest mass energy $\eta \Delta m c^2$, where $\eta\sim 0.1$ depends on the black hole spin. If a black hole accretes mass at a rate $\dot{M}_\mathrm{acc}$ then it has a corresponding luminosity $L_\mathrm{acc}=\dot{M}_\mathrm{acc}\eta c^2$. Find an expression for the critical value of $\dot{M}_\mathrm{acc}$ at which the luminosity released from accretion matches the Eddington luminosity. This is known as the Eddington limit for the accretion rate $\dot{M}_\mathrm{Edd}$, and beyond this limit accretion into the black hole is suppresed. How long would it take for a $10 M_\odot$ black hole to grow into a supermassive $10^9M_\odot$ black hole while accreting at this rate?

### 3: Conductive opacity

Estimate the conduction coefficient $k_\mathrm{cd}=(l v/3) dU/dT$ for electrons in an ideal hydrogen gas. To do this, consider the internal energy per unit volume of the electrons

$$U \sim \frac{\rho}{m_u}kT,$$

and their characteristic velocity $v_e\sim \sqrt{kT/m_e}$. Estimate the mean free path $l$ by computing an effective cross section $\sigma$ for scattering of the electrons by free protons. This can be done by defining a characteristic impact parameter $b$ that satisfies

$$m_e v_e^2 = \frac{k_\mathrm{C} e^2}{b}$$

where $k_\mathrm{C}$ is the Coulomb constant and $e$ is the electron charge. The cross section can then be estimated as $\sigma \sim \pi b^2$ and the mean free path as $l\sim m_u(\sigma \rho)^{-1}$.

### 4: Conductive versus radiative transport at the core of the Sun

Let us estimate the relative contributions of radiative and conductive energy transport at the core of the Sun, by comparing their corresponding opacities. The conductive opacity can be determined from the conduction coefficient using

$$\kappa_\mathrm{cd} = \frac{4 a c T^3}{3 k_\mathrm{cd}\rho},$$

and from the previous exercise you should have found

$$k_\mathrm{cd} \sim \frac{k_B^{7/2}T^{5/2}}{\pi m_e^{1/2}k_C^2 e^4},$$

and the central density and temperature of the Sun are

$$\rho_\mathrm{c,\odot}\sim 10^2\;\mathrm{[g\;cm^{-3}]},\quad T_\mathrm{c,\odot}\sim 10^7\;\mathrm{[K]}.$$

Compare $\kappa_\mathrm{cd}$ to the electron scattering opacity for radiation $\kappa_\mathrm{es}=0.2(1+X)\;\mathrm{[cm^2\;g^{-1}]}$

Some constant that you will need to use are:
- the electron mass $m_e\sim 10^{-27}\;[\mathrm{g}]$
- the Boltzmann constant $k_\mathrm{B}\sim 10^{-16}\;[\mathrm{cm^2\;g\;s^{-2}\;K^{-1}}]$
- the speed of light $c\sim 3\times 10^{10}\;\mathrm{[cm\;s^{-1}]}$
- the radiation constant $a\sim10^{-14}\;\mathrm{[erg\;cm^{-3}\;K^{-4}]}$
- The Coulomb constant times the square of the electric charge, $k_Ce^2\sim 2\times 10^{-19}\;\mathrm{[cm^3\; g\; s^{-2}]}$

## Solutions

### 1: The Eddington limit

We want to find the value of $l$ that satisfies

$$\frac{\partial P_\mathrm{rad}}{\partial r}=\frac{4aT^3}{3}\frac{\partial T}{\partial r}=-\frac{Gm \rho}{r^2}.$$

Replacing $\partial T/\partial r$ with the expression for the radiative temperature gradient, and calling $l=L_\mathrm{edd}$, we obtain

$$-\frac{\kappa \rho L_\mathrm{Edd}}{4\pi c r^2}=\frac{Gm\rho}{r^2}$$

From this we can compute $L_\mathrm{Edd}$, giving us for the Sun a value of $\sim 4\times 10^4 L_\odot$. Luckily our Sun is not close to being torn by its own radiation!

### 2: Black hole accretion

From the previous exercise we have that

$$L_\mathrm{edd} \sim 4\times 10^4 L_\odot\left(\frac{M}{M_\odot}\right).$$

The eddington accretion rate is then found to be

$$\dot{M}_\mathrm{Edd}=\frac{L_\mathrm{Edd}}{\eta c^2}\sim 2\times 10^{-8}\left(\frac{M}{M_\odot}\right)\; \mathrm{M_\odot\; yr^{-1}}.$$

If a black hole accretes at this limiting rate, its mass as a function of time is given by the differential equation

$$\dot M =\dot{M}_\mathrm{Edd}= C\times M,\quad C\sim 2\times 10^{-8} \;\mathrm{[yr^{-1}]}.$$

Growth is then exponential, with

$$M(t) = M_0 e^{Ct}.$$

If we require a black hole to grow from $10M_\odot$ to $10^9 M_\odot$, we need a time $T$ given by $e^{CT}=10^8$, resulting in $T\sim 1\;\mathrm{[Gyr]}$. One then needs to accrete constantly at this limiting rate to reach the masses of some supermassive black holes observed when the universe was just one gigayear old. 

### 3: Conductive opacity

We have that

$$k_\mathrm{cd} \sim l v \frac{dU}{dT}.$$

Replacing with

$$\frac{dU}{dT}\sim \frac{k_B \rho}{m_u},\quad v\sim\sqrt{\frac{kT}{m_e}},\quad \sigma \sim \left(\frac{k_C e^2}{m_e v^2}\right)^2,$$

we find that

$$ k_\mathrm{cd} \sim \frac{k_B^{7/2}T^{5/2}}{\pi m_e^{1/2}k_C^2 e^4}.$$

The steep dependence with temperature comes from the increased velocity, which not only leads to a faster spread of the diffusing particles but also to a lower effective cross section.

### Conductive versus radiative transport at the core of the Sun

The result for $\kappa_\mathrm{cd}$ at the Solar core comes simply from evaluating the given expression,

$$\kappa_\mathrm{cd}\sim 7000\;\mathrm{[cm^{-2}\;g]}$$

This is of the order $10^3$ larger than the radiative opacity. As the contributions to the luminosity are inversely proportional to opacity, we find that conductive energy transport just accounts for a very small fraction ($< 0.1\%$) of the total flux near the core of the Sun.