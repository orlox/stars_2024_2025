# Exercises

## List of exercises

### 1: Timescales of stellar evolution

There are three main timescales in which stars evolve. These are the dynamical,
thermal and nuclear timescales. Even without knowing the equations of stellar
structure and evolution we can do some estimates on the value of these
quantities. Compute these without a calculator! We only care about the order of
magnitude of these timescales, which given all the approximations done is all we
can do. For solar properties, use the following for the mass, radius and
luminosity:

$$R_\odot\sim 7\times 10^{10}\;\mathrm{[cm]},\quad M_\odot \sim 2\times 10^{33}\;\mathrm{[g]},\quad L_\odot \sim 4\times 10^{33}\;\mathrm{[erg\;s^{-1}]}$$

- Thermal timescale: One of the main early hypothesis to explain the energy
    source of the Sun was that it originated from its slow contraction into its own
    gravitational potential. In such a case, a rough estimate of the energy the Sun
    would have radiated through its life is given by the negative of the
    gravitational potential energy $E_\mathrm{g}$:

    $$E_\mathrm{g} \sim \displaystyle -\frac{GM_\odot^2}{R_\odot}.$$

    Assuming that the luminosity of the Sun has always been its current one,
    $L_\odot$, compute the age of the Sun under the assumption that it is only
    powered by contraction. You can use $G\sim 6\times 10^{-8} \,\mathrm{cm^3\,g^{-1}\,s^{-2}}$

- Dynamical timescale: For most of their lives stars are very close to
hydrostatic equilibrium, carefully balancing their gravities against the support
of a pressure gradient. Whenever these two forces are misbalanced, the star will
evolve in what is known as the dynamical timescale. Estimate this timescale by
computing the time it would take for the surface of the sun to free-fall all the
way to its center if all forces opposing gravity would be removed. For
simplicity assume that the gravitational acceleration is constant and equal to
its present one.

- Nuclear timescale: As we now know, most stars are powered by nuclear
reactions. Masses of isotopes are normally given in terms of the atomic mass
unit $m_\mathrm{u}=1.661\times 10^{-24}\;\mathrm{g}$, defined as $1/12$ of the
mass of a carbon-12 atom. The mass of a hydrogen atom is
$m_\mathrm{H}=1.007825m_\mathrm{u}$ and that of a helium atom is
$m_\mathrm{He}=4.002602 m_\mathrm{u}$, such that if four hydrogen atoms are
fused into a helium atom there is a mass deficit leading to a release of energy
$(4m_\mathrm{H}-m_\mathrm{He})c^2\sim 4\times 10^{-5}\;\mathrm{[erg]}$. With
this information, estimate the lifetime of the Sun as a core-hydrogen burning
star. For simplicity, assume the Sun has a constant luminosity and is entirely
composed of hydrogen, 10% of which is burned into Helium during core-hydrogen
burning.

## Solutions

### 1: Timescales of stellar evolution

- Thermal timescale:
    Assuming the Sun started its life as a diffuse expanded cloud, covering a distance much larger than its current radius, we can take its initial gravitational energy to be much smaller than the current one ($E_{g,\mathrm{i}}\ll E_g$). In that case the sun has radiated a total energy $\sim E_g$ and we can compute the time it has taken to do so dividing by its luminosity. The resulting timescale is known as the Kelvin-Helmholtz timescale,

    $$\displaystyle\tau_\mathrm{KH} = \frac{GM_\odot^2}{R_\odot L_\odot}\sim \frac{6\times 10^{-8} \cdot(2\times 10^{33})^2}{7\times 10^{10}\cdot 4\times 10^{33}} \;\mathrm{[s]}$$

    We care about orders of magnitude, so we can eliminate nearly equal factors,

    $$\displaystyle\tau_\mathrm{KH} \sim \frac{\cancel{6}\times 10^{-8} \cdot \cancel{4}\times 10^{66}}{\cancel{7}\times 10^{10}\cdot \cancel{4}\times 10^{33}} \;\mathrm{[s]} = 10^{15}\;\mathrm{[s]}$$

    That is a lot of seconds. It is easier to read in terms of years. Approximately, $1\,\mathrm{yr}=3\times 10^7\,\mathrm{s}$, so

    $$\displaystyle\tau_\mathrm{KH} \sim \frac{10^{15}}{3\times 10^{7}}\;\mathrm{[yr]} = \frac{1}{3}10^8\;\mathrm{[yr]}\sim 3\times 10^{7}\;\mathrm{yr},$$

    where I used that $1/3\sim 3\times 10^{-1}$. The thermal timescale is then of the order of tens of millions of years, much shorter than the age of the Sun. Before it was understood that the Sun was powered by hydrogen fusion it was the accepted model that gravitational contraction was its energy source, but as the age of the Earth became constrained through radiometric dating, it was seen that that could not possibly be the case. One small caveat that we will see later on is that part of the gravitational energy is not radiated, but rather heats up the star. However, this only lowers the timescale by a factor of $\sim 2$.

