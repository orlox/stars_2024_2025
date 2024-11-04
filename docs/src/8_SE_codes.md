# Stellar evolution models
This introduction to the first MESA lab will cover what a stellar model is, how to build one and how modern stellar evolution codes create and evolve those in time. 

## Differential equations of stellar evolution
Let's collect and summarize the system of differential equations derived in the previous lectures for a spherically symmetric star, in Lagrangian form.

1. **CONTINUITY EQUATION**
   
   $\dfrac{\partial r}{\partial m}=\dfrac{1}{4\pi r^2 \rho}\hspace{8.45cm}$
   
2. **EQUATION OF MOTION**
   
   $a_r=-\dfrac{Gm}{r^2}-4\pi r^2\dfrac{\partial P}{\partial m}\hspace{7.15cm}$  

3. **ENERGY EQUATION**
   
   $\dfrac{\partial L}{\partial m}=\epsilon_{\mathrm{nuc}}-c_P\dfrac{\partial T}{\partial t}+\dfrac{\delta}{\rho}\dfrac{\partial P}{\partial t}\hspace{8.1cm}$  
   
4. **ENERGY TRANSPORT EQUATION**
   
   $\dfrac{\partial T}{\partial m}=-\dfrac{Gm}{4\pi r^4}\dfrac{T}{P}\nabla\hspace{6.56cm}$    
   
   with $\hspace{0.25cm}\nabla=\nabla_{\mathrm{rad}}\hspace{0.25cm}\mathrm{if}\hspace{0.25cm}\nabla_{\mathrm{rad}}\leq\nabla_{\mathrm{ad}}\:, \nabla=\nabla_{\mathrm{ad}}\hspace{0.25cm}\mathrm{if}\hspace{0.25cm}\nabla_{\mathrm{rad}}>\nabla_{\mathrm{ad}}$

5. **ABUNDANCE EQUATION**
   
   $\dfrac{\partial X_i}{\partial t}=\dfrac{A_im_u}{\rho}\left(-\sum_j(1+\delta_{ij})r_{ij}+\sum_{k,l}r_{kl,i}\right)+[\mathrm{mixing\: terms}]\hspace{1.13cm}$    
   
   with $\hspace{0.25cm}\sum_i^I X_i=1\:,\hspace{0.5cm}I=\#$ isotopes.

This is a system of non-linear partial differential equations, with the mass coordinate $m$ and the time $t$ as independent variables.

### How many equations and unknowns? 
The abundance equation, (5), is a set of $I$ equations, where $I$ expresses the number of species in the chemical mixture composing the star. One of the equations can be replaced by the condition on the sum of the isotopes' mass fractions, $X_i$, to be normalized to unit, $\sum_i^I X_i=1$. Therefore, we have a total of $I+4$ equations. 

