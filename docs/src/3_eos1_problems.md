# Exercises

## List of exercises

### 1: Manipulation of thermodynamic quantities

Using the definitions of $\alpha$ and $\delta$,

$$\alpha \equiv \left(\frac{\partial \ln\rho}{\partial \ln P}\right)_T,\quad \delta \equiv -\left(\frac{\partial \ln\rho}{\partial \ln T}\right)_P,$$

and expressing a change in specific volume $v$ in terms of $P$ and $T$ as independent variables,

$$dv=\left(\frac{\partial v}{\partial T}\right)_P dT + \left(\frac{\partial v}{\partial P}\right)_T dP$$

show that:

$$\left(\frac{\partial P}{\partial T}\right)_v = \frac{-\left(\frac{\partial v}{\partial T}\right)_P}{\left(\frac{\partial v}{\partial P}\right)_T}=\frac{P\delta}{T\alpha}\qquad \mathrm{and} \qquad T\left(\frac{\partial v}{\partial T}\right)_P = \frac{\delta}{\rho}.$$

### 2: Energy equation using $\rho$ and $T$ as independent variables

We have shown that using $T$ and $P$ as independent variables the energy equation can be expressed as:

$$\frac{dq}{dt}=c_P\frac{d T}{d t} - \frac{\delta}{\rho}\frac{d P}{d t}.$$

However, one could alternatively use $T$ and $\rho$ as independent variables (which is done, for example, by the $\texttt{MESA}$ code). Show that the energy equation using these two independent variables can be expressed as:

$$\frac{dq}{dt}=c_P\left[(1-\chi_T\nabla_\mathrm{ad})\frac{dT}{dt}-\frac{T}{\rho}\chi_\rho \nabla_\mathrm{ad}\frac{d\rho}{d t}\right],$$

where

$$\nabla_\mathrm{ad}\equiv\left(\frac{\partial \ln T}{\partial \ln P}\right)_s=\frac{P\delta}{T\rho c_P},\quad \chi_T\equiv \left(\frac{\partial \ln P}{\partial \ln T}\right)_\rho, \quad \chi_\rho\equiv \left(\frac{\partial \ln P}{\partial \ln \rho}\right)_T.$$

### 3: Ideal gas EOS from Maxwell-Boltzmann distribution

The number density per unit momentum $n_p$ of classical non-relativistic particles of mass $m$ in thermodynamic equilibrium is given by the Maxwell-Boltzmann distribution:

$$n_p(p)=\frac{n}{(2\pi m k T)^{3/2}}\exp\left(\frac{-p^2}{2mkT}\right) 4\pi p^2,$$

where $n$ is the number density of particles. Show that this satisfies that:

$$n=\int_0^\infty n_p dp,$$

and that the specific energy density and the pressure are:

$$u=\frac{1}{\rho}\int_0^\infty \epsilon_p n_p dp=\frac{3}{2}\frac{kT}{m}, \qquad P = \frac{1}{3}\int_0^\infty v_p p n_p dp=\frac{\rho}{m}kT.$$

To do this, consider that for a non-relativistic particle its energy is $\epsilon_p=p^2/2m$ and its velocity is $v_p=p/m$. Use the standard integral

$$\int_0^\infty e^{-ax^2}dx=\frac{1}{2}\sqrt{\frac{\pi}{a}},$$

which by derivation of both sides by $a$ (moving the derivation under the integral in the left hand side) gives the required integrals.

### 4: Constant entropy star

The structure of a hypothetical star with constant entropy would be given by

$$\frac{\partial \ln T}{\partial \ln P}=\nabla_\mathrm{ad}=\frac{P\delta}{T\rho c_P}.$$

Show that for an ideal gas without radiation pressure $\nabla_\mathrm{ad}=2/5$, and that this implies that the structure of the star can be described using an $n=3/2$ polytrope. Remember that the specific heat at constant pressure can be computed from

$$c_P = \left(\frac{\partial u}{\partial T}\right)_P +P \left(\frac{dv}{dT}\right)_P.$$

## Solutions

### 1: Manipulation of thermodynamic quantities

From the expression for $dv$ we have that

$$\frac{dv}{dT}=\left(\frac{\partial v}{\partial T}\right)_P +\left(\frac{\partial v}{\partial P}\right)_T \frac{dP}{dT}.$$

Considering a change in temperature at constant volume we obtain

$$0=\left(\frac{\partial v}{\partial T}\right)_P+\left(\frac{\partial v}{\partial P}\right)_T \left(\frac{dP}{dT}\right)_v,$$

