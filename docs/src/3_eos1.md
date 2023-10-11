# The energy equation and the equation of state (EOS)

Goals:

- Relate the energy equation to global energetics
- Define different EOS properties
- Rewrite the energy equation in terms of $P$ and $T$ instead of $s$
- Describe how macroscopic properties can be obtained from the distribution of momenta of individual particles

## Energy equation and global energetics

Let's consider the energy equation in its Lagragian form:

$$T\frac{\partial s}{\partial t}=\frac{\partial q}{\partial t}-\varepsilon_\mathrm{nuc}-\frac{\partial L}{\partial m}.\tag{2.1}$$

We can rewrite this using the first law of thermodynamics, which states that

$$\mathrm{d}U = \mathrm{d}Q - P\mathrm{d}V.$$

This form of the first law describes a body of volume $V$ with a surface pressure $P$ and total energy $U$, to which an amount of heat $\mathrm{d}Q$ is deposited. We want to work with local properties of our gas, for which we make use of specific (meaning, per unit mass) quantities,

$$\mathrm{d}u=\mathrm{d}q -P \mathrm{d}v, \quad v\equiv \frac{1}{\rho},$$

where $v$ is the volume per unit mass. The energy equation (2.1) can then be rewritten as

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

$$\dot{E}_g = \int_0^MP\frac{\partial v}{\partial t}\mathrm{d}m$$