# Stellar evolution models
This introduction to the first MESA lab will cover what a stellar model is, how to build one and how modern stellar evolution codes create and evolve those in time. 

## Differential equations of stellar evolution
Let's collect and summarize the system of differential equations derived in the previous lectures for a spherically symmetric star, in Lagrangian form.

1. **CONTINUITY EQUATION**
   
   $\dfrac{\partial r}{\partial m}=\dfrac{1}{4\pi r^2 \rho}\hspace{8.45cm}$
   
2. **EQUATION OF MOTION**
   
   $a_r=-\dfrac{Gm}{r^2}-4\pi r^2\dfrac{\partial P}{\partial m}\hspace{7.15cm}$  

3. **ENERGY EQUATION**
   
   $T\dfrac{\partial s}{\partial t}=-\dfrac{\partial L}{\partial m}+\epsilon_{\mathrm{nuc}}\hspace{8.1cm}$  
   
4. **ENERGY TRANSPORT EQUATION**
   
   $\dfrac{\partial T}{\partial m}=-\dfrac{Gm}{4\pi r^4}\dfrac{T}{P}\nabla\hspace{6.56cm}$    
   
   with $\hspace{0.25cm}\nabla=\nabla_{\mathrm{rad}}\hspace{0.25cm}\mathrm{if}\hspace{0.25cm}\nabla_{\mathrm{rad}}\leq\nabla_{\mathrm{ad}}\:, \nabla=\nabla_{\mathrm{ad}}+\Delta\nabla\hspace{0.25cm}\mathrm{if}\hspace{0.25cm}\nabla_{\mathrm{rad}}>\nabla_{\mathrm{ad}}$

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
These are again characteristics of the stellar material, which are describing the physics we put in our model to reach the desired degree of complexity: the Rosseland mean opacity $\kappa$, the nuclear reaction rates $r_{i,j}$ for the chosen network of isotopes, the thermodynamic gradients $\nabla_{\mathrm{rad}}$ and $\nabla_{\mathrm{ad}}$, the specific entropy $s$. As studied in the lectures, we assume that these are known as a function of $(P,T,X_i)$. Summarizing:

$$\kappa=\kappa(P,T,X_i)$$
$$r_{jk}=r_{jk}(P,T,X_i)\hspace{0.5cm}\Rightarrow\hspace{0.5cm}\epsilon_{\mathrm{nuc}}=\epsilon_{\mathrm{nuc}}(P,T,X_i)$$
$$\nabla_{\mathrm{rad}}=\nabla_{\mathrm{rad}}(P,T,X_i)\:,\hspace{1cm}\nabla_{\mathrm{ad}}=\nabla_{\mathrm{ad}}(P,T,X_i)$$
$$s=s(P,T,X_i)$$

If you now look at the symbols that are left, you can count the following: $r(m,t)$, $P(t,m)$, $T(m,t)$, $L(m,t)$, to be added to the $I$ mass fractions $X_i(m,t)$. We have therefore $I+4$ unknowns for $I+4$ equations.

#### Initial conditions $t=t_0$
By looking at the quantities that show time derivatives in the system of equations, we see that the radius $r(m,t)$ appears as first and second derivative with respect to time; specific entropy $s(m,t)$ and mass fractions $X_i(m,t)$ appear as first derivatives with respect to time. Therefore, we need to know the initial values of $r(m,t_0)$, $\dot{r}(m,t_0)$, $s(m,t_0)$, $X_i(m,t_0)$, $\forall\: m$.

### What is a stellar model?
The $I+4$ non-linear partial differential equations must be solved simultaneously as a function of the two independent variables $(m,t)$, namely a solution to the above set of equations will span the interval $0\leq m\leq M$, with $M$ depending on mass loss, and $t\geq t_0$, with $t_0$ being an initial time. Notice that we will only find physically relevant solutions once we specify
* the appropriate boundary conditions for $m=0$ and $m=M$, $\forall\: t$;
* the initial values $r(m,t_0)$, $\dot{r}(m,t_0)$, $s(m,t_0)$, $X_i(m,t_0)$, $\forall\: m$;
* a given equation of state and input (micro)physics.

