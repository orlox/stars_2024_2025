# Exercises

## List of exercises

### 1: The Ledoux criterion

As a star undergoes nuclear burning, it produces a composition gradient in its interior. This composition gradient affects the Brunt-Väisälä frequency and thus the stability criterion for convection. Consider an equation of state where this composition dependence is characterised by the mean molecular weight $\mu$ of the fluid, such that $\rho=\rho(P,T,\mu)$ and

$$\frac{d\rho}{\rho}=\alpha\frac{dP}{P}-\delta\frac{dT}{T}+\varphi\frac{d\mu}{\mu},$$

where

$$\alpha\equiv \left(\frac{\partial \ln \rho}{\partial \ln P}\right)_{T,\mu},\quad
\delta\equiv -\left(\frac{\partial \ln \rho}{\partial \ln T}\right)_{P,\mu},\quad
\varphi\equiv \left(\frac{\partial \ln \rho}{\partial \ln \mu}\right)_{P,T}.$$

Show that for an adiabatic displacement of a mass element at a subsonic velocity (such that the pressure of the surrounding medium and the element equalizes), the stability criterion is:

$$\nabla<\nabla_\mathrm{ad}+\frac{\varphi}{\delta}\nabla_\mu,\quad \nabla_\mu\equiv \left(\frac{d \ln \mu}{d \ln P}\right)_\mathrm{s},$$

where $\nabla_\mu$ describes the composition gradient of the medium surrounding the displaced mass element. This is known as the Ledoux criterion. Remember that for stability we require that

$$\left(\frac{d\rho}{dr}\right)_\mathrm{e}-\left(\frac{d\rho}{d r}\right)_\mathrm{s}>0$$

where $\mathrm{e}$ and $\mathrm{s}$ stand for the properties of the environment and the surrounding. We can assume the displaced mass element has a constant $\mu$. Radial derivatives can be turned into pressure derivatives by multiplication with the pressure scale height $H_P\equiv -P dr/dP$.

### Core convection

Consider the radiative temperature gradient

$$\nabla_\mathrm{rad}=\frac{3}{16\pi a c G}\frac{\kappa l P}{m T^4}.$$

And the adiabatic temperature gradient, which for an ideal gas without radiation gives

$$\nabla_\mathrm{ad}=\frac{P\delta}{T\rho c_P}=\frac{2}{5}.$$

Near the core of a star undergoing some form of nuclear burning in thermal equlibrium, we have from the energy equation that

$$\frac{\partial l}{\partial m}=\varepsilon_\mathrm{nuc}.$$

- For a star with a given central value of the nuclear energy generation rate $\varepsilon_\mathrm{nuc,c}$, as a well as a known central pressure $P_\mathrm{c}$ and central temperature $T_\mathrm{c}$, determine the value of $\nabla_\mathrm{rad}$ at its core. You will need to determine $l(m)$ near the center of the star.
- A detailed model of the Sun with a metallicity $Z=0.02$ and a hydrogen mass fraction $X=0.7$ has, at the onset of core hydrogen burning, $\varepsilon_\mathrm{nuc,c}\simeq 14\;\mathrm{erg\;s^{-1}\;g^{-1}}$, $P_\mathrm{c}=1.5\times 10^{17}\;\mathrm{dyn\;cm^{-2}}$ and $T_\mathrm{c}=1.4\times 10^{7}\;\mathrm{K}$. Do you expect its core to be convective or radiative? Take the value $\nabla_\mathrm{ad}=2/5$, which corresponds to an ideal monoatomic gas. Take also $\kappa=0.2(1+X)\;\mathrm{cm^{2}\;g^{-1}}$ which corresponds to the electron scattering opacity and is a good approximation at the core of a hydrogen burning star.
- Answer the same question but for a $10 M_\odot$ star, from which a detailed model gives $\varepsilon_\mathrm{nuc,c}\simeq 3.4\times 10^{4}\;\mathrm{erg\;s^{-1}\;g^{-1}}$, $P_\mathrm{c}=4.0\times 10^{16}\;\mathrm{dyn\;cm^{-2}}$ and $T_\mathrm{c}=3.2\times 10^{7}\;\mathrm{K}$.

