# Exercises

## List of exercises

### 1: Degenerate electrons versus ions

A Maxwell-Boltzmann distribution for a gas at temperature $T$ and particles of mass $m$ peaks at a momentum $p_\mathrm{max,MB}=(2 m kT)^{1/2}$.
On the other hand, a fully degenerate gas occupies all states up to the Fermi momentum $p_\mathrm{F}$:

$$n_p(p) = \begin{cases}
\frac{8\pi p^2}{h^3} & p\leq p_\mathrm{F} \\
0 & p> p_\mathrm{F}.
\end{cases}$$

Taking into account that the number density for a given distribution is

$$n = \int_0^\infty n_p(p) dp,$$

compute the Fermi momentum as a function of density $\rho$ for both the electrons and ions of a gas of ionized helium. If we define
critical densities $\rho_\mathrm{crit,e}$ and $\rho_\mathrm{crit,ions}$ as those for which $p_\mathrm{max,MB}/p_\mathrm{F}=1$, what is the value of
$\rho_\mathrm{crit,e}/\rho_\mathrm{crit,ions}$ for this helium gas? What does this imply for the contribution to pressure of ions and electrons?

### 2: Energetics of a degenerate star

Consider the gravitational energy of a fully degenerate star to be

$$E_g \sim -\frac{GM^2}{R},$$

where we miss a constant of order unity. We have $N=M/(\mu_e m_u)$ total electrons and the Fermi momentum is related to $N$ via

$$\frac{N}{4\pi R^3/3}=\frac{8\pi}{3h^3}p_\mathrm{F}^3.$$

Assuming only electrons contribute significantly to the internal energy $E_i$, we can make a rough estimate on $E_i$ by taking all electrons to have the same momentum $p_\mathrm{F}$ (this is formally an upper limit but the end result of this exercise is not affected):

$$E_i \sim E(p_\mathrm{f})N,$$

where $E(p_\mathrm{F})$ is equal to $p_\mathrm{F}^2/(2m_e)$ in the non-relativistic case and $p_\mathrm{F}c$ in the extremely relativistic case. Considering the total energy $E_\mathrm{tot}=E_g+E_i$, a stable configuration can be found by locating the minimum of $E_\mathrm{tot}$ with respect to $R$. Use this to determine the power law $\beta$ in the mass-radius relationship $R\propto M^\beta$. 

### 3: Limiting cases of the degenerate electron gas

Show that in the non-relativistic (NR) and extremely-relativistic (ER) limits the equations of state of a fully degenerate electron gas are given respectively by

$$P_{e,\mathrm{NR}} = \frac{1}{20}\left(\frac{3}{\pi}\right)^{2/3}\frac{h^2}{m_e m_u^{5/3}}\left(\frac{\rho}{\mu_e}\right)^{5/3},\quad 
P_{e,\mathrm{ER}} = \left(\frac{3}{\pi}\right)^{1/3}\frac{hc}{8 m_u^{4/3}}\left(\frac{\rho}{\mu_e}\right)^{4/3}.$$

For this purpose use the pressure integral

$$P_e = \frac{1}{3}\int_0^\infty v(p) p n_p(p)dp,$$

together with

$$n_e =\frac{\rho}{\mu_e m_u}.$$

You will need to use $v(p)=p/m_e$ and $v(p)=c$ for the non-relativistic and extremely relativistic limits respectively.

### 4: Neutron star versus white dwarf radii

Neutron stars are primarily composed by neutrons and supported by their degenerate pressure. Although the equation of state of nuclear matter has important effects that make it differ from a simple gas of degenerate neutrons, we can do some qualitative comparison between the radius of a neutron star and a white dwarf. Considering a fully degenerate non-relativistic equation of state for both, which differs only on the mass of the degenerate particle (with a ratio between neutron and electron mass of $m_n/m_e\sim 2000$), what is the ratio between the radii of both objects at a fixed mass? For this remember that for $P\propto \rho^{5/3}$ the solution to the equations of stellar structure can be determined from the Lane-Emden equation for an $n=1.5$ polytrope, with