- Dynamical timescale: The surface gravity of the Sun is $g=GM_\odot/R_\odot^2$.
    An object falling during a time $t$ with a constant acceleration, and starting
    at rest, travels a distance

    $$\displaystyle d=\frac{1}{2}gt^2.$$

    We get the dynamical timescale by equating this to the solar radii, and naming the time $t$ as $\tau_\mathrm{dyn}$

    $$\displaystyle \tau_\mathrm{dyn}=\sqrt{\frac{2R_\odot}{g}}=\sqrt{\frac{2R_\odot^3}{GM_\odot}}.\tag{1}$$

    The ratio $M_\odot/R_\odot^3$ is (except for a constant factor), equal to the average density of the Sun $\langle \rho \rangle_\odot$, so often the dynamical timescale of a star is expressed as

    $$\displaystyle \tau_\mathrm{dyn}\sim\sqrt{\frac{1}{G\langle \rho \rangle_\odot}}$$

    Going back to Equation (1), let's evaluate it:

    $$\displaystyle \tau_\mathrm{dyn}\sim \sqrt{\frac{2\cdot 7^3\times 10^{30}}{6\times 10^{-8}\cdot 2\times 10^{33}}}\;\mathrm{[s]}.$$

    Again, we are doing an order of magnitude calculation, so we play a bit freely with elimination of terms,

    $$\displaystyle \tau_\mathrm{dyn}\sim\sqrt{\frac{\cancel{2}\cdot 7^{\cancel{3}2}\times 10^{30}}{\cancel{6}\times 10^{-8}\cdot \cancel{2}\times 10^{33}}}\;\mathrm{[s]}\sim \sqrt{7^2\times 10^5}\;\mathrm{[s]}.$$

    One can approximate $10^{0.5}\sim 3$ to obtain

    $$\displaystyle \tau_\mathrm{dyn}\sim 7\times 3\times 10^2.\;\mathrm{[s]}\sim 2\times 10^3\;\mathrm{[s]}$$

    Which is about half an hour. We see that the timescale for dynamical adjustments is dramatically lower than the timescale for thermal adjustments!

- Nuclear timescale: The number of hydrogen atoms that will be burned is given by

    $$\displaystyle N=0.1\frac{M_\odot}{m_\mathrm{H}}$$

    and the energy released per hydrogen atom that is burned is $10^{-5}\,\mathrm{erg}$. The Nuclear timescale can then be estimated as:

    $$\displaystyle \tau_\mathrm{nuc}=\frac{N\times 10^{-5}\,\mathrm{erg}}{L_\odot}.$$

    Let's evaluate this, using $m_\mathrm{H}\sim 2\times 10^{-24}$ for simplicity,

    $$\displaystyle \tau_\mathrm{nuc}\sim\frac{10^{-1}\cdot 2\times 10^{33}\cdot 10^{-5}}{2\times 10^{-24}\cdot 4 \times 10^{33}}\sim \frac{1}{2}\times 10^{18}\;\mathrm{[s]}.$$

    Again, that's a lot of seconds. Let's write it in years:

    $$\displaystyle \tau_\mathrm{nuc}\sim \frac{(1/2)\times 10^{18}}{3\times 10^{7}}\,\mathrm{[yr]}=\frac{1}{6}\times 10^{11}\;\mathrm{[yr]}\sim 20 \;\mathrm{Gyr}.$$

    Where I have expressed the final result in units of Gigayears (equal to $10^9$ years). Again, we see that this is very different from the other two timescales. These three timescales are the fundamental evolutionary timescales of stars, and as they differ significantly, it means that the rate of change of properties of a star can be very different depending on the nature of its evolution.