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


## Rewriting the energy equation

We aim to write the energy equation (2.8) in terms of the pressure and temperature. For this we have that

$$\mathrm{d}q=\mathrm{d}u+P\mathrm{d}v=A\mathrm{d}T+B\mathrm{d}P.$$

Our objective is to find $A$ and $B$. For this we will need two seemingly (at first) unrelated results.

1. Consider the relationship between $u$, $v$ and $T$,

   $$\mathrm{d}u = \left(\frac{\partial u}{\partial v}\right)_T \mathrm{d}v + \left(\frac{\partial u}{\partial T}\right)_v\mathrm{d}T.\tag{2.10}$$

   We also have that

   $$\mathrm{d}s=\frac{\mathrm{d}q}{T}=\frac{1}{T}\left(\mathrm{d}u + P\mathrm{d}v\right),$$

   were after applying Equation $(2.10)$ gives us

   $$\mathrm{d}s=\frac{1}{T}\left[\left(\frac{\partial u}{\partial v}\right)_T + P\right]\mathrm{d}v + \frac{1}{T}\left(\frac{\partial u}{\partial T}\right)_v.$$

   As $\mathrm{d}s$ is a total differential (in contrast to $\mathrm{d}q$ which is an [imperfect differential](https://en.wikipedia.org/wiki/Inexact_differential)) we have that

   $$\frac{\partial^2 s}{\partial T\partial v}=\frac{\partial^2 s}{\partial v\partial T}$$
   $$\rightarrow \frac{\partial}{\partial T}\left[\frac{1}{T}\left(\frac{\partial u}{\partial v}\right)_T+\frac{P}{T}\right]=\frac{1}{T}\frac{\partial^2 u}{\partial v\partial T}$$

   which after performing the derivative on the left hand side gives us the following relationship:

   $$\boxed{\left(\frac{\partial u}{\partial v}\right)_T=T\left(\frac{\partial P}{\partial T}\right)_v-P}\tag{2.11}$$

2. We will now derive a relationship between the specific heats. We start from $(2.10)$,

   $$\frac{\mathrm{d}u}{\mathrm{d}T}=\left(\frac{\partial u}{\partial v}\right)_T\frac{\mathrm{d} v}{\mathrm{d} T}+\left(\frac{\partial u}{\partial T}\right)_v$$
   $$\left(\frac{\partial u}{\partial T}\right)_P=\left(\frac{\partial u}{\partial v}\right)_T\left(\frac{\partial v}{\partial T}\right)_P+\left(\frac{\partial u}{\partial T}\right)_v.$$

   We use $(2.11)$ on the right hand side,

   $$\left(\frac{\partial u}{\partial T}\right)_P=\left[T\left(\frac{\partial P}{\partial T}\right)_v-P\right]\left(\frac{\partial v}{\partial T}\right)_P + \left(\frac{\partial u}{\partial T}\right)_v,$$

   and after rearranging terms we get

   $$\left(\frac{\partial u}{\partial T}\right)_P + P\left(\frac{\partial u}{\partial T}\right)_P-\left(\frac{\partial u}{\partial T}\right)_v = T\left(\frac{\partial P}{\partial T}\right)_v\left(\frac{\partial v}{\partial T}\right)_P$$
   $$c_P-c_v = T\left(\frac{\partial P}{\partial T}\right)_v\left(\frac{\partial v}{\partial T}\right)_P.\tag{2.12}$$

   We leave it as part of the exercises to show that

   $$\left(\frac{\partial P}{\partial T}\right)_v=-\frac{\left(\frac{\partial P}{\partial T}\right)_P}{\left(\frac{\partial v}{\partial P}\right)_T}=\frac{P\delta}{T\alpha}, \tag{2.13}$$

   and that

   $$T\left(\frac{\partial v}{\partial T}\right)_P=\frac{\delta}{\rho}.$$

   Using these two expressions in Equation $(2.14)$ results in

   $$\boxed{c_P-c_v = \frac{P\delta^2}{T\rho\alpha}}.\tag{2.14}$$

We now have what we need to rewrite our energy equation. Let's start from

$$\mathrm{d}q = \mathrm{d}u + P \mathrm{d}v.$$

Applying $(2.10)$ we get

$$\mathrm{d}q = \left(\frac{\partial u}{\partial T}\right)_v\mathrm{d}T + \left(\frac{\partial u}{\partial v}\right)_T\mathrm{d}v+P\mathrm{d}v$$
$$=\left(\frac{\partial u}{\partial T}\right)_v+\left[\left(\frac{\partial u}{\partial v}\right)_T+P\right]\mathrm{d}v.$$

We use $(2.11)$ on the left hand side,

$$\mathrm{d}q=\left(\frac{\partial u}{\partial T}\right)_v\mathrm{d}T+T\left(\frac{\partial P}{\partial T}\right)_v\mathrm{d}v.$$

We note that $c_v=(\partial u/\partial T)_v$ and $\mathrm{d}v=-\mathrm{d}\rho/\rho^2$, and use Equation $(2.13)$ on the right hand side,

$$\mathrm{d}q = c_v\mathrm{d}T-\frac{P\delta}{\rho\alpha}\frac{\mathrm{d}\rho}{\rho}$$
$$=c_v\mathrm{d}T-\frac{P\delta}{\rho\alpha}\left(\alpha\frac{\mathrm{d}P}{P}-\delta\frac{\mathrm{d}T}{T}\right)$$
$$=\left(c_v+\frac{P\delta^2}{\rho T \alpha}\right)\mathrm{d}T-\frac{\delta}{\rho}\mathrm{d}.P$$

Using Equation $(2.14)$ we finally get what we were looking for:
$$\mathrm{d}q = c_P\mathrm{d}T-\frac{\delta}{\rho}\mathrm{d}P.$$
Using this expression we obtain the energy equation in terms of $\partial P/\partial t$ and $\partial T/\partial t$,

$$\boxed{c_P\frac{\partial T}{\partial t}+\frac{\delta}{\rho}\frac{\partial P}{\partial t}=\varepsilon_\mathrm{nuc}-\frac{\partial L}{\partial m}.}$$

A very useful property of the gas is the adiabatic temperature gradient,

$$\nabla_\mathrm{ad}=\left(\frac{\partial \ln T}{\partial \ln P}\right)_\mathrm{ad},$$

where "ad" indicates a change at constant entropy ($\mathrm{d}s=0$). Using Equation $(2.15)$ together with $T\mathrm{d}s=\mathrm{d}q$, we get

$$\left.\left(\frac{\partial T}{\partial P}\right)_\mathrm{ad}=-\frac{\delta}{c_P\rho}\quad\right/\frac{P}{T}\cdot$$
$$\boxed{\nabla_\mathrm{ad}=\frac{P\delta}{T\rho c_P}.}$$

We will find later on that in some cases we can approximate a star as a ball of constant entropy, which implies

$$\nabla\equiv\frac{\partial \ln T}{\partial \ln P}=\nabla_\mathrm{ad},$$

where $\nabla$ represents the actual temperature gradient with respect to pressure through the star.

## Deriving a pressure from a distribution

So, once we manage to write down our EOS as $\rho=\rho(P,T)$, and we also determine its internal energy $u=u(P,T)$, we can determine $c_P$, $\alpha$ and $\delta$. This gives us what we need for the energy equation.

But how can we derive $\rho(P,T)$ and $u(P,T)$? Next class we'll work on that, considering that a gas has multiple particles with a distribution of their velocities (and momenta). We can express the number of particles in a volume $\mathrm{d}V$ that have a momentum between $p$ and $p+\mathrm{d}p$ as

$$N(p,p+\mathrm{d}p)=n_p\mathrm{d}p\mathrm{d}V=nf(p)\mathrm{d}p\mathrm{d}V,$$

where $n$ is the number of particles per unit volume and $f(p)$ is a probability density for a particle to have a given momentum.If we can find $f(p)$ then we can determine macroscopic properties such as pressure and internal energy density. For example, next week we'll show that

$$P=\frac{1}{3}\int_0^\infty v_p p n_p\mathrm{d}p,$$

where $v_p$ is the velocity of a particle with momentum $p$.