**DEF**: A solution $r(m,t)$, $P(t,m)$, $T(m,t)$, $L(m,t)$, $X_i(m,t)$ for which all the above is satisfied is called **a stellar model**.

## Boundary conditions
TODO
### Center $m=0$

### Surface $m=M$

## Henyey scheme
For realistic functions no analytic solutions are possible, so that one should search for numerical solutions to solve the system of equations. Here we shall describe the ***Henyey numerical scheme***, a simplified method to solve differential equations with boundary conditions at both ends of the solution interval. The method is based on 1) discretizing the equations, subsequently 2) linearizing them and lastly 3) find a solution with iterations. The trial solution for the whole interval is gradually improved upon in consecutive iterations until the required degree of accuracy is reached, in a Newton-Raphson method fashion.

#### Standard models  
In absence of mixing terms (i.e. $\partial X_i/\partial m=0$), we can first solve the system of equations 1-4 with a given $X_i(m)$, then update $X_i$ by applying equation 5 with a small timestep $\Delta t$. Then again solve 1-4 with the updated $X_i$, and so on. For illustrative reasons, we will limit ourselves to use this assumption and focus on how to solve the equations 1-4 simultaneously. Additionally, we will assume full hydrostatic and thermal equilibrium:
* *Hydrostatic Equilibrium* $\hspace{1cm}\ddot{r}=0\hspace{0.5cm}\Rightarrow\hspace{0.5cm}0=-\dfrac{Gm}{r^2}-4\pi r^2\dfrac{\partial P}{\partial m}$

* *Thermal Equilibirum* $\hspace{1cm}\dot{s}=\dot{T}=\dot{P}=0\hspace{0.5cm}\Rightarrow\hspace{0.5cm}0=-\dfrac{\partial L}{\partial m}+\epsilon_{\mathrm{nuc}}$
  
At each given $X_i(m)$, we need to solve for 4 unknown functions $r$, $P$, $T$, $L$ in the interval $0\leq m\leq M$. And as for initial conditions, we only need to know $s(m,t_0)$ (actually just $\nabla(m,t_0)$), and then $\dot{s}=0$.
  
The method under these assumptions is particularly suitable to compute stellar models during the core-hydrogen burning stage, and the outcome gives us what we call **standard models**. In reality more complex, state-of-the-art stellar evolution codes, like MESA, solve the full set with mixing terms, and are able to treat all the stages of the evolution.

#### From PDEs to ODEs
With the above simplifications, we got rid of all the time derivatives in the equations 1-4. Therefore, we are not dealing anymore with a system of partial differential equations, but with a system of **ordinary** differential equations. AS a result, we can write the 4 equations in this way

$$\dfrac{dy_i}{dm}=f_i(y_1,y_2,y_3,y_4)\hspace{1cm}\mathrm{with}\hspace{0.5cm}i=1,2,3,4$$
where we have called $y_1=r$, $y_2=P$, $y_3=T$ and $y_4=L$.

### Discretization
Let us now discretize the equations 1-4: this is just replacing them by differential equations for a finite mass-interval $\Delta m=[m^j,\:m^{j+1}]$. At each end of the finite mass interval $\Delta m$, the variables $r$, $P$, $T$, $L$ will assume the values $y_1^j,\: y_1^{j+1}$, ... $y_4^j,\: y_4^{j+1}$. The functions $f_i$ have to be evaluated in an average argument, which is indicated with $y_i^{j+1/2}$, often being just a geometric mean between $y_i^{j}$ and $y_i^{j+1}$. 
We can now write our discretized system 1-4 of ordinary differential equations in this way:

$$A_i^j=0$$