from which it follows that

$$\left(\frac{\partial P}{\partial T}\right)_v = \frac{-\left(\frac{\partial v}{\partial T}\right)_P}{\left(\frac{\partial v}{\partial P}\right)_T}.$$

The partial derivatives of specific volume can be turned into derivatives of density,

$$\left(\frac{\partial v}{\partial T}\right)_P = \left(\frac{\partial (1/\rho)}{\partial T}\right)_P=-\frac{1}{\rho^2}\left(\frac{\partial \rho}{\partial T}\right)_P= -\frac{1}{\rho^2}\frac{\rho}{T}\left(\frac{\partial \ln\rho}{\partial \ln T}\right)_P=\frac{\delta}{\rho T},$$

and multiplying this by the density gives us the second required result. Similarly we find that

$$\left(\frac{\partial v}{\partial P}\right)_T=-\frac{\alpha}{\rho P},$$

from which we obtain the first result:

$$\left(\frac{\partial P}{\partial T}\right)_v=\frac{P\delta}{T\alpha}.$$

### 2: Energy equation using $\rho$ and $T$ as independent variables

We start by noting that

$$\frac{d P}{d t} = \left(\frac{\partial P}{\partial T}\right)_\rho \frac{d T}{dt} + \left(\frac{\partial P}{\partial \rho}\right)_T \frac{d \rho}{dt}$$

Turning the derivatives into derivatives over the logarithms, and replacing with $\chi_T$ and $\chi_\rho$, gives us

$$\frac{d P}{d t} = \frac{P\chi_T}{T}\frac{d T}{dt} + \frac{P\chi_\rho}{\rho}\frac{d \rho}{dt}.$$

We then replace this in the energy equation with $T$ and $P$ as independent variables:

$$\frac{dq}{dt}=\left[c_P -\frac{P\delta\chi_T}{\rho T}\right] \frac{d T}{dt} - \frac{P\delta\chi_\rho}{\rho^2}\frac{d \rho}{dt}.$$

Replacing $P\delta = \nabla_\mathrm{ad}T\rho c_P$ we find the final result,

$$\frac{dq}{dt}=c_P\left[(1-\chi_T\nabla_\mathrm{ad})\frac{dT}{dt}-\frac{T}{\rho}\chi_\rho \nabla_\mathrm{ad}\frac{d\rho}{d t}\right].$$

### 3: Ideal gas EOS from Maxwell-Boltzmann distribution

Deriving the standard integral by $a$ results in

$$\frac{d}{da}\int_0^\infty e^{-ax^2} dx = -\int_0^\infty e^{-ax^2} x^2 dx$$

equating this to the derivation by $a$ on the known result of the standard integral gives us

$$\int_0^\infty e^{-ax^2} x^2 dx = \frac{1}{4}\sqrt{\frac{\pi}{a^3}}.$$

This can be used directly to perform the integral for $n$. Deriving the last integral once more by $a$ gives us the necessary result to compute the integrals for the specific energy and the pressure:

$$\int_0^\infty e^{-ax^2} x^4 dx = \frac{3}{8}\sqrt{\frac{\pi}{a^5}}.$$

### 4: Constant entropy star

We start by computing the specific heat at constant pressure:

$$c_P = \left(\frac{d u}{dT}\right)_P +P \left(\frac{d v}{dT}\right)_P.$$

Using the energy density and the pressure for the ideal gas without radiation given in the previous exercise we find that

$$\left(\frac{\partial u}{\partial T}\right)_P =\frac{3}{2}\frac{k}{m},\quad P \left(\frac{d v}{dT}\right)_P = -\frac{P}{\rho^2}\left(\frac{d \rho}{dT}\right)_P=\frac{k}{m},$$

which gives us the specific heat at constant pressure,

$$c_P = \frac{5}{2}\frac{k}{m}.$$

Similarly we find that

$$\delta = -\frac{T}{\rho} \left(\frac{\partial \rho}{\partial T}\right)_P=1.$$

Combining the two previous results we obtain $\nabla_\mathrm{ad}=2/5$. Now consider the temperature follows a power law on pressure $T\propto P^\beta$. If we have a stellar model with an adiabatic structure then it follows that $\beta=2/5$. Since the ideal gas law without radiation says that $P\propto \rho T$, we find that $P\propto \rho^{5/3}$. This power law corresponds exactly to a polytrope of index $n=3/2$.