Counting the unknowns goes more or less like you did in [Equations](https://orlox.github.io/stars_2023_2024/dev/2_equations/). We can see the following symbols appearing in the system of equations:
1. The radius $r(m,t)$ 
2. The density $\rho(m,t)$
3. The pressure $P(m,t)$
4. The specific entropy $s(m,t)$
5. The temperature $T(m,t)$
6. The luminosity $L(m,t)$
7. The total rate of nuclear energy generation $\epsilon_{\mathrm{nuc}}(m,t)$
8. The reaction rate of the $i$ species with the $j$ species, $r_{ij}(m,t)$
9. The $I$ mass fractions $X_i(m,t)$.

The mass fractions $X_i$ account for $I$ unknowns altogether. Out of the other 8 items of the above list, some quantities can be expressed as a function of the others. For example, remember that the total nuclear energy generatio rate $\epsilon_{\mathrm{nuc}}$, at each mass element $m$, is defined as 

$$\epsilon_{\mathrm{nuc}}\equiv\sum_{ij}\epsilon_{ij}=\sum_{ij}\dfrac{Q_{ij}r_{ij}}{\rho}\:,$$

with $Q_{ij}$ being the $Q$-value of the reaction between species $i$ with $j$, and $r_{ij}$ the rate of the reaction itself. As for the other items, there are functions that describe the characteristics of the stellar material, for example an EOS of the following form is assumed $\forall\: m$:

$$\mathrm{EOS}\hspace{1cm}\rho=\rho(P,T,X_i)\:.$$

We also saw in class that the radiative temperature gradient $\nabla_{\mathrm{rad}}$ is known as a function of $L,P,T,X_i,m$:
$$\nabla_{\mathrm{rad}}=\nabla_{\mathrm{rad}}(m,P,T,X_i,L)\:.$$

#### Mycrophysics ingredients
These are again characteristics of the stellar material, which are describing the physics we put in our model to reach the desired degree of complexity: the Rosseland mean opacity $\kappa$, the nuclear reaction rates $r_{i,j}$ for the chosen network of isotopes, the specific entropy $s$ and $\nabla_{\mathrm{ad}}$. As studied in the lectures, we assume that these are known as a function of $(P,T,X_i)$:

$$\kappa=\kappa(P,T,X_i)$$
$$r_{jk}=r_{jk}(P,T,X_i)\hspace{0.5cm}\Rightarrow\hspace{0.5cm}\epsilon_{\mathrm{nuc}}=\epsilon_{\mathrm{nuc}}(P,T,X_i)$$
$$\nabla_{\mathrm{ad}}=\nabla_{\mathrm{ad}}(P,T,X_i)\:.$$

#### Thermodynamic quantities
The thermodynamic quantities $\delta$ and $c_{\mathrm{P}}$ are also assumed to be known functions of $(P,T,X_i)$, once the EOS is known:

$$\delta=\delta(P,T,X_i)\:,\hspace{0.5cm}c_P=c_P(P,T,X_i)\:.$$

If you now look at the symbols that are left, you can count the following: $r(m,t)$, $P(t,m)$, $T(m,t)$, $L(m,t)$, to be added to the $I$ mass fractions $X_i(m,t)$. We have therefore $I+4$ unknowns for $I+4$ equations.

### What is a stellar model?
The $I+4$ non-linear partial differential equations must be solved simultaneously as a function of the two independent variables $(m,t)$, namely a solution to the above set of equations will span the interval $0\leq m\leq M$, with $M$ depending on mass loss, and $t\geq t_0$, with $t_0$ being an initial time. Notice that we will only find physically relevant solutions once we specify
* the appropriate boundary conditions for $m=0$ and $m=M$, $\forall\: t$;
* the initial values $r(m,t_0)$, $\dot{r}(m,t_0)$, $s(m,t_0)$, $X_i(m,t_0)$, $\forall\: m$;
* a given equation of state and input (micro)physics.

**DEF**: A solution $r(m,t)$, $P(t,m)$, $T(m,t)$, $L(m,t)$, $X_i(m,t)$ for which all the above is satisfied is called **a stellar model**.

#### Initial conditions $t=t_0$
By looking at the quantities that show time derivatives in the system of equations, we see that the radius $r(m,t)$ appears as first and second derivative with respect to time; specific entropy $s(m,t)$ (if you recast the time derivatives of $P$ and $T$ into -$T\partial s/\partial t$) and mass fractions $X_i(m,t)$ appear as first derivatives with respect to time. Therefore, we need to know the initial values of $r(m,t_0)$, $\dot{r}(m,t_0)$, $s(m,t_0)$, $X_i(m,t_0)$, $\forall\: m$.

#### Boundary conditions $m=0$, $m=M$
We need to impose appropriate boundary conditions, which is non trivial: they have to be divided into conditions for the stellar centre, $m=0$, and for the stellar surface, $m=M$. The boundary conditions in the stellar core are quite simple while those for the stellar surface have to be related to observational quantities.

CORE  
We can immediately determine two boundary conditions for the stellar center, i.e. $r=0$ since the density needs to be finite; $l=0$ since the energy sources as well need to stay finite. There are no conditions that we can impose to figure out the values for the central pressure $P_C$ and the central temperature $T_C$.

SURFACE  

As a first naive approach we could take the conditions $P_{\mathrm{surf}}=0$ and $T_{\mathrm{surf}}=0$ for $m=M$. This indeed expresses that P and T take very small values at the stellar surface in comparison with the values in the stellar interior, but
in the end the temperature and the pressure at the stellar surface are not zero. A more realistic approach is to consider the *photosphere* as the surface of the star. The temperature in the photosphere is, to a good approximation, given by the effective temperature of the star. Therefore one could take as boundary conditions at the surface $T_{\mathrm{surf}}=T_{\mathrm{eff}}$ and $P_{\mathrm{surf}}=P_{\mathrm{ph}}$, where we are calling $P_{\mathrm{ph}}$ the pressure at the photosphere.

## Numerical solution of the equations
We can now sketch the general idea behind the numerical algorithm used by stellar evolution codes to actually solve the system of equations of stellar evolution. 

### Discretization
The first step is to discretize the equations 1-5 by replacing the partial derivatives with finite differences, introducing a spatial finite precision, $\Delta m\equiv m_{i+1}-m_{i-1}$. We are dividing our star in $K$ cells, with index $i=1,...,K$ each at mass coordinate $m_i$. Notice that, with our definition of $\Delta m$, the center of each cell will have mass coordinate $m_i$, and the lower (upper) borders are at $m_{i-1}$ ($m_{i+1}$). Let us apply the discretization to the energy transport equation, Equ. 3:

$$\dfrac{\partial L}{\partial m}=\epsilon_{\mathrm{nuc}}-c_P\dfrac{\partial T}{\partial t}+\dfrac{\delta}{\rho}\dfrac{\partial P}{\partial t}\hspace{0.5cm}\rightarrow$$

$$\dfrac{L_{i+1}-L_{i-1}}{m_{i+1}-m_{i-1}}=\left.\epsilon_{\mathrm{nuc}}\right|_i-\left.c_P\right|_i\left(\dfrac{T_i(t_0+\Delta t)-T_i(t_0)}{\Delta t}\right)+\left.\dfrac{\delta}{\rho}\right|_i\left(\dfrac{P_i(t_0+\Delta t)-P_i(t_0)}{\Delta t}\right)\:,$$

where we introduced also a finite temporal resolution $\Delta t$. The RHS of the equation has to be evaluated at the center of the cell, therefore the notation $\left.\epsilon_{\mathrm{nuc}}\right|_i$ stands for evaluation at mass coordinate $m_i$. Let us now bring everything to the LHS of the equality sign and rewrite the equation Eq. 3 in a compact form:

$$f^3_i=0\hspace{0.5cm}\mathrm{with}$$

$$f^3_i\equiv\dfrac{L_{i+1}-L_{i-1}}{m_{i+1}-m_{i-1}}+\left.\epsilon_{\mathrm{nuc}}\right|_i+\left.c_P\right|_i\left(\dfrac{T_i(t_0+\Delta t)-T_i(t_0)}{\Delta t}\right)-\left.\dfrac{\delta}{\rho}\right|_i\left(\dfrac{P_i(t_0+\Delta t)-P_i(t_0)}{\Delta t}\right)\:.$$

This is the discretized form of the energy transport equation holding for the cell of index $i$. We labeled the equation with an upper index $3$ to symbolize that we are referring to Eq. 3 out of all the total $I+4$ equations of the system. 

**NB** It is key to notice that the above, cell-specific equation only depends on quantities related to the cell itself at mass coordinate $m_i$, and on those related to the cell immediately below (above), at mass coordinate $m_{i-1}$ ($m_{i+1}$). This is made explicit by writing the dependencies of $f^3_i$,

$$f^3_i=f^3_i(r_{i-1},r,r_{i+1},...,X^l_{i-1},X^l,X^l_{i+1})\:,$$

where we have indexed the isotope mass fractions $X^l$ with an index $l=1,...,N$.

#### Convergence
These difference equations represent an **approximation** of the full differential equations, the accuracy of which can be improved by reducing $\Delta t$ and $\Delta m$. A good approach is to choose $m_i$ for each equation such, that all variables change by less than a predefined upper limit between points $i+1$ and $i-1$. *Spatial convergence* of the stellar model is achieved when the change in variables is reduced such that the numerical solution no longer depends on the $\Delta m$. Similarly, *temporal convergence* is achieved when the change in the variables is reduced till independence on $\Delta t$.

#### The full discretized system
If we now introduce the index $j=1,...,I+4$ to label the different equations of stellar evolution, we can write the entire system 1-5 for the cell $i$ in the compact form below:

$$f^j_i=0\hspace{1cm}\mathrm{with}\hspace{0.5cm}j=1,...,I+4\:,\hspace{0.5cm}\forall i=\mathrm{fixed}\:.$$

By labeling the independent unknowns of the system as $x^1=r\:,x^2=P\:,x^3=T\:,x^4=L\:,x^{l=1...I}=X^{l=1...I}$, we can also make explicit the dependencies of $f_i^j$ in the following way:

$$f^j_i=f^j_i(x_{i-1}^1,x_{i}^1,x_{i+1}^1,...,x_{i-1}^{I+4},x_i^{I+4},x_{i+1}^{I+4})\:.$$

#### Vector notation
Let us now put everything together in a vector notation. Till now, we wrote all the equations keeping the cell $i$ fixed. We can consider the entirety of cells, $i=1...K$, and define the vector of unknowns $\vec{x}$, which contains all the values assumed by the unknowns $r,P,T,L,X^l$ at *any* cell $i$, namely:

$$\vec{x}=(x_1^1,x_1^2,...,x_1^{I+4},...,x_K^1,x_K^2,...,x_K^{I+4})\hspace{1cm}\mathrm{with}\hspace{0.5cm}i=1,...,K\:.$$

Analogously, we can define the vector of equations $\vec{f}$, that act on each unknown element of $\vec{x}$, at *any* cell $i$:

$$\vec{f}=(f_1^1,f_1^2,...,f_1^{I+4},...,f_K^1,f_K^2,...,f_K^{I+4})\:.$$

The total number of components of the vector $\vec{f}$ is then $(I+4)\times K$, and the system of $I+4$ equations per each cell $i$ can be written this way

$$\vec{f}(\vec{x})=\vec{0}\:.$$

### Linearization 
The following step is the linearization of the system, to be able to solve it with a Newton-Raphson-like algorithm. We usually start from a guess of the solution, namely a vector $\vec{x}^*$, that is not a perfect solution of the full system $\vec{f}(\vec{x})=\vec{0}$. In general, evaluating $\vec{f}(\vec{x}^*)$, we will find that it is not equal to zero but to a correction vector $\vec{b}$ instead:

$$\vec{f}(\vec{x^*})=\vec{b}\:.$$

We want to know how we can correct the initial guess $\vec{x}^*$ for it to be the exact solution $\vec{x}$, i.e. we want to find a $\delta \vec{x}\equiv \vec{x}-\vec{x}^*$ such that $\vec{f}(\vec{x}^*+\delta \vec{x})=\vec{0}$. Let us expand this equality to the **linear** order:

$$\vec{0}=\vec{f}(\vec{x}^*+\delta \vec{x})\simeq \vec{f}(\vec{x^*})+J\vec{f}\cdot\delta\vec{x}\hspace{0.5cm}\Leftrightarrow\hspace{0.5cm}J\vec{f}\cdot\delta\vec{x}=-\vec{b}\:.$$

We called the Jacobian of $\vec{f}$ as $J$ and substituted $\vec{f}(\vec{x}^*)=\vec{b}$. 

#### L-D-U Jacobian
This Jacobian will have a very typical structure, that is called L-D-U because of the non-zero diagonal ($D$) blocks being surrounded by a lower ($L$) and upper ($U$) non-zero blocks, as a consequence of the discretized equations for the cell $i$, $f^j_i$, being dependent only on the upper (lower) cells $i+1$ ($i-1$). You can easily convince yourself about this by inspecting the following:

$$J\vec{f}= \begin{bmatrix}D_1 & U_1 & 0 & ... & 0 \\ L_1 & D_2 & U_2 & ... & ... \\ 0 & L_2 & D_3 & ... & 0 \\ ... & ... & ... & ... & U_K \\ 0 & ... & 0 & L_{K-1} & D_K \end{bmatrix}$$

$$D_2\equiv \begin{bmatrix}\dfrac{\partial f_2^1}{\partial x_2^1} & \dfrac{\partial f_2^1}{\partial x_2^2} & ... & \dfrac{\partial f_2^1}{\partial x_2^{I+4}} \\ ... & ... & ... & ...\\ \\ \dfrac{\partial f_2^{I+4}}{\partial x_2^1} & \dfrac{\partial f_2^{I+4}}{\partial x_2^2} & ... & \dfrac{\partial f_2^{I+4}}{\partial x_2^{I+4}} \end{bmatrix}\:,$$

$$U_2\equiv\begin{bmatrix}\dfrac{\partial f_2^1}{\partial x_3^1} & \dfrac{\partial f_2^1}{\partial x_3^2} & ... & \dfrac{\partial f_2^1}{\partial x_3^{I+4}} \\ ... & ... & ... & ...\\ \\ \dfrac{\partial f_2^{I+4}}{\partial x_3^1} & \dfrac{\partial f_2^{I+4}}{\partial x_3^2} & ... & \dfrac{\partial f_2^{I+4}}{\partial x_3^{I+4}} \end{bmatrix}\:,$$

$$L_2\equiv \begin{bmatrix}\dfrac{\partial f_3^1}{\partial x_2^1} & \dfrac{\partial f_3^1}{\partial x_2^2} & ... & \dfrac{\partial f_3^1}{\partial x_2^{I+4}} \\ ... & ... & ... & ...\\ \\ \dfrac{\partial f_3^{I+4}}{\partial x_2^1} & \dfrac{\partial f_3^{I+4}}{\partial x_2^2} & ... & \dfrac{\partial f_3^{I+4}}{\partial x_2^{I+4}} \end{bmatrix}\:.$$ 

Notice that every block $D$ (or $L$, $U$) has dimensions $(I+4)\times(I+4)$. Also, we showed explicitly the blocks acting on cell $i=2$ for illustrative purposes; remember however that cells $i=1$ and $i=K$ need to account for boundary conditions too.

### Iterations

When the determinant of this Jacobian is different than zero, the system can be solved for $\delta \vec{x}$. On their turn, the correction vector $\delta \vec{x}$ will lead us to a second, better approximation of the solution, i.e. a vector $\vec{x}^{**}$. However, since we only worked in the linear approximation and, moreover, numerical inaccuracies are always
involved, we would still find that $\vec{f}(\vec{x}^{**})\neq 0$. Therefore we take a second iteration step and we determine new corrections $\delta\vec{x}^{**}\equiv \vec{x}-\vec{x}^{**}$ with the same method outlined above. The iterations keep going untill we reach the desired precision.

**NB** There's no guarantee for the iteration procedure for improving the approximations  to always converge! In fact if the chosen approximation is too far from the solution, then the required corrections are so large that one cannot neglect the second-order terms, and the linearization is not appropriate anymore.