$$\mathrm{with}\hspace{0.5cm}A_i^j\equiv \dfrac{y_i^j-y_i^{j+1}}{m^j-m^{j+1}}-f_i(y_1^{j+1/2},\:...\:,y_4^{j+1/2})\:,\hspace{1cm}i=1,2,3,4\:.$$

#### Surface $j=1$
Let us write in the same fashion also the boundary conditions at $m=0$ and $m=M$. If the boundary conditions for $P$ and $T$ at the surface are fixed at the mass coordinate $m^1$, namely at index $j=1$, we can write

$$B_i=0$$

$$\mathrm{with}\hspace{0.5cm}B_1\equiv y_2^1-\pi(y_1^1,y_4^1)\:,\hspace{0.5cm}B_2\equiv y_3^1-\theta(y_1^1,y_4^1)\:,\hspace{1cm}i=1,2\:.$$

#### Core $j=K$
Lastly, we need to impose the boundary conditions in the center $m=0$. Notice that if we want to know the solution $r(m)$, $P(m)$, $T(m)$, $L(m)$ in $K$ grid points, we are diving the star in $K-1$ intervals: every discretization point will have an $m^j$ with $j=1,\:...\: K$. The upper boundary is located at $j=1$, and the core at $j=K$. We can write

$$C_i\left(y_1^{K-1},\: ... \:,y_4^{K-1},y_2^K,y_3^K\right)=0\:,\hspace{1cm}i=1,2,3,4\:,$$

where we have made use of the fact that $P_c\simeq P+C_2(\rho_c=\rho_c(r))\Leftrightarrow y_2^K=y_2^{K-1}+C_2(y_1^{K-1})$ and $T_c\simeq T+C_3(\kappa_c,\epsilon_{\mathrm{nuc},c},\rho_c)\Leftrightarrow y_3^{K}=y_3^{K-1}+C_3(y_1^{K-1},\: ... \:,y_4^{K-1})$. The conditions $y_1^K=0$ and $y_4^K=0$ are incorporated. 

#### The complete discretized system
1. $A_i^j=0\:,\hspace{0.5cm}i=1,\:...\:,4\:,\hspace{0.25cm}j=1,\:...\:,K-2$
2. $B_i=0\:,\hspace{0.5cm}i=1,2$
3. $C_i=0\:,\hspace{0.5cm}i=1,\:...\:,4$
   
and you have $4(K-2)+2+4=4K-2$ equations, which correspond to $4K-2$ unknowns (as we want to know the values of $y_i^j$ at every $j=1,\:...\:,K$, with $y_1^K=y_4^K=0$).

#### Convergence
These difference equations represent an **approximation** of the full differential equations, the accuracy of which can be improved by reducing $\Delta t$ and $\Delta m$. A good approach is to choose $m_j$ for each $j$ such, that all variables change by less than a predefined upper limit between points $j$ and $j-1$. *Spatial convergence* of the stellar model is achieved when the change in variables is reduced such that the numerical solution no longer depends on the $\Delta m$. Similarly, *temporal convergence* is achieved when the change in the variables is reduced till independence on $\Delta t$.

### Linearization
Starting from the above system 1-3, the solving procedure is now very similar to a Newton-Raphson algorithm in linear algebra. Let us start from a guessed initial solution $\left(y_i^j\right)_{1}$ for $i=1,2,3,4$ and $j=1,\:...\:,K$. This first guess won't be a perfect solution for the system 1-3, i.e. when we use them as arguments in the functions $A_i^j$, $B_i$ and $C_i$ we will find

$$A_i^j(1)\neq 0\:,\hspace{0.25cm} B_i(1)\neq0\:,\hspace{0.25cm} C_i(1)\neq 0\:.$$

Let us now look for corrections $\delta y_i^j$ for all variables at all mesh points such that the second approximation $\left(y_i^j\right)_{2}$ will make the functions $A_i^j(2)$, $B_i(2)$ and $C_i(2)$ disappear, i.e.

