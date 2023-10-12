# The energy equation and the equation of state (EOS)

Goals:

- Relate the energy equation to global energetics
- Define different EOS properties
- Rewrite the energy equation in terms of $P$ and $T$ instead of $s$
- Describe how macroscopic properties can be obtained from the distribution of momenta of individual particles

## Energy equation and global energetics

Let's consider the energy equation in its Lagragian form:

$$T\frac{\partial s}{\partial t}=\frac{\partial q}{\partial t}=\varepsilon_\mathrm{nuc}-\frac{\partial L}{\partial m}.\tag{2.1}$$

We can rewrite this using the first law of thermodynamics, which states that

$$\mathrm{d}U = \mathrm{d}Q - P\mathrm{d}V.$$

This form of the first law describes a body of volume $V$ with a surface pressure $P$ and total energy $U$, to which an amount of heat $\mathrm{d}Q$ is deposited. We want to work with local properties of our gas, for which we make use of specific (meaning, per unit mass) quantities,

$$\mathrm{d}u=\mathrm{d}q -P \mathrm{d}v, \quad v\equiv \frac{1}{\rho},$$

where $v$ is the volume per unit mass. More commonly $v$ is reserved for the velocity, but in this chapter we reserve it exclusively for the specific volume. The energy equation (2.1) can then be rewritten as

$$\frac{\partial u}{\partial t}+P\frac{\partial v}{\partial t}=\varepsilon_\mathrm{nuc}-\frac{\partial L}{\partial m}.$$

To describe global properties of the star we can integrate this equation over the total mass of the star,

$$\int_0^M\left[\frac{\partial u}{\partial t}+P\frac{\partial v}{\partial t}\right]\mathrm{d}m=\int_0^M\left[\varepsilon_\mathrm{nuc}-\frac{\partial L}{\partial m}\right]\mathrm{d}m.\tag{2.2}$$

Integrating $\varepsilon_\mathrm{nuc}$ gives us the total nuclear energy generation rate in the star, to which we refer as $L_\mathrm{nuc}$. We also have that

$$\int_0^M\frac{\partial u}{\partial t}\mathrm{d}m=\frac{\partial}{\partial t}\int_0^M u\mathrm{d}m = \dot{E}_i,$$

where we recall that $E_i$ is the total internal energy of the gas. Using this Equation (2.2) becomes

$$\dot{E}_i+\int_0^M P\frac{\partial v}{\partial t}\mathrm{d}m=L_\mathrm{nuc}-L_\mathrm{surf}+L(0),$$

where $L_\mathrm{surf}=L(m=M)$ is the luminosity at the stellar surface. Using the central boundary condition on the luminosity we get that

$$\dot{E}_i-\int_0^M P\frac{\partial v}{\partial t}\mathrm{d}m = L_\mathrm{nuc}-L_\mathrm{surf}.$$

The right hand side of this equation is equal to the energy injected onto the star minus the energy radiated away from its surface. We then expect the left hand side of the equation to correspond to the rate of change of the total energy $E=E_i+E_g$. For this to be true, then we require that

$$\dot{E}_g = \int_0^MP\frac{\partial v}{\partial t}\mathrm{d}m. \tag{2.4}$$

We take Equation $(2.4)$ as a consequence of the energy equation, but instead, let's verify that it is correct in terms of the definition of $E_g$ and the equation of hydrostatic equilibrium. First, it is straightforward to relate $\dot{v}$ to $\dot{\rho}$:

$$\frac{\partial v}{\partial t}=\frac{\partial}{\partial t}\left(\frac{1}{\rho}\right)=-\frac{\dot{\rho}}{\rho^2}$$
$$\rightarrow \int_0^M P\frac{\partial v}{\partial t}\mathrm{d}m = -\int_0^M \frac{P\dot{\rho}}{\rho^2}\mathrm{d}m.\tag{2.5}$$

We can also obtain $\dot{E}_g$ from the virial theorem:

$$E_g=-3\int_0^M\frac{P}{\rho}\mathrm{d}m$$
$$\rightarrow\dot{E}_g=-3\int_0^M\frac{\dot{P}}{\rho}\mathrm{d}m + 3\int_0^M\frac{P\dot{\rho}}{\rho^2}\mathrm{d}m \tag{2.6}$$

The first integral on the right hand side can be obtained from the equation of hydrostatic equilibrium,

