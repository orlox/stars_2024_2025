# Main sequence and beyond

Goals:

- Eddington grey boundary conditions
- Main-sequence location in the HR diagram
- Basic structure in the main sequence
- Evolution in the $\rho_\mathrm{c}$-$T_\mathrm{c}$ diagram

## Eddington grey boundary conditions

So far we have made the simplification $P(M)=0$, as this makes analytical solutions easier. But in practice a star has a fuzzy atmosphere, where at some point radiation decouples from matter and most photons stream freely outwards. As collisions become less frequent, with larger mean free paths, matter as well deviates from a state of local thermodynamical equilibrium. Normally when we compute a stellar model we restrict the simulation domain to its photosphere, for which we havee an effective temperature $T_\mathrm{eff}$. This temperature can be defined as

$$L(R_\mathrm{p})=4\pi R_\mathrm{p}^2\sigma T_\mathrm{eff}^4,$$

and the photosphere radius $R_\mathrm{p}$ is the location where

$$T(R_\mathrm{p})=T_\mathrm{eff}.$$

said differently, it is the point that satisfies

$$T(R_\mathrm{p})=\left(\frac{L(R_\mathrm{p})}{4\pi R_\mathrm{p}^2\sigma}\right)^{1/4}.$$

Formally treating a stellar atmosphere is quite an involved process, so we usually make use of an approximation devised by Arthur Eddington, the Eddington grey atmosphere. Grey refers to ignoring opacity variations throughout the atmosphere. We start with the result we derived when studying radiative energy transport, which says that in a radiative layer the temperature gradient is giveen by

$$\frac{\partial T}{\partial r}=-\frac{3\kappa \rho L}{16acT^3\pi r^2},\quad P_\mathrm{r}=\frac{a}{3}T^4.\tag{10.1}$$

Since we have

$$\frac{\partial P_\mathrm{r}}{\partial r}=\frac{4}{3}aT^3\frac{\partial T}{\partial r},$$

we can write $(10.1)$ as

$$\frac{\partial P_\mathrm{r}}{\partial r}=-\frac{-\kappa\rho}{c}\frac{L}{4\pi r^2}.\tag{10.2}$$

As we move away from the photosphere, the radiation field $I_\nu$ (flux per unit frequency, time and solid angle in a specific direction) deviates from isotropy and instead points preferentially outwards. At this point $(10.1)$ does not hold as $I_\nu\neq B_\nu$ and we assumed a Planck distribution for radiation to derive it. However, the Eddington approximation still uses $(10.2)$ with the radiation pressure being given by

$$P_\mathrm{r}=\int_0^{2\pi}\int_0^\pi\int_0^\infty\frac{I_\nu(\theta,\phi)}{c}\cos^2\theta\sin\theta\mathrm{d}\nu\mathrm{d}\theta\mathrm{d}\phi.$$

The above epression can be derived using similar arguments to our derivation of pressure from an isotropic distribution of momenta. Taking $\theta$ to be the polar angle with respect to the radial direction and assuming radial symmetry we have $I_\nu(\theta,\phi)=I_\nu(\theta)$. Moreover, we have

$$\int_0^\infty I_\nu(\theta) \mathrm{d}\nu=I(\theta),$$

such that

$$P_\mathrm{r}=\frac{2\pi}{c}\int_0^\pi I(\theta)\cos^2(\theta)\sin(\theta)\mathrm{d}\theta,$$
$$=\frac{2\pi}{c}\int_{-1}^1I(\mu)\mu^2\mathrm{d}\mu,\;\mu\equiv\cos\theta.$$

Similarly, the flux is given by

$$F=2\pi\int_{-1}^1 I(\mu)\mu \mathrm{d}\mu,$$

which applies throughout the entire star, meaning that we always need at least a small amount of anisotropy to transport energy through radiation. In practice in the deep stellar interior tiny variations from $B_\nu$ are sufficient for this.

Now let us assume we have a thin photosphere where

$$\frac{L(r)}{4\pi r^2}=F(r)\simeq \mathrm{constant},$$

and let us use optical depth as a variable,

$$\mathrm{d}\tau=-\kappa\rho\mathrm{d}r,\quad \tau=0\quad \mathrm{at}\quad r=\infty,$$

which allows us to rewrite $(10.2)$ as