$$A_i^j(1)+\delta A_i^j=0\:,\hspace{0.25cm}B_i(1)+\delta B_i=0\:,\hspace{0.25cm}C_i(1)+\delta C_i=0\:,$$

$$\mathrm{with}\hspace{0.5cm}\left(y_i^j\right)_{2}=\left(y_i^j\right)_{1}+\delta y_i^j\:.$$

For small enough corrections, we may expand the $\delta A_i^j$, $\delta B_i$ and $\delta C_i$ in terms of powers of the corrections $\delta y_i^j$, and keep only the linear terms in this expansion; for example,

$$\delta B_1\approx \left.\dfrac{\partial B_1}{\partial y_1^1}\right|_1\delta y_1^1+\left.\dfrac{\partial B_1}{\partial y_2^1}\right|_1\delta y_2^1+\left.\dfrac{\partial B_1}{\partial y_3^1}\right|_1\delta y_3^1+\left.\dfrac{\partial B_1}{\partial y_4^1}\right|_1\delta y_4^1\:,$$
where the partial derivatives are to be evaluated at the first approximation arguments $\left(y_i^j\right)_1$. We will have in the end a system that looks like this:

1. $\left.\dfrac{\partial A_i^j}{\partial y_1^j}\right|_1\delta y_1^j+...+\left.\dfrac{\partial A_i^j}{\partial y_4^j}\right|_1\delta y_4^j+\left.\dfrac{\partial A_i^j}{\partial y_1^{j+1}}\right|_1\delta y_1^{j+1}+...+\left.\dfrac{\partial A_i^j}{\partial y_4^{j+1}}\right|_1\delta y_4^{j+1}=\left.-A_i^j\right|_1$
2. $\left.\dfrac{\partial B_i}{\partial y_1^1}\right|_1\delta y_1^1+...+\left.\dfrac{\partial B_i}{\partial y_4^1}\right|_1\delta y_4^1=\left.-B_i\right|_1$
3. $\left.\dfrac{\partial C_i^{K-1}}{\partial y_1^{K-1}}\right|_1\delta y_1^{K-1}+...+\left.\dfrac{\partial C_i^{K-1}}{\partial y_4^{K-1}}\right|_1\delta y_4^{K-1}+\left.\dfrac{\partial C_i^{K}}{\partial y_2^{K}}\right|_1\delta y_2^{K}+\left.\dfrac{\partial C_i^{K}}{\partial y_3^{K}}\right|_1\delta y_3^{K}=\left.-C_i\right|_1$
   
Notice that we know all the partial derivatives and the RHS of the equations, since they are evaluated at $\left(y_i^j\right)_1$. This is a **linear** (inhomogeneous) system that needs to be solved for the small corrections $\delta y_i^j$. The matrix containing all the partial derivatives is called *Henyey matrix*, and when its determinant is not zero, the system can be solved.

### Iterations
When the determinant of the Henyey matrix is not zero, we can obtain the corrections $\delta y_i^j$ and use them to compute a better approximation of the solution, i.e. $\left(y_i^j\right)_2=\left(y_i^j\right)_1+\delta y_i^j$. When using these second approximations as arguments, we will generally still find $A_i^j(2)\neq 0$, $B_i(2)\neq0$ and $C_i(2)\neq 0$. This is because the corrections were calculated from the linearized equations 1-3, while the full discretized equations are non-linear, and in any case the accuracy is limited, as discussed when talking about convergence.

In general, we will need more consecutive iterations. The approximate solution can be improved until either the absolute values of all corrections $\delta y_i^j$, or the absolute values of all right-hand sides in 1-3, drop below a chosen limit, i.e. the required accuracy.

**NB** There's no guarantee for the iteration procedure for improving the approximations  to always converge! In fact if the chosen approximation is too far from the solution, then the required corrections are so large that one cannot neglect the second-order terms, and the linearization is not appropriate anymore.