$$\left.\frac{\partial P}{\partial m}=-\frac{Gm}{4\pi r^4}\quad\right/\frac{\partial}{\partial t}\cdot$$
$$\left.\frac{\partial \dot{P}}{\partial m}=4\frac{Gm}{4\pi r^4}\frac{\dot{r}}{r}\quad\right/4\pi r^3\cdot$$
$$\left.4\pi r^3 \frac{\partial \dot{P}}{\partial m}=4\frac{Gm}{r}\frac{\dot{r}}{r}\quad\right/\int_0^M(\;)\mathrm{d}m$$
$$\int_0^M 4\pi r^3 \frac{\partial \dot{P}}{\partial m}\mathrm{d}m=4\int_0^M\frac{Gm}{r}\frac{\dot{r}}{r}\mathrm{d}m.\tag{2.7}$$

From the definition of $E_g$ we have

$$E_g=-\int_0^M\frac{Gm}{r}\mathrm{d}m$$
$$\rightarrow \dot{E}_g=\int_0^M \frac{Gm}{r}\frac{\dot{r}}{r}\mathrm{d}m.$$

Replacing this in Equation $(2.7)$ and integrating the left hand side by parts gives

$$\left.\left(4\pi r^3 \dot{P}\right)\right|_0^M-3\int_0^M 4\pi r^2 \frac{\partial r}{\partial m}\dot{P}\mathrm{d}m=4\dot{E}_g,$$

where the first term is zero due to the boundary conditions, and using the equation of continuity to replace $\partial r/\partial m$ results in

$$-3\int_0^M\frac{\dot{P}}{\rho}\mathrm{d}m=4\dot{E}_g.$$

Replacing this in Equation $(2.6)$ one obtains

$$\dot{E}_g=-\int_0^M \frac{P\dot{\rho}}{r^2}\mathrm{d}m,$$

which combined with Equation $(2.5)$ shows that indeed Equation $(2.4)$ is correct. This means that Equation $(2.3)$ is equivalent to

$$L_\mathrm{nuc}-L_\mathrm{surf}=\dot{E}_i+\dot{E}_g = \dot{E},$$

which is what we expect in terms of the evolution of the total energy and its sinks and sources.

## EOS definitions

We want to express the energy equation $(2.1)$ in terms of something other than entropy. By virtue of the first law of thermodynamics, we already showed that

$$\frac{\partial u}{\partial t}+P\frac{\partial v}{\partial t}=\varepsilon_\mathrm{nuc}-\frac{\partial L}{\partial m}.\tag{2.8}$$

In general, the local state of the fluid is determined by a pair of properties, such as pressure and temperature (and also composition, but for now we ignore changes in it). The version of the energy equation above uses internal energy and density (in terms of the specific volume), but we could use any other pair of independent thermodynamic properties of the fluid. To write this in a form commonly used in stellar evolution theory, we will switch it to use pressure and temperature.

Before we do so, we will first define some terms associated to an equation of state. If we consider an EOS of the form

$$\rho=\rho(P,T),$$

then changes in density are related to changes in pressure and temperature as

$$\mathrm{d}\rho = \left(\frac{\partial \rho}{\partial P}\right)_T\mathrm{d}P + \left(\frac{\partial\rho}{\partial t}\right)_P\mathrm{d}T. \tag{2.9}$$

The partial derivatives are commonly expressed in terms of logarithmic derivatives,

$$\left(\frac{\partial \rho}{\partial P}\right)_T=\frac{\mathrm{d}\rho}{\mathrm{d}\ln \rho}\left(\frac{\partial \ln \rho}{\partial \ln P}\right)_T\frac{\mathrm{d}\ln P}{\mathrm{d}P}=\frac{\rho}{P}\left(\frac{\partial \ln \rho}{\partial \ln P}\right)_T.$$

If we define

$$\alpha\equiv \left(\frac{\partial \ln \rho}{\partial \ln P}\right)_T, \quad \delta=-\left(\frac{\partial\ln\rho}{\partial\ln T}\right)_P,$$

then Equation (2.9) turns into

$$\frac{\mathrm{d}\rho}{\rho}=\alpha\frac{\mathrm{d}P}{P}-\delta \frac{\mathrm{d}T}{T}.$$

If we know the the form $\rho=\rho(P,T)$ of the EOS, $\alpha$ and $\delta$ can be derived from it. Two other quantities that will be useful are the heat capacities. The heat capacity at constant pressure is:

$$c_P\equiv \left(\frac{\partial q}{\partial T}\right)_P=\left(\frac{\partial u}{\partial T}\right)_P+P\left(\frac{\partial v}{\partial T}\right)_P,$$

and similarly, we have the specific heat at constant volume,

$$c_v\equiv \left(\frac{\partial q}{\partial T}\right)_v=\left(\frac{\partial u}{\partial T}\right).$$