You will need the following constants:
-  $a\sim 7.6\times 10^{-15}\;\mathrm{erg\;cm^{-3}\;K^{-4}}$
-  $G\sim 6.7\times 10^{-8}\;\mathrm{cm^3\;g^{-1}\;s^{-2}}$
-  $c\sim 3\times 10^{10}\;\mathrm{cm\;s^{-1}}$.

### Envelope convection in the Sun

Stars with the mass of the Sun are expected to have an outer convective envelope. How much superadiabaticity (meaning, $\nabla-\nabla_\mathrm{ad}$) is actually required to drive the solar luminosity through it? Ignoring energy losses from radiation for convective elements we have estimated the energy flux to be

$$F_\mathrm{con}=\rho c_P T \sqrt{g \delta}\frac{l_m^2}{4\sqrt{2}}H_P^{-3/2}(\nabla-\nabla_\mathrm{ad})^{3/2}.$$

In the mixing length model, it is common to take $l_\mathrm{MLT}=\alpha_\mathrm{MLT} H_P$, where $\alpha_\mathrm{MLT}$ is a dimensionless quantity. From a detailed stellar evolution model similar to the sun, one finds that at $r=0.8R_\odot$ the star is unstable to convection and has:

-  $m(r=0.8R_\odot)= 0.99M_\odot.$ You can just approximate this as $M_\odot$.
-  $\rho(r=0.8R_\odot)\sim 0.1\;\mathrm{g\;cm^{-3}}$
-  $T(r=0.8R_\odot)\sim 1\times 10^6\;\mathrm{K}$
-  $P(r=0.8R_\odot)\sim 2\times 10^{13}\;\mathrm{dyn\;cm^{-2}}$

Taking $\alpha_\mathrm{MLT}=1$, what is the value of $\nabla-\nabla_\mathrm{ad}$ required to carry the entire luminosity $L_\odot$ of the Sun through convection at this point?

To compute the pressure scale height $H_P=-P dr/dP$ you will need to make use of the equation of hydrostatic equilibrium,

$$\frac{dP}{dr}=-\frac{Gm(r)\rho}{r^2}.$$

For $\delta$ and $c_P$ take the values that correspond to an ideal monoatomic gas without radiation,

$$\delta=1,\quad c_P=\frac{5}{2}\frac{k_B}{\mu m_u},$$

and for the purpose of this exercise you can just approximate $\mu\sim 1/2$, which corresponds to an ionized hydrogen gas.

Additional constants you will require:
-  $G\sim 7\times 10^{-8}\;\mathrm{cm^3\;g^{-1}\;s^{-2}}$
-  $M_\odot \sim 2\times 10^{33}\;\mathrm{g}$
-  $R_\odot \sim 7\times 10^{10}\;\mathrm{cm}$
-  $L_\odot \sim 4\times 10^{33}\;\mathrm{erg\;s^{-1}}$
-  $k_B\sim 1 \times 10^{-16}\;\mathrm{erg\;K^{-1}}$
-  $m_\mathrm{u}\sim 2\times 10^{-24}\;\mathrm{g}$

## Solutions

### 1: The Ledoux criterion

Using the expression for $d\rho/\rho$, we find that

$$\frac{1}{\rho}\left[\left(\frac{d\rho}{dr}\right)_\mathrm{e}-\left(\frac{d\rho}{d r}\right)_\mathrm{s}\right] = \frac{\alpha}{P}\left(\frac{d P}{dr}\right)_\mathrm{e} -\frac{\delta}{T}\left(\frac{d T}{dr}\right)_\mathrm{e}+\frac{\varphi}{\mu}\left(\frac{d \mu}{dr}\right)_\mathrm{e}-\frac{\alpha}{P}\left(\frac{d P}{dr}\right)_\mathrm{s}+\frac{\delta}{T}\left(\frac{d T}{dr}\right)_\mathrm{s}-\frac{\varphi}{\mu}\left(\frac{d \mu}{dr}\right)_\mathrm{s}$$

