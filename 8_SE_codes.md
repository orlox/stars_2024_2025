# Stellar evolution models
<div style="text-align: justify">
This introduction to the first MESA lab will cover what a stellar model is, how to build one and how modern stellar evolution codes create and evolve those in time. 

## Differential equations of stellar evolution
Let's collect and summarize the system of differential equations derived in the previous lectures for a spherically symmetric star, in Lagrangian form.

1. $\dfrac{\partial r}{\partial m}=\dfrac{1}{4\pi r^2 \rho}\hspace{8.45cm}$
   CONTINUITY EQUATION
  
2. $a_r=-\dfrac{Gm}{r^2}-4\pi r^2\dfrac{\partial P}{\partial m}\hspace{7.15cm}$  EQUATION OF MOTION

3. $T\dfrac{\partial s}{\partial t}=-\dfrac{\partial L}{\partial m}+\epsilon_{\mathrm{nuc}}\hspace{8.1cm}$  ENERGY EQUATION
   
4. $\dfrac{\partial T}{\partial m}=-\dfrac{Gm}{4\pi r^4}\dfrac{T}{P}\nabla\hspace{0.5cm}\mathrm{with}\hspace{0.25cm}\nabla=\left\{
\begin{aligned}
& \nabla_{\mathrm{rad}}\hspace{0.25cm}\mathrm{if}\hspace{0.25cm}\nabla_{\mathrm{rad}}\leq\nabla_{\mathrm{ad}} \\
& \nabla_{\mathrm{ad}}\hspace{0.35cm}\mathrm{if}\hspace{0.25cm}\nabla_{\mathrm{rad}}>\nabla_{\mathrm{ad}}
\end{aligned}
\right.\hspace{0.97cm}$  ENERGY TRANSPORT EQUATION

5. $\dfrac{\partial X_i}{\partial t}=\dfrac{A_im_u}{\rho}\left(-\sum(1+\delta_{ij})r_{ij}+\sum_{k,l}r_{kl,i}\right)+[\mathrm{mixing\: terms}]\hspace{1.3cm}$  ABUNDANCE EQUATION  with $\sum_i^I X_i=1\:,\hspace{0.5cm}I=\#$ isotopes.

This is a system of non-linear partial differential equations, with the mass coordinate $m$ and the time $t$ as independent variables.

### How many equations and unknowns? 
The abundance equation, (5), is a set of $I$ equations, where $I$ expresses the number of species in the chemical mixture composing the star. One of the equations can be replaced by the condition on the sum of the isotopes' mass fractions $X_i$ to be normalized to unit, $\sum_i^I X_i=1$. Therefore, we have a total of $I+4$ equations. 

### What we assume to know


## Timescales simplifications

## Boundary conditions

## Henyey scheme

### Discretization 

### Convergence
