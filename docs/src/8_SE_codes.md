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

$$\mathrm{EOS}\hspace{1cm}\rho=\rho(P,T,X_i)$$

#### Assumed microphysics ingredients
These are again characteristics of the stellar material, which are describing the physics we put in our model to reach the desired degree of complexity: the Rosseland mean opacity $\kappa$, the nuclear reaction rates $r_{i,j}$ for the chosen network of isotopes, the specific entropy $s$. As studied in the lectures, we assume that these are known as a function of $(P,T,X_i)$:

$$\kappa=\kappa(P,T,X_i)$$
$$r_{jk}=r_{jk}(P,T,X_i)\hspace{0.5cm}\Rightarrow\hspace{0.5cm}\epsilon_{\mathrm{nuc}}=\epsilon_{\mathrm{nuc}}(P,T,X_i)$$

Lastly, the thermodynamic gradients $\nabla_{\mathrm{rad}}$ and $\nabla_{\mathrm{ad}}$ are also assumed to be known functions of $(P,T,X_i)$, once the EOS is known:

$$\nabla_{\mathrm{rad}}=\nabla_{\mathrm{rad}}(P,T,X_i,)\:,\hspace{1cm}\nabla_{\mathrm{ad}}=\nabla_{\mathrm{ad}}(P,T,X_i)$$

If you now look at the symbols that are left, you can count the following: $r(m,t)$, $P(t,m)$, $T(m,t)$, $L(m,t)$, to be added to the $I$ mass fractions $X_i(m,t)$. We have therefore $I+4$ unknowns for $I+4$ equations.

#### Initial conditions $t=t_0$
By looking at the quantities that show time derivatives in the system of equations, we see that the radius $r(m,t)$ appears as first and second derivative with respect to time; specific entropy $s(m,t)$ (if you recast the time derivatives of $P$ and $T$ into -$T\partial s/\partial t$) and mass fractions $X_i(m,t)$ appear as first derivatives with respect to time. Therefore, we need to know the initial values of $r(m,t_0)$, $\dot{r}(m,t_0)$, $s(m,t_0)$, $X_i(m,t_0)$, $\forall\: m$.

### What is a stellar model?
The $I+4$ non-linear partial differential equations must be solved simultaneously as a function of the two independent variables $(m,t)$, namely a solution to the above set of equations will span the interval $0\leq m\leq M$, with $M$ depending on mass loss, and $t\geq t_0$, with $t_0$ being an initial time. Notice that we will only find physically relevant solutions once we specify
* the appropriate boundary conditions for $m=0$ and $m=M$, $\forall\: t$;
* the initial values $r(m,t_0)$, $\dot{r}(m,t_0)$, $s(m,t_0)$, $X_i(m,t_0)$, $\forall\: m$;
* a given equation of state and input (micro)physics.

**DEF**: A solution $r(m,t)$, $P(t,m)$, $T(m,t)$, $L(m,t)$, $X_i(m,t)$ for which all the above is satisfied is called **a stellar model**.

### Discretization
TODO

#### Convergence
These difference equations represent an **approximation** of the full differential equations, the accuracy of which can be improved by reducing $\Delta t$ and $\Delta m$. A good approach is to choose $m_j$ for each $j$ such, that all variables change by less than a predefined upper limit between points $j$ and $j-1$. *Spatial convergence* of the stellar model is achieved when the change in variables is reduced such that the numerical solution no longer depends on the $\Delta m$. Similarly, *temporal convergence* is achieved when the change in the variables is reduced till independence on $\Delta t$.

### Linearization
TODO

**NB** There's no guarantee for the iteration procedure for improving the approximations  to always converge! In fact if the chosen approximation is too far from the solution, then the required corrections are so large that one cannot neglect the second-order terms, and the linearization is not appropriate anymore.



