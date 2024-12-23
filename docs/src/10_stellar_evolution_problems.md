# Exercises

## List of exercises

### 1: Homology with radiation pressure
The ideal gas law including gas pressure is given by

$$P=P_\mathrm{gas} + P_\mathrm{rad}=\frac{\rho}{\mu m_\mathrm{u}}k_\mathrm{B}T+\frac{aT^4}{3}.$$

The ratio between the gas pressure and the total pressure is denoted by $\beta$,

$$\beta\equiv \frac{P_\mathrm{gas}}{P}=1-\frac{P_\mathrm{rad}}{P}.$$

Often in class we worked by ignoring the radiation pressure term as a simplification. In this exercise the objective is to derive homology relationships which include radiation pressure.

1. Show that the equation of state can be rewritten as
   $$P=C\left(\frac{\rho}{\mu}\right)^{4/3}[f(\beta)]^{1/3},\quad f(\beta)=\frac{1-\beta}{\beta^4},$$
   where $C$ is a combination of fundamental constants.
2. In his pioneering work on stellar structure, prior to computers being capable to integrate the equations of stellar structure, sir Arthur Eddington managed to construct stellar models by making the assumption that stars have a constant value of $\beta$. This was strongly criticized at the time, as it was not a well justified assumption, but turned out to produce quite valuable models. Explain why this assumption makes it easier to compute the structure of a stellar model (Tip: don't overthink it, this can be answered in one or two sentences).
3. In class we derived homology relationships for $\rho$, $P$ and $T$ by applying respectively the equations of continuity, hydrostatic equilibrium and an ideal gas law without radiation pressure. These homology relationships relate the properties of homologous models at the same relative mass coordinate $x=m/M$ in terms of the total mass, radius, and composition of the star.
   To obtain a more general result which does not ignore radiation pressure, use the relationship shown above for $P=P(\rho,\mu,\beta)$ to derive a homology relationship for $f(\beta)$ arising from combining the equation of continuity, the equation of hydrostatic equilibrium and the ideal gas law with radiation pressure included.
4. The function $f(\beta)$ is a monotonically decreasing function in the range $0<\beta<1$. Using the homology relationship derived in the previous part, determine if more massive stars have a larger contribution to their total pressure coming from radiation.

### 2: Chemically homogeneous evolution
It is currently thought that massive stars with high rotation rates experience significant mixing due to meridional circulations in their radiative envelopes. Due to this their abundance remains constant throughout the stellar interior rather than developing a hydrogen poor core with a hidrogen rich envelope, a form of evolution known as chemically homogeneous. Consider a $30M_\odot$ star, which from a MESA model at solar metallicity has a luminosity $L\simeq 10^5 L_\odot$ and an effective temperature $T_\mathrm{eff}\simeq 10^4\;[\mathrm{K}]$ at ZAMS. Derive the homology relationships that describe the evolution of effective temperature and luminosity as a function of the mean molecular weight (assuming an ideal gas for simplicity). Use those results to sketch the main sequence evolution of the star and estimate the luminosity and effective temperature of the star once it reaches the terminal age main sequence (TAMS). Does the star become more or less luminous? Does it evolve towards higher or lower effective temperature?

## Solutions

### 1: Homology with radiation pressure

### 2: Chemically homogeneous evolution

We can make use of the mass-luminosity and mass-radius relationships derived in the previous for main-sequence homology: 

$$L\propto \kappa^{-1}\mu^{4}M^3.$$
$$R\propto \mu^{(\nu-4)/(\nu-3)}M^{(\nu-1)/(\nu+3)}\kappa^{1/(\nu+3)}.$$

In this case, as the star evolves homogeneously keeping a fixed composition throughout, we can apply these relationships by just shifting $\mu$ as evolution proceeds. Considering a massive star undergoing CNO burning, we take $\nu\simeq 18$. We will also ignore changes in mass that can be produced by winds, such that we consider evolution at a fixed mass. Opacity can also change with composition, so we do not ignore its variations. Considering all this we have

$$L\propto \kappa^{-1}\mu^4$$
$$R\propto \mu^{0.93}\kappa^{0.048}.$$

To connect this with the evolution in the HR diagram, we use that

$$T_\mathrm{eff}^4 \propto \frac{L}{R^2},$$

which gives us that

$$T_\mathrm{eff}\propto \kappa^{-1.1}\mu^{2.13}.$$

We can relate the properties at any stage during the main sequence to those at ZAMS by considering the value of $\kappa$ and $\mu$ at each of those stages,

$$L=L_\mathrm{ZAMS}\left(\frac{\kappa}{\kappa_\mathrm{ZAMS}}\right)^{-1}\left(\frac{\mu}{\mu_\mathrm{ZAMS}}\right)^4$$
$$T_\mathrm{eff}=T_\mathrm{ZAMS} \left(\frac{\kappa}{\kappa_\mathrm{ZAMS}}\right)^{-1.1}\left(\frac{\mu}{\mu_\mathrm{ZAMS}}\right)^{2.13}.$$

Now we can consider the variation between the zero-age main sequence with a hydrogen mass fraction of $X\sim 0.7$ and the terminal-age main sequence at $X=0$. Considering electron scattering opacity $\kappa=0.2(1+X)\;\mathrm{cm^2\,g^{-1}}$, we have a reduction in opacity as the star burns hydrogen ($\kappa_\mathrm{TAMS}/\kappa_\mathrm{ZAMS}<0.59$). On the other hand, burning hydrogen into helium leads to an increase in the mean molecular weight. Coupled with the two relationships for $L$ and $T_\mathrm{eff}$ derived above, this implies that the homogeneous star evolves to increasing luminosity and effective temperature during core-hydrogen burning.