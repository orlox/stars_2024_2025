# Questions
<div style="text-align: justify"> 

## Preliminary instructions
Download the input files from your [Toledo](https://toledo.kuleuven.be/portal) page of the Stellar Structure & Evolution class. You should find those in the last published announcement. After decompressing your download, put the content in the ```MESA_LAB1``` directory:

```bash
# Move to the directory of your choice
cd MESA_LAB1
# Decompress the downloaded file from Toledo
tar -xf lab1_input.tar.xz
# Copy all the input files and put them in place of the ones already present in the MESA_LAB1 folder
cp -R ./lab1_input/* .
```

Consult the table of masses and find your team number. In the pair of assigned masses, pick your mass $M$ and put it as initial condition for your simulation. To do so, open your ```inlist_project``` file and edit it as follows, assuming that your mass for the simulation 1 is $M=X\:M_{\odot}$:
```fortran

&star_job
    [...]
    ! save a model at the end of the run
        save_model_when_terminate = .false.
        save_model_filename = 'XMsun_at_TAMS.mod'

        write_profile_when_terminate = .true.
        filename_for_profile_when_terminate = 'XMsun_at_TAMS_profile.data'
    [...]
/ ! end of star_job namelist

[...]

&controls
    ! starting specifications
        initial_mass = X ! in Msun units
    [...]
    ! output controls
        log_directory = 'LOGS_XMsun'
        photo_directory = 'photos_XMsun'
    [...]
/ ! end of controls namelist

[...]

&pgstar
    ! file output
    Grid1_file_flag = .true.
    Grid1_file_dir = 'grid_png_XMsun'
    Grid1_file_prefix = 'grid_XMsun_'
    [...]
/ ! end of pgstar namelist

```

You are good to go: run the simulation 1 using the [instructions](https://orlox.github.io/stars_2023_2024/dev/) and look at the dynamic plots attentively; the run should be smooth and fast. If you did everything correctly, you should be able to see something like the window below popping out in your screen:

![alt text for screen readers](./assets/pgstar_example.png "Pgstar window")

Once the simulation 1 is done, edit your ```inlist_project``` as above, but this time assuming that your mass for the simulation 2 is $M'=X'\:M_{\odot}$: substitute every $X$ value with your $X'$ value. This is necessary to avoid overwriting your previous output.

<center>
<div align="center" style="padding: 2px; border: 2px solid #e86f3f; display: inline-block;">

<b> 🚨 Attention 🚨 </b> <br>
Before leaving the session, save your ```MESA_LAB1``` folder somewhere: your local machines / USB memory / personal folder in the system. In the following, I am going to assume that you are at home writing your report: specifically, you are <b>student A</b> assigned with mass $M=X\:M_{\odot}$ for your simulation 1, and you will use $M'\neq M$ just to answer the question on <i> Massive vs Low Mass evolution </i>. 

</div>
</center>


## I. The Pre Main Sequence and Main Sequence (2 pts)
You evolved a model star with initial mass $M$ along the Pre Main Sequence (PMS) phases and its Main Sequence (MS):
<ul>
   <li>
   
   <b>PMS</b>: Phase of the evolution in which the star is just formed but still too cold to ignite hydrogen burning in the core; the star contracts due to gravity, and thanks to the virial theorem in action its internal energy increases, until the conditions in its core are suitable for the first nuclear reactions to start. When hydrogen burning starts, we finally talk about Main Sequence.
   
   </li>

   <li>

   <b>MS</b>: Phase of the evolution in which the star is burning hydrogen in its core; stars will spend roughly $~90\%$ of their lives in this stage. We can also give two other useful names: 
   <ul>
        <li> 
        <u>ZAMS</u>: Zero Age Main Sequence, point in stellar evolution when the star joins the Main Sequence;
        </li>
        <li> 
        <u>TAMS</u>: Terminal Age Main Sequence, point in stellar evolution when the star has burnt all hydrogen in its core.
        </li>
   </ul> 
   
   </li>

</ul>

<ol type="1">
<li>
<p style="color:#b82828;font-size:110%;"><u><b>Orders of magnitude</b></u></p>

Compute the dynamical ($\tau_{\mathrm{dyn}}$), Kelvin-Helmholtz ($\tau_{\mathrm{KH}}$) and nuclear ($\tau_{\mathrm{nuc}}$) timescales expected for your star with mass $M=X\:M_{\odot}$ <b>at ZAMS</b>. To do so, remember the exercise from lecture [2](https://orlox.github.io/stars_2022_2023/history) in which you found

$$\tau_{\mathrm{dyn}}\approx\sqrt{\dfrac{R^3}{GM}}\approx 0.02\left(\dfrac{R}{R_{\odot}}\right)^{3/2}\left(\dfrac{M_{\odot}}{M}\right)^{1/2}\:\mathrm{days},$$
$$\tau_{\mathrm{KH}}\approx\dfrac{GM^2}{2RL}\approx 1.5\times 10^7\left(\dfrac{M}{M_{\odot}}\right)^2\dfrac{R_{\odot}}{R}\dfrac{L_{\odot}}{L}\:\mathrm{yr},$$
$$\tau_{\mathrm{nuc}}\approx 10^{10}\dfrac{M}{M_{\odot}}\dfrac{L_{\odot}}{L}\:\mathrm{yr}.$$

You will have to give a look at the ```./LOGS_XMsun/history.data``` file. You should be able to read the information you need from those columns. <b>NB</b>: the ```star_age``` column that you'll use as a check is in unit of years!

<i>Hint</i>: A good indicator of the start of the ZAMS is the central hydrogen abundance ```center_h1```.

</li>
<li>
<p style="color:#b82828;font-size:110%;"><u><b>Timescale of MS phase</b></u></p>

How much time $\tau_{\mathrm{MS}}$ does your star spend in the MS phase in the simulation? To which order of magnitude estimate above would you associate this timescale? What does this mean in terms of the star's equilibrium?
</li>


<li>
<p style="color:#b82828;font-size:110%;"><u><b>Timescale of PMS phase</b></u></p>

How much time $\tau_{\mathrm{PMS}}$ does your star spend in the PMS phase in the simulation? To which order of magnitude estimate above would you associate this timescale? What does this mean in terms of the star's equilibrium?
</li>
</ol>

## II. The Virial Theorem (5 pts)
You will now verify that the virial theorem is in action during your star's evolution. To do so, we will start by computing the total energy reservoir $E_{\mathrm{tot}}$ of your star. Remember that the total energy is given, at each timestep, by

$$E_{\mathrm{tot}}=E_{\mathrm{gr}}+E_{\mathrm{int}}+E_{\mathrm{kin}}\:,$$

where $E_{\mathrm{gr}}$ stands for gravitational potential energy, $E_{\mathrm{int}}$ for internal energy and $E_{\mathrm{kin}}$ is the energy associated to bulk motions pf gas inside the star, which is different from $E_{\mathrm{int}}$, being due to the thermal motions of the gas particles.

<ol type="1">

<li>
<p style="color:#e66e1e;font-size:110%;"><u><b>Gravitational potential energy</b></u></p>

Compute the gravitational potential energy $E_{\mathrm{grav}}$ of your star <b>at ZAMS</b>. You will have to give a look at the ```./LOGS_XMsun/profileN.data```, where N corresponds to the number of profile which is closer to being the profile of your star at ZAMS. Do it directly from the formal definition:

$$E_{\mathrm{grav}}\equiv -\int_0^M\:\dfrac{Gm}{r(m)}dm\:.$$

<i>Hint</i>: From the previous step, you should have been able to determine which model along the evolutionary track corresponds to the ZAMS one. The mapping from this number to the right profile is straightforward, once you give a look at a file called ```./LOGS_XMsun/profiles.index```. You should use the information printed on the columns ```rmid``` (radial coordinate of the cell in $R_{\odot}$), ```mmid``` (mass coordinate of the cell in $M_{\odot}$) and ```dm``` (cell mass in grams).

</li>

<li>
<p style="color:#e66e1e;font-size:110%;"><u><b>Internal energy</b></u></p>

Compute the internal energy $E_{\mathrm{int}}$ of your star <b>at ZAMS</b>. Do it directly from the formal definition:

$$E_{\mathrm{int}}\equiv\int_0^M\:u(m)dm\:,$$

where $u=u(m)$ is the specific (per unit mass) internal energy of each cell at mass coordinate $m$. You should be able to find the information in the column ```energy``` (internal energy (ergs/g)).

</li>

<li>
<p style="color:#e66e1e;font-size:110%;"><u><b>Total energy</b></u></p>

Compute the internal energy $E_{\mathrm{kin}}$ of your star <b>at ZAMS</b>. Remember that your star is supposed to be in hydrostatic equilibrium: this should already give you a hint on $E_{\mathrm{kin}}$. If you don't know how to calculate it, give a look at a column called ```cell_specific_KE```, which stands for specific kinetic energy of a single cell (ergs/g) and convince yourself about what you see. <br> You now have all the ingredients to compute $E_{\mathrm{tot}}=E_{\mathrm{gr}}+E_{\mathrm{int}}+E_{\mathrm{kin}}$. Is your system bound at ZAMS?

</li>

<!-- <li>
<p style="color:#e66e1e;font-size:110%;"><u><b>Check along the evolution</b></u></p>

You 

</li> -->
</ol>

Let us now verify that (and how) the virial theorem, always valid in theory under the assumption of spherical symmetry and hydrostatic equilibrium, is actually at work in our simulation. Remember that this theorem connects two important energy reservoirs of the star, i.e. $E_{\mathrm{grav}}$ and $E_{\mathrm{int}}$, and it allows us to interpret the star's phases of evolution. 

<ol type="1">

<li>

<p style="color:#e66e1e;font-size:110%;"><u><b>Virial theorem</b></u></p>

Remember that the most general form of the virial theorem is the following:
<br>
<center>
<div align="center" style="padding: 2px; border: 2px solid #e66e1e; display: inline-block;">
<b>VIRIAL THEOREM</b>
<br>

$$\int_0^M\:\dfrac{P}{\rho}dm=-\dfrac{1}{3}E_{\mathrm{gr}}\:,$$
</dive>
</center>
<br>

with $P=P(m)$ and $\rho=\rho(m)$ being the pressure and density profiles along the star's structure. You already computed $E_{\mathrm{gr}}$ in the previous steps; compute now the left-hand-side (LHS) of the equation <b>at ZAMS</b>, and verify the theorem! Do you expect it to hold at all timesteps too or just at ZAMS?

<i>Hint</i>: You should be able to find the information you need in the columns ```logRho``` and ```logP``` of your ```profileN.data``` file. Also: all the logarithms you'll encounter are in base 10.

</li>

<li>
<p style="color:#e66e1e;font-size:110%;"><u><b>The equation of state</b></u></p>
During your class you derived the following form of the virial theorem in the particular case of perfect, non-relativistic and monoatomic gas:

$$u=\dfrac{3}{2}\dfrac{K_{\mathrm{B}}T}{\mu m_{\mathrm{u}}}=\dfrac{3}{2}\dfrac{P}{\rho}\hspace{0.25cm}\Rightarrow\hspace{0.5cm}E_{\mathrm{int}}=-\dfrac{1}{2}E_{\mathrm{gr}}\:,$$

where the internal energy per unit mass $u$ comes from the perfect gas assumption: the kinetic energy per particle sums up to the total internal energy of an ideal monoatomic gas, and from statistical mechanics this is equal to $3/2 K_{\mathrm{B}}T$. If we now relax the assumption of non-relativistic and monoatomic gas (but keeping it perfect, i.e. non-ideal effects are not in action), we can write the specific internal energy $u$ in a more general form, and thus derive the correspondent form of the virial theorem:

$$u=\phi\dfrac{P}{\rho}\hspace{0.25cm}\Rightarrow\hspace{0.5cm}E_{\mathrm{int}}=-\dfrac{1}{3}\phi E_{\mathrm{gr}}\:,$$

under the assumption of $\phi=const$ along the star structure. Write the expression of the total energy $E_{\mathrm{tot}}$ of your star and find out the $\phi$-dependent condition under which your system remains bound. <br>
You also have all the ingredients to find out the value of this $\phi$ for your simulation <b>at ZAMS</b>: how close is it to be $\phi=3/2$? What do you think can be the reason behind the departure, if there's any?

</li>

<li>
<p style="color:#e66e1e;font-size:110%;"><u><b>Check along the evolution</b></u></p>

Up to now, you worked with a particular profile, i.e. the solution of the stellar structure equations at a fixed timestep. What you can also do is to verify the form of the virial theorem along the entire evolutionary track. Assume that $\phi=3/2$ (you already discussed the goodness of the assumption at ZAMS), and do the check by plotting $E_{\mathrm{int}}$ and $-1/2 E_{\mathrm{gr}}$ at each timestep. At which point(s) of the evolution do you see the worst (or best) agreement? Motivate. <br>
Plot, together with the above two quantities, also $E_{\mathrm{tot}}$; can you tell, by virtue of the virial theorem in hold, what is happening during the evolution of your star?

<i>Hint</i>: You should be able to find the information you need in the columns ```total_gravitational_energy```, ```total_internal_energy``` and ```tot_E``` of your ```history.data``` file. I suggest to use, as x-axis, a quantity that can monotonically trace the evolution of your star, for example its age. And try to highlight the ZAMS as well.

</li>

<li>

<p style="color:#e66e1e;font-size:110%;"><u><b>Thermal equilibrium</b></u></p>

After reaching the ZAMS, your star should start burning hydrogen in its core and thus set into <i>thermal equilibrium</i>. In this situation, the energy balance equation simplifies to a simpler form, in which $\epsilon_{\mathrm{gr}}=0$ due to the star being in stationary state:

<br>
<center>
<div align="center" style="padding: 2px; border: 2px solid #e66e1e; display: inline-block;">
<b>THERMAL EQUILIBRIUM</b>
<br>

$$\dfrac{\partial l}{\partial m}=\epsilon_{\mathrm{nuc}}-\epsilon_{\nu}\hspace{0.5cm}\Leftrightarrow\hspace{0.5cm}L_{\mathrm{surf}}=L_{\mathrm{nuc}}-L_{\nu}$$
</dive>
</center>
<br>

where we just integrated the local quantities $l=l(m)$, $\epsilon_{\mathrm{nuc}}=\epsilon_{\mathrm{nuc}}(m)$ and $\epsilon_{\nu}=\epsilon_{\nu}(m)$ over the star's structure and defined the surface, nuclear and neutrino luminosity as follows

$$L_{\mathrm{surf}}\equiv\int_{0}^M\dfrac{\partial l}{\partial m}dm\:,\hspace{0.25cm}L_{\mathrm{nuc}}\equiv\int_0^M\epsilon_{\mathrm{nuc}}dm\:,\hspace{0.25cm}L_{\nu}\equiv\int_0^M\epsilon_{\nu}dm\:.$$

For the early stages of the evolution, such as PMS and MS, and for the purposes of this lab1, ignoring the neutrino energy losses, i.e. $L_{\nu}=0$, is a good approximation. Go ahead and verify that $L_{\mathrm{surf}}=L_{\mathrm{nuc}}$ along the MS.


<i>Hint</i>: 

You should find the interesting information in the columns ```luminosity``` and ```log_LH``` of your ```history.data``` file, both in $L_{\odot}$ units. Be aware that ```log_LH``` stores the integrated power of a specific nuclear process, i.e. the hydrogen burning, which is the only contribution to your $L_{\mathrm{nuc}}$ during the MS.

</li>
</ol>

## III. The Equation of State: polytropes (4 pts)
We want now to see if we can describe our star in terms of a polytropic equation of state (EoS), i.e. one of the form
<br>
<center>
<div align="center" style="padding: 2px; border: 2px solid #e6ad1e; display: inline-block;">
<b>POLYTROPIC EOS</b>
<br>

$$P=C\:\rho^{1+1/n}\:$$
</dive>
</center>
<br>

where $C$ and $n$ are both constants and $n$ is called "polytropic index". Polytropic stellar models are simplified, but they played an important role in the historical development of stellar structure theory; furthermore, there are a couple of situations in which we can still describe the star's structure with them with good approximation.

<ol type="1">

<li>
<p style="color:#e6ad1e;font-size:110%;"><u><b>From general to polytropic EoS</b></u></p>

Remember the first law of thermodynamics and the definition of specific internal energy $u$ and specific volume $v\equiv 1/\rho$, the change in heat content in a thermodynamic process within stellar interiors is given by

$$dq=du+Pdv=du-\dfrac{P}{\rho^2}d\rho\:.$$

By taking into account a general equation of state and an adiabatic ($dq=0$) process, you should be able to show the following: 

$$u=\phi\dfrac{P}{\rho}\hspace{0.25cm}\Rightarrow\hspace{0.25cm}\dfrac{dP}{P}=\dfrac{\phi+1}{\phi}\dfrac{d\rho}{\rho}\:.$$

Once you showed this, just put $\phi=\mathrm{const}=3/2$ and thus calculate the value of the correspondent polytropic index $n$, by comparing the outcome of your derivation with the polytropic EoS general form. You already discussed the goodness of $\phi=3/2$ assumption, i.e. how close your gas is to be perfect, non relativistic and monoatomic, along the evolutionary track.

</li>

<li>
<p style="color:#e6ad1e;font-size:110%;"><u><b>Polytropes and the PMS</b></u></p>

During the early PMS phase, the star's structure is completely convective: opacity of outer layers is so high, due to the very low temperatures, that radiative energy transport is made inefficient and the convective envelope is sinking so deep in the star that the entire structure experiences convection. 

<ul>
<li>

Convince yourself that all of the above holds for your model <b>during the first stages of the PMS</b>. In your lectures you studied a formal criterion, the <i>Schwarzschild criterion</i>, for stability against convection:
<br>
<center>
<div align="center" style="padding: 2px; border: 2px dashed #e6ad1e; display: inline-block;">
<b>SCHWARZSCHILD CRITERION</b>
<br>

$$\nabla_{\mathrm{rad}}\equiv\dfrac{3}{16\pi a c G}\dfrac{P}{T^4}\dfrac{\kappa l}{m}<\nabla_{\mathrm{ad}}$$
</dive>
</center>
<br>


where $a=7.566\times 10^{-15}\:\mathrm{erg}\:\mathrm{cm}^{-3}\:\mathrm{K}^{-4}$ is the radiation constant, $P=P(m)$, $T=T(m)$, $\kappa=\kappa (m)$ and $l=l(m)$ are the pressure, temperature, opacity and luminosity profiles along the stellar structure; $\nabla_{\mathrm{ad}}$ and $\nabla_{\mathrm{rad}}$ are the adiabatic and radiative temperature gradients. Verify that there's a stage of the evolution in which this criterion holds <i>globally</i> in your star. You might want to produce a plot like one of those present in your saved pngs to support your argument.

</li>

<li>

How close is $\nabla_{\mathrm{ad}}$ to be $\nabla_{\mathrm{ad}}\simeq 0.4$ in this stage? What does this number mean? Motivate why $\nabla_{\mathrm{ad}}$ drops below $0.4$ around the outer layers of your star and why, close to your core, that value is almost correct.
</li>

<li>
How long does your star stay completely convective? I.e., how relevant is this stage of evolution with respect to the total age of your star?
</li>

<i>Hint I:</i> You can select the completely convective model during the PMS by looking at the ```grid_XMsun.png``` files, in particular at the Kippenhahn diagram, i.e. the one showing mass coordinates $m/M_{\odot}$ of interesting zones as a function of the model number. When the light blue region spans the entire mass range, you have convection over all you structure. The mapping from model number to the right ```profileN.data``` should be straightforward from the ```profiles.index``` file.

<i>Hint II:</i> You should be able to find the useful information in the columns ```grada``` (adiabatic temperature gradient) and ```gradr``` (radiative temperature gradient).

</ul>

</li>

</ol>

## IV. The Equation of State: radiation pressure? (3 pts)
In this question you will study the contribution, to the EoS, of the gas of photons, i.e. the radiation pressure contribution $P_{\mathrm{rad}}$. Until now, you discussed the goodness of the ideal gas assumption for your model, and extensively showed its action along the evolution of your system. But does it mean that the photons' contribution is not even there, or not important?

Remember that in general the pressure inside a star is <b>the sum</b> of the gas pressure and radiation pressure:

$$P=P_{\mathrm{gas}}+P_{\mathrm{rad}}=P_{\mathrm{ions}}+P_{\mathrm{e}}+P_{\mathrm{rad}}=\dfrac{\mathcal{R}}{\mu}\rho T+\dfrac{1}{3}a T^4\:$$
$$\mathrm{with}\hspace{0.5cm}\mathcal{R}=8.31447\times 10^{7}\:\mathrm{erg}\:\mathrm{g}^{-1}\:\mathrm{K}^{-1}\:,$$
$$a=7.56578\times 10^{-15}\:\mathrm{erg}\:\mathrm{cm}^{-3}\:\mathrm{K}^{-4}\:,$$

where $P_{\mathrm{e}}$ is the contribution of free electrons, $P_{\mathrm{ions}}$ the one from ions, $\mathcal{R}$ is universal gas constant and $a$ is the radiation constant. Be aware that the fact that we wrote $P_{\mathrm{gas}}=\mathcal{R}/\mu \rho T$ implies that we are considering the gas of electrons to be non-degenerate (see below).

<ol type="1">
<li>
<p style="color:#42a135;font-size:110%;"><u><b>The fraction of radiation</b></u></p>

You will study now the profile concerning the <b>TAMS</b> stage of your simulation. Finding this profile is particularly easy, since it's the last one printed from your simulation run, and you will find it as it is called ```XMsun_at_TAMS_profile.data```, in your top level of the ```MESA_LAB1``` directory. 

<ul>
<li>

Plot the total pressure $P$, the radiation pressure $P_{\mathrm{rad}}$ and the gas pressure $P_{\mathrm{gas}}$ contributions all together for the profile <b>at TAMS</b>. Quantify the impact of the radiation pressure contribution by defining a fraction $\beta$ as follows<br>

$$P_{\mathrm{gas}}=\beta P\hspace{0.5cm}\mathrm{and}\hspace{0.5cm}P_{\mathrm{rad}}=(1-\beta)P\:.$$

Notice that this $\beta$ will vary along your star's structure; comment on the order of magnitude of your $\beta$ and on the regions in which it is higher / lower.

<i>Hint</i>: Look at the columns ```pressure```, ```prad``` and ```pgas```.

</li>

<li>

You may also want to verify the theoretical formulas above, making use of the column ```mu``` for the mean molecular weight per gas particle, ```logT``` for the temperature and ```logRho``` for the density.

</li>

</ul>

</li>

<li>
<p style="color:#42a135;font-size:110%;"><u><b>Some degeneracy degree?</b></u></p>

Let us lastly verify whether neglecting the contribution of degeneracy pressure from electrons, thus treating them as classical particles following $P_e=\mathcal{R}/\mu \rho T$, is a good assumption or not. From statistical mechanics, we know that Pauli exclusion principle forces degenerate electrons to pile up in levels with higher and higher momentum, till the maximum occupied level with the Fermi momentum $p_{\mathrm{F}}$. On the other hand, if the electron gas is classical, the particles are following a Maxwell-Boltzmann like distribution, with a maximum momentum given by $p_{\mathrm{max}}$, see [lecture on Degenerate EOS](https://orlox.github.io/stars_2023_2024/dev/4_eos2/#Polytropes-and-the-Chandrasekhar-mass). More specifically,

$$p_{\mathrm{F}}=h\left(\dfrac{3}{8\pi}n_e\right)^{1/3}\:,\hspace{0.5cm}p_{\mathrm{max}}=\sqrt{2m_eK_{\mathrm{B}}T}\:,$$

with $n_e$ being the number density of free electrons in the stellar gas, $h=6.626\times 10^{-27}\:\mathrm{erg}\:\mathrm{s}$ is the Planck constant and $m_{e}=9.109\times 10^{-28}\:\mathrm{g}$. To the purpose of quantifying the degeneracy degree in our simulation, we can refer to the following ratio

<br>
<center>
<div align="center" style="padding: 2px; border: 2px dotted #42a135; display: inline-block;">
<b>PROXY FOR <br> DEGENERACY DEGREE</b>
<br>

$$\dfrac{p_{\mathrm{F}}}{p_{\mathrm{max}}}$$
<!-- $$\dfrac{\Lambda^3}{\nu}\gtrsim 1\hspace{0.75cm}\mathrm{with}\hspace{0.25cm}\nu\equiv\dfrac{1}{n_e}$$ -->
</dive>
</center>
<br>

<ul>
<li>

See if the above ratio is $\gtrless 1$ for the profile <b>at TAMS</b>, and assess the goodness of the classical gas assumption. In which region do you see the highest degree of degeneracy, if you have some?

<i>Hint</i>: There is no profile column providing the value for $n_e$, you would have to calculate it yourself in a reasonable way. Remember that by definition $n_e=\rho/\mu_{e}m_{u}$, and your gas is mainly made by $H$ and $He$.

</li>
<li>

If you take the cubic power of the ratio $p_{\mathrm{F}}/p_{\mathrm{max}}$, you should obtain a scaling of this sort: $p_{\mathrm{F}}^3/p_{\mathrm{max}}^3\propto n_e/T^{3/2}$. MESA outputs a quantity, the "degeneracy parameter" <u>in the core</u> $\psi$, which can be shown to follow the same scaling, i.e. $\psi=\psi(n_e/T^{3/2})$, and it represents the degree of departure from the Maxwell-Boltzmann distribution. It can be shown (no proof required) that a formal criterion for degeneracy may actually be expressed in terms of $\psi$:

<br>
<div style="display: flex; justify-content: center;">
  <div style="padding: 2px; border: 2px solid #42a135; margin: 5px;">
    <b>NO DEGENERACY</b>
<br>

$$\psi\ll 0$$
  </div>
  <div style="padding: 2px; border: 2px solid #42a135; margin: 5px;">
    <b>PARTIAL DEGENERACY</b>
<br>

$$\psi\gtrsim 0$$
  </div>
  <div style="padding: 2px; border: 2px solid #42a135; margin: 5px;">
    <b>STRONG DEGENERACY</b>
<br>

$$\psi\gg 0$$
  </div>
</div>
<br>
 
Examine MESA outputs and keep the above criterion in mind. What can you conclude about the degree of degeneracy in your track? And why is the value of $\psi$ <u>in the core</u> the relevant one?


<i>Hint</i>: MESA outputs this quantity for the core of your star along the entire evolutionary track, stored in ```center_degeneracy``` column (give a look at your ```grid_Xmsun.png``` too). 

</li>
</ul>


</li>

</ol>

## V. Massive vs Low Mass evolution (2 pts)

Now you'll finally use the output of your simulation 2, namely the second mass $M'=X'\:M\mathrm{\odot}$; the goal is to make you aware of some differences in the evolution of a low mass ($M'\gtrsim 1\:\mathrm{\odot}$) star versus a relatively higher mass ($M'\gtrsim 5\:\mathrm{\odot}$) one. You will study the differences in great detail in the following classes, but there are some key points that can be observed also along the MS.

<ol>
<li>
<p style="color:#479ecc;font-size:110%;"><u><b>Convective or radiative core?</b></u></p>

Consider you models $M$ and $M'$.
<ul>
<li>
Do they experience convection in their core, during the nuclear burning of H? What does it imply, in terms of elements abundances profiles in the core?
</li>
<li>
Does the size of the convective core increase or decrease during the nuclear burning of H? 
</li>
</ul>

<br>

 <i>Hint:</i> 
 you can follow the information stored in ```mass_conv_core``` in your ```history.data``` file. Or, you can also answer qualitatively by looking at the Kippenhahn diagram, and the abundances profiles plot in your ```grid_XMsun.png``` and ```grid_X'Msun.png```. In this context, you can (not mandatory) include screenshots of you pgstar window to prove your point.

</i>

<li>

<p style="color:#479ecc;font-size:110%;"><u><b>Convective or radiative envelope?</b></u></p>

<ul>
<li>

Consider you models $M$ and $M'$. Do they experience convection in their envelope, during the nuclear burning of H? Quantify the different convective envelope masses you are seeing. 
</li>

<li>Remembering the Schwarzschild criterion for stability against convection, can you motivate why you're (not) seeing a convective envelope, if that is the case?
</li>
</ul>

<br>

<i>Hint:</i> 
you can give a rough estimate of the envelope masses by looking at at the Kippenhahn diagram in your ```grid_XMsun.png``` and ```grid_X'Msun.png```. For the motivation on convection to occur in the envelope, I suggest to give a look at one of the other diagrams present in your pgstar window, i.e. the one showing the opacity curve 😁

</li>

<li>
<p style="color:#479ecc;font-size:110%;"><u><b>The surface properties</b></u></p>

Give a look at the HR diagram, i.e. the $(\log T_{\mathrm{eff}}(\mathrm{K}), \:\log L(L_{\odot}))$ plane. Plot your two tracks together in such plane, highlighting the ZAMS. 
<ul>
<li> 

Compare the orders of magnitude for the surface luminosity $\log L(L_{\odot})$ for your two stars and try to explain the difference you're seeing, in terms of the mass-luminosity relation that you saw in your lectures. Is your more massive star of the pair more luminous <b>at ZAMS</b>? By how much?

</li>
<li>

Compare the orders of magnitude for the effective temperature $\log T_{\mathrm{eff}}(\mathrm{K})$ for your two stars. Which star of your pair sets into ZAMS at a higher $T_{\mathrm{eff}}?$ And at TAMS?

</li>
</ul>

</li>

</ol>

## VI. Bonus: Radiative Opacities (➕ pts)

This bonus question is meant for you to gain a better understanding of the ingredients playing a role in computing the <b>radiative opacity</b> $\kappa$ of the stellar matter.  

<ol>
<li>
<p style="color:#db5694;font-size:110%;"><u><b>The total opacity at ZAMS</b></u></p>

Plot the <b>ZAMS</b> profile of the total radiative opacity $\log\kappa$ (see column ```log_opacity```). This is the result of very complicated ingredients from atomic physics and chemistry blended together, but there should be some easily recognizable features.

<ul>
<li>

Remember that the <b>electron scattering</b> opacity $\kappa_{\mathrm{es}}$, in the Thomson classical limit, can be expressed by

$$\kappa_{\mathrm{es}}=0.20(1+X)\:\mathrm{cm}^2\:\mathrm{g}^{-1}\:,$$

where $X\simeq 0.7$ is the hydrogen mass fraction. Where in your star can you see this feature to be the dominant one?

</li>

<li>

<b>Free-free absorption</b> opacity $\kappa_{\mathrm{ff}}$ accounts for the inverse process of the <i>Bremsstrahlung</i>, in which a free electron passes by a charged nucleus and emits radiation due to the experienced acceleration. An approximate calculation was carried on by Kramers, who gave a power-law relation of this sort
 
 $$\kappa_{\mathrm{ff}}\simeq \kappa_0 \rho T^{-7/2}\:\mathrm{cm}^2\:\mathrm{g}^{-1}\:,$$

 in which $\kappa_{0}$ is a constant that depends on the chemical composition. Where in your star can you see a power-law-ish trend being dominant?

</li>

<li>

If I remind you that Hydrogen recombines at $~ 10^4\:\mathrm{K}$, mostly independently on the density $\rho$, can you tell where (and if!) this feature is playing a role?
</li>

</ul>

</li>

<li>
<p style="color:#db5694;font-size:110%;"><u><b>Electron scattering</b></u></p>

Verify that $\kappa_{\mathrm{es}}$ is dominant in the core both at ZAMS and at TAMS, showing that the plasma of completely ionized gas is a good description of the core along your evolutionary track.
</li>

</ol>