Since the pressure of the environment is equalized to that of the displaced element, the pressure derivatives cancel. Also, since the composition of the displaced element remains fixed, we can ignore its $\mu$ derivative:

$$\frac{1}{\rho}\left[\left(\frac{d\rho}{dr}\right)_\mathrm{e}-\left(\frac{d\rho}{d r}\right)_\mathrm{s}\right] = -\frac{\delta}{T}\left(\frac{d T}{dr}\right)_\mathrm{e}+\frac{\delta}{T}\left(\frac{d T}{dr}\right)_\mathrm{s}-\frac{\varphi}{\mu}\left(\frac{d \mu}{dr}\right)_\mathrm{s}.$$

Multiplication by $H_P$ turns the derivatives into derivatives with respect to pressure,

$$\frac{H_P}{\rho}\left[\left(\frac{d\rho}{dr}\right)_\mathrm{e}-\left(\frac{d\rho}{d r}\right)_\mathrm{s}\right] = \frac{P\delta}{T}\left(\frac{d T}{dP}\right)_\mathrm{e}-\frac{P\delta}{T}\left(\frac{d T}{dr}\right)_\mathrm{s}+\frac{P\varphi}{\mu}\left(\frac{d \mu}{dr}\right)_\mathrm{s}.$$

Turning all derivatives on the right side on logarithmic derivatives of the form $d \ln X/d\ln P$, we get

$$\frac{H_P}{\rho}\left[\left(\frac{d\rho}{dr}\right)_\mathrm{e}-\left(\frac{d\rho}{d r}\right)_\mathrm{s}\right] = \delta\nabla_\mathrm{e}-\delta\nabla+\varphi\nabla_\mu.$$

For an adiabatic displacement where $\nabla_\mathrm{e}=\nabla_\mathrm{ad}$, the stability condition is then:

$$\delta\nabla_\mathrm{ad}-\delta\nabla+\varphi\nabla_\mu > 0,$$

which gives the desired result if $\delta>0$. Do you expect $\delta>0$?

### Core convection

Near the core, the luminosity as a function of mass is given by

$$l(m)=\varepsilon_\mathrm{nuc,c}m,$$

such that the radiative temperature gradient is independent of mass,

$$\nabla_\mathrm{rad,c}=\frac{3}{16\pi a c G}\frac{\kappa \varepsilon_\mathrm{nuc,c} P}{T^4}.$$

Evaluating this for the given central properties of the Sun and the $10M_\odot$ star gives us:

$$\mathrm{Sun:}\quad\nabla_\mathrm{rad,c}=0.07,$$
$$\mathrm{10M_\odot:}\quad\nabla_\mathrm{rad,c}=1.7.$$

Taking $\nabla_\mathrm{ad}=2/5$ we find that the core of the Sun is expected to be stable to convection, while that of a massive star is expected to be unstable to it.

### Envelope convection in the Sun

We only need to compute $F_\mathrm{con}=L/(4\pi r^2)$ and

$$H_P\sim \frac{P r^2}{GM_\odot \rho}\sim 0.06 R_\odot,$$

which shows that in the mixing length model with $\alpha_\mathrm{MLT}$ of order unity we expect convective elements to travel a large distance compared to the stellar radius. Using this we can just evaluate the superadiabaticity,

$$\nabla-\nabla_\mathrm{ad} \sim 10^{-6},$$

so indeed in these conditions we would expect a very small digression from $\nabla_\mathrm{ad}$ to be sufficient to transport all energy. Be aware though that we are ignoring radiative losses in convective blobs. In the full mixing length model, one can find conditions under which this losses are so high that almost all energy is transported through radiation in a convective zone.