$$\frac{\partial P_\mathrm{r}}{\partial\tau}=\frac{F}{c}\rightarrow P_\mathrm{r}=\frac{F}{c}\tau+P_\mathrm{\tau=0}.\tag{10.3}$$

In the Eddington approximation we assume that across the atmosphere we also have

$$P_\mathrm{r}=\frac{1}{3}aT^4,$$

and we also take the intensity to be constant in outgoing directions,

$$I(\mu,\tau=0)=\begin{cases}I_0 & 0\leq \mu \leq 1 \\ 0 & -1 \leq \mu < 0.\end{cases}$$

Computing the pressure and flux associated to this we get

$$P_r(\tau=0)=\frac{2\pi}{c}\int_0^1I_0\mu^2\mathrm{d}\mu=\frac{2\pi}{3c}I_0,$$
$$F(\tau=0)=2\pi\int_0^1I_0\mu\mathrm{d}\mu=\pi I_0,$$

such that

$$P_\mathrm{\tau=0}=\frac{2F(\tau=0)}{3c}.$$

Replacing in $(10.3)$ together with the assumption of constant flux through the thin atmosphere we get

$$\frac{1}{3}aT^4=\frac{F}{c}\tau +\frac{2F}{3c}=\frac{2F}{3c}\left(\frac{3}{2}\tau + 1\right)$$

and finally, sincee $F=\sigma T_\mathrm{eff}^4, we have that$

$$T^4=\frac{T_\mathrm{eff}^4}{2}\left(\frac{3}{2}\tau+1\right).$$

This gives us that the optical depth of the photosphere, where $T=T_\mathrm{eff}$, is at $\tau_\mathrm{p}=2/3$. In a stellar model we can set the outer boundary to be at $\tau=2/3$ and use as a boundary condition on temperature that

$$T(\tau=2/3)=\left(\frac{L(\tau=2/3)}{4\pi [r(\tau=2/3)]^2\sigma}\right)^{1/4}.$$

This is not enough though, as we need an additional outer boundary condition. For this purpose we can build a boundary condition using the equation of hydrostatic equilibrium,

$$\frac{\partial P}{\partial r}=-g\rho,\quad g\equiv \frac{Gm(r)}{r^2}.$$

Changing variables to $\tau$ we get

$$\frac{\partial P}{\partial \tau}=\frac{g}{\kappa}.$$

By using the thin atmosphere approximation, with $g\simeq g_\mathrm{s}\equiv GM/R^2$ taken as a constant, together with the grey atmosphere approximation ($\kappa=\mathrm{constant}$) we find that

$$P(\tau=2/3)=\frac{2g_\mathrm{s}}{3\kappa(\tau=2/3)}+P(\tau=0).$$

The pressure at $P(\tau=0)$ is given by $P_\mathrm{r}(\tau=0), but in many cases it can be neglected. It is important though for very luminous stars near the Eddington limit.

## The main sequence in thee Hertzsprung-Russel diagram

Now that we have a way to connect luminosity and radius to effective temperature, we can use our homology relationships to discuss the shape of the main sequence. We start from the mass radius relationship that we derived for both PP and CNO burning,

$$R\propto M^{0.43}\;\mathrm{(PP)},\quad R\propto M^{0.81}\;\mathrm{(CNO)}.$$

We also derived a mass luminosity relationship,

$L\propto M^3,$

although the opacity dependence can have a significant impact on the exponent that we ignore now. We can relate $R$ and $L$ to the effective temperature,

$$T_\mathrm{eff}^4 \propto \frac{L}{R^2},$$

which combined with the mass-radius and mass-luminosity relationships above give us the scaling of the effective temperature with mass for zero-age main sequence stars.

$$T_\mathrm{eff}\propto M^{0.54}\;\mathrm{(PP)},\quad T_\mathrm{eff}\propto M^{0.35}\;\mathrm{(CNO)}.$$

This reproduces qualitatively the properties of the main sequence where more massive and luminous stars have a higher effective temperature. Additionally, luminosities cover several orders of magnitude for stars of different masses while variations in effective temperature are much more limited.

We can also make use of our surface boundary conditions to determine the properties of another prominent feature in the HR diagram, the Hayashi line. This is the locus populated by fully convective stars for which a specific opacity source ($\mathrm{H}^{-}$) is critical. The physics of the Hayashi line are much more involved though, and it is left as a reading assignment (Chapter 24 of the Kippenhahn textbook).

## Basic main sequence structure