$$R=r_n z_n,\quad r_n^2\equiv \frac{(n+1)P_c}{4\pi G \rho_c^2},\quad M = 4\pi r_n^3 \rho_c (-z_n^2 w_n'(z_n)).$$

Consider that the white dwarf is composed of ionized helium ($\mu_e\simeq 2$). For the neutron star case you can approximate it with the expression for degenerate electron pressure while replacing $m_e$ with $m_n$ and $\mu_e$ with $1$ (if you do not see why, try and work it out).

## Solutions

### 1: Degenerate electrons versus ions

The Fermi momentum is connected to the number density of a specific particle via

$$n=\int_0^{p_\mathrm{F}} n_p(p)dp=\frac{8\pi}{3h^3} p_\mathrm{F}^3\rightarrow p_\mathrm{F}=\left(\frac{3h^3 n}{8\pi}\right)^{1/3}.$$

For an ionized helium gas we can express the electron and ion densities as

$$n_e = \frac{\rho}{\mu_e m_\mathrm{u}},\quad n_\mathrm{ion} = \frac{\rho}{\mu_\mathrm{ion} m_\mathrm{u}}$$

where $\mu_e$ corresponds to the number of atomic mass units per electron in the gas and $\mu_\mathrm{ion}$ is the average mass of the ions in units of the atomic mass ($\mu_\mathrm{e}\simeq 2$ and $\mu_\mathrm{ion} \simeq 4$ for an ionized helium gas). We now can compute the critical densities at which we expect quantum effects to be important:

$$1=(2m_e k T)^{1/2}\left(\frac{3 h^3 \rho_\mathrm{crit,e}}{8\pi \mu_e m_\mathrm{u}}\right)^{-1/3}$$

$$\rho_\mathrm{crit, e}=\frac{8\pi \mu_e m_\mathrm{u}}{3h^3}(2m_e kT)^{3/2}.$$

The result for the ions is the same but with $\mu_\mathrm{ion}$ and $m_\mathrm{He}$,

$$\rho_\mathrm{crit, ions}=\frac{8\pi \mu_\mathrm{ion} m_\mathrm{u}}{3h^3}(2m_\mathrm{He} kT)^{3/2}.$$

Taking the ratio between the two densities we have that

$$\frac{\rho_\mathrm{crit, e}}{\rho_\mathrm{crit, ions}}=\frac{\mu_e}{\mu_\mathrm{ion}}\left(\frac{m_\mathrm{e}}{m_\mathrm{He}}\right)^{3/2}\simeq 8\times 10^{-7},$$

such that densities need to be much higher for degeneracy of ions to take place in addition to degeneracy of electrons.

### 2: Energetics of a degenerate star

The final exponent in the power law will only depend on the powers of radius and mass that go into the $E_g$ and $E_i$ terms, so we do not need to care too much about constants. Let us do each case separetely.

- Non-relativistic case: We have that

     $$\displaystyle E_i \propto p_\mathrm{F}^2 N\propto \frac{N^{5/3}}{R^2}\propto \frac{M^{5/3}}{R^2}$$

     The total energy is then

     $$\displaystyle E_\mathrm{tot} = c_1 \frac{M^2}{R}+c_2\frac{M^{5/3}}{R^2},$$

     where $c_1$ and $c_2$ are independent of $R$ and $M$. Minimizing with respect to $R$ we find

     $$\displaystyle R\propto M^{-1/3}.$$

     As expected, this is consistent with the formal result obtained using polytropes in the exercises of two classes ago. 

- Extremely-relativistic case: Following the same process as before but with $E=p_\mathrm{F}c$ we have

     $$\displaystyle E_i \propto p_\mathrm{F} N\propto \frac{N^{4/3}}{R}\propto \frac{M^{4/3}}{R}$$

     The total energy is then

     $$\displaystyle E_\mathrm{tot} = c_1 \frac{M^2}{R}+c_2\frac{M^{4/3}}{R},$$

     and then we already find a "problem". Both terms share the same dependency in $R$, meaning that a minimum cannot exist for arbitrary mass. This is essentially the Chandrasekhar mass.

### 3: Limiting cases of the degenerate electron gas

- Non-relativistic case: Here we have $v(p)\simeq p/m_e$ and the pressure integral is given by

    $$\displaystyle P_{e,\mathrm{NR}} = \frac{1}{3}\int_0^{p_\mathrm{F}}\left(\frac{p}{m_e}\right)\times p \times \left(\frac{8\pi p^2}{h^3}\right)dp,\quad p_\mathrm{F}=\left(\frac{3h^3 n_e}{8\pi}\right)^{1/3}.$$

    Performing the integral we find

    $$\displaystyle P_{e,\mathrm{NR}}=\frac{1}{3}\left(\frac{8\pi}{h^3 m_e}\right)\frac{p_F^5}{5},$$

    which after substituting $n_e=p/(\mu_e m_\mathrm{u})$ gives the expected result.

- Extremely-relativistic case: Procedure is the same but with $v(p)=c$:

    $$\displaystyle P_{e,\mathrm{NR}} = \frac{1}{3}\int_0^{p_\mathrm{F}}c\times p \times \left(\frac{8\pi p^2}{h^3}\right)dp.$$

    Performing the integral we find

    $$\displaystyle P_{e,\mathrm{NR}}=\frac{1}{3}\left(\frac{8\pi c}{h^3}\right)\frac{p_F^4}{4},$$

    which after substituting $n_e=p/(\mu_e m_\mathrm{u})$ gives the expected result.

### 4: Neutron star versus white dwarf radii

Using the relationship between pressure and density, $r_n$ can be expressed for the white dwarf case as

$$r_{n,WD}^2=Cm_e^{-1}\mu_e^{-5/3}\rho_c^{-1/3},$$

where $C$ contains factors that are common for the neutron star and white dwarf case. The central density can be replaced using the expression for the mass,

$$r_{n,WD}^2=Bm_e^{-1}\mu_e^{-5/3}\left(\frac{M}{r_{n,WD}^3}\right)^{-1/3}$$
$$r_{n,WD} =B m_e^{-1}\mu_e^{-5/3} M^{-1/3},$$

were $B$ is another constant with terms common to both cases. Similarly for the neutron star case we obtain

$$r_{n,NS} =B m_n^{-1} M^{-1/3}.$$

As the radius of the polytrope is $R=r_n z_n$, and $z_n$ is the same for both cases, we find that the ratio of radii at fixed mass is:

$$\frac{R_{NS}}{R_{WD}}=\frac{m_e}{m_n}\mu_e^{5/3}\sim 0.002.$$

Neutron stars are then expected to be far smaller than white dwarfs. For reference, white dwarfs are expected to have radii on the order of $\sim 5000\;\mathrm{[km]}$, meaning we would expect neutron stars of about $10$ kilometers. This is only about three times the Schwarzschild radius for one solar mass!