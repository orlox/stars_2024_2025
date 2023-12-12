# Questions
## Preliminary instructions
Usage of MESA has been covered on the first lab, so in this instance we will start right away with the computation of simulations. Detailed instructions on how to setup your simulations and what each simulation covers are described further down below.
Download the input files from here [input_files_LAB2](assets/lab2_input.tar.xz). You can then create a folder for your work from a terminal and uncompress the input files there:

```bash
# Create a new directory to run the lab
mkdir MESA_LAB2
# Move to the directory of your choice
cd MESA_LAB2
# Copy downloaded input files (you need to correct the path here)
cp PATH_TO_INPUT_FILES/lab2_input.tar.xz .
# Decompress the downloaded file
tar -xf lab2_input.tar.xz
```

After uncompressing the input file, you will have four folders corresponding to each part of the lab. Within each of this folder there is a template for that part. We strongly recommend not modifying this template folder. Instead, copy the template for each simulation you run, for example you could copy and run the first template by doing (do not do this yet though, read through the instructions for the first part down below first):

```bash
cd part1_convergence
cp -r part1_template first_run
cd first_run
# compile MESA
./clean && ./mk
# run MESA
./rn
```

Where the exact name you give to the copied folder is your choice. To edit your inlists, from a work directory you can run (replacing gedit with a different editor if you prefer):

```bash
gedit inlist_project
```

For all parts of this lab, whenever you need to use the same template to run more than one simulation, you can adjust the options `filename_for_profile_when_terminate`, `log_directory` and `Grid1_file_dir` with unique names to identify your simulation.

🚨 **ATTENTION** 🚨  
In the following, I am going to assume that you are in team number $N$, and your mass for the specific exercise considered is $M=X_{\mathrm{I}}\:M_{\odot}$ in exercise $\mathrm{I}$, $M=X_\mathrm{II}\:M_{\odot}$ in exercise $\mathrm{III}$, $M=X_\mathrm{III}\:M_{\odot}$ in exercise $\mathrm{III}$ and $M=X_\mathrm{IV}\:M_{\odot}$ in exercise $\mathrm{IV}$.

## I. Convergence testing (4 points)
Whenever we perform numerical simulations of continuous phenomena, we need to discretize both time and space. Although in the limit of infinite spatial and temporal resolution (and computers with infinite precision) we would expect our discrete model to match the continuous one, in practice we need to verify if the resolution used is appropriate for our work. This goes beyond stellar evolution simulations, and is a best practice for all types of numerical calculations that rely on discretization.

In the first part of this lab we will compute the main sequence evolution of a $M=X_{\mathrm{I}}\:M_\odot$ star of metallicity Z=0.02 from ZAMS to TAMS, and evaluate the resulting mass of the helium core (contained in the output 'he_core_mass' of your history file, but also listed as `He_core` in the terminal output). We want to verify if our choice of resolution gives us a converged result by increasing it and checking by how much our results changed.

A few notes on the inlist that is used in the template, to model stars from ZAMS, the following option is set in the `star_job` section of `inlist_project`:
```fortran
&star_job
   [...]
   create_pre_main_sequence_model = .false.
   [...]
/
```
With this option MESA will make use of pre-computed ZAMS models to initiate the simulation, saving you a bit of time by avoiding the calculation of the pre main-sequence. Mesa has a large amount of options to compute spatial and temporal resolution, but also provides two convenient options to perform a global scaling of them. These are contained in the `controls` section of your `inlist_project`:
```fortran
&controls
   [...]
    mesh_delta_coeff= 2d0
    time_delta_coeff= 2d0
   [...]
/
```
The first of these options regulates the size of the grid, while the second regulates the size of the timesteps. The default value of these is one, and by setting both of these to two we will use bigger cells and take longer timesteps (thus, relaxing the resolution). Run this simulation a total of 4 times, with the values:

- `mesh_delta_coeff=2d0`, `time_delta_coeff=2d0`
- `mesh_delta_coeff=1d0`, `time_delta_coeff=1d0`
- `mesh_delta_coeff=0.5d0`, `time_delta_coeff=0.5d0`
- `mesh_delta_coeff=0.25d0`, `time_delta_coeff=0.25d0`

This will represent a factor 8 in time and spatial resolution between the most and the least resolved simulation. With these simulations, answer the following questions for your report:

- Does the resolution of your simulations behave as expected? Indicate the number of steps each simulation took, and see the number of zones by checking the `num_zones` column in your history file (you can take the value of the very last timestep).
- If for a particular science case I would need to know the value of the helium core mass to a precision better than 1%, what choice of resolution option would you suggest? Of course we expect the highest resolution to be the most precise, but we want to balance simulation cost and precision. You can illustrate this by plotting the value of `he_core_mass` against the logarithm of the number of steps.
  
⏰ Time for the simulations: ~ 10mins in total ⏰

## II. Pop III versus Pop I stars (4 points)

The first stars formed right after the big bang are expected to be devoid of heavy elements, including carbon, nitrogen and oxygen. As we saw, these elements play an important role in nuclear burning for massive stars. The objective of this exercise is to study how such a star undergoes core hydrogen burning. This first generation of stars is referred to as Pop III stars, while the current generation to which the Sun belongs is Pop I (Pop II representing an intermediate generation). For the purpose of this lab we will model both a Z=0 and a Z=0.02 star with a mass of $M=X_{\mathrm{II}}\:M_\odot$. In this particular case we want to include the pre main-sequence stage in order to see precisely how the star initiates core hydrogen burning, so we have in the `star_job` section of `inlist_project`:
```fortran
&star_job
   [...]
   create_pre_main_sequence_model = .true.
   [...]
/
```
For the sake of speed, we will also use the most relaxed resolution choice from the previous problem. 
```fortran
&controls
   [...]
    mesh_delta_coeff= 2d0
    time_delta_coeff= 2d0
   [...]
/
```
This is done solely for the sake of quickly computing simulations, after seeing the results from the previous part you should be aware of the risks of unresolved models. Right now we ignore a potential lack of converged simulations, as our target is to illustrate different physical processes rather than provide very precise simulations.

The provided template comes ready to compute the evolution of a $Z=0.02$ star. To run the zero metallicity star, look up the options `Zbase` and `initial_z` and set them to zero. With these simulations answer the following questions:

- What hydrogen burning process is dominant in the $Z=0$ star? Make a plot for each star showing the contribution of the pp, cno and triple alpha burning as a function of time and discuss. *Hint*: Massive stars are expected to produce most of their energy through the CNO cycle, so how can a massive star without CNO at the beginning of its evolution undergo the CNO cycle?
- Check the radii of both stars at the TAMS. Is there a significant difference between them? What do you think is the main source of this difference?
  
⏰ Time for the simulations: ~ 2mins in total ⏰

## III. White dwarf formation (4 points)

For this problem we will model the evolution of an intermediate mass star ($M=X_{\mathrm{III}}M_\odot$ in particular) until the formation of a compact remnant. You only need to run the provided template once as is! This simulation will take a while to complete so you can start running right away and then proceed to read the rest of this description. The star will go through multiple evolutionary phases which you can discuss with your classmates by checking the on-screen plots as the simulation runs. In particular for this run in order to save a bit of time by starting from ZAMS we also have
```fortran
&star_job
   [...]
   create_pre_main_sequence_model = .false.
   [...]
/
```
A very important physical ingredient we include here are stellar winds, which are activated with the following options in the `controls` section of `inlist_project`:
```fortran
&controls
   [...]
   cool_wind_full_on_T = 9.99d9 ! setting this to a high value ensures we always the cool wind prescriptions
   hot_wind_full_on_T = 1d10
   cool_wind_RGB_scheme = 'Reimers'
   cool_wind_AGB_scheme = 'Blocker'
   RGB_to_AGB_wind_switch = 1d-4
   Reimers_scaling_factor = 1d0
   Blocker_scaling_factor = 3d0 ! very strong AGB wind to go through TP-AGB quickly
   [...]
/
```
where we make use of the mass loss rate of [^Reimers1975] for the RGB phase and that of [^Bloecker1995] for the AGB phase (with an artificial boost of a factor of 3, meant to accelerate the calculation).

The terminating condition of this simulation is set as a minimum limit on luminosity, which will be reached as the star forms a white dwarf and cools:
```fortran
&controls
   [...]
   log_L_lower_limit = -1
   [...]
/
```
This option is given in units of the solar luminosity, which implies the simulation will finish once the star has a luminosity below $0.1L_\odot$.

You might also notice a large set of options that look like this:
```fortran
 ! relax tolerances for equations
    use_gold_tolerances = .false.
    use_gold2_tolerances = .false.
    iter_for_resid_tol2 = 10
    iter_for_resid_tol3 = 10
    tol_residual_norm3 = 1d-4
    tol_max_residual3 = 1d-2
    solver_iters_timestep_limit = 15
    convergence_ignore_equL_residuals = .true.
    limit_for_rel_error_in_energy_conservation = 1d99
    hard_limit_for_rel_error_in_energy_conservation = 1d99
    corr_coeff_limit = 1d-1
    max_abs_rel_run_E_err = -1d0
    ignore_too_large_correction = .true.
    scale_max_correction = 0.1d0
    ignore_min_corr_coeff_for_scale_max_correction = .true.
    ignore_species_in_max_correction = .true.
    use_superad_reduction = .true. ! this is to help evolution from post-AGB to white dwarf
```
these are purely numerical adjustments for the calculations in order to optimize the runtime of the simulation for the purpose of a lab. In reality you want to avoid relaxing the tolerance to which solutions are computed!

Using your simulation, answer the following questions:
- Through what evolutionary phases does this star go? What type of white dwarf is formed at the end? Accompany your discussion with an HR diagram, highlighting precisely some key evolutionary points and referring to them in your discussion. Take particular care in describing how helium is ignited.
- Although no nuclear burning takes place in the outermost regions of the star, you will find the surface abundances of some heavy elements change significantly before any significant mass loss happens. What is the cause of this change?

⏰ Time for the simulation: ~ 20mins in total ⏰

## IV. Iron-core collapse (4 points)

For the last part of this lab, we will perform a simulation of an $M=X_{\mathrm{IV}}\:M_\odot$ star that undergoes iron-core collapse. Just as with the previous part, this simulation is already setup for you to run it, so you can start it up and then proceed to read the rest of this description.

Barring small variations of numerical aspects to make the run faster for the lab, there are three important details in `inlist_project` that relate to the physics of the problem. The first one is the following in the `star_job` section of `inlist_project`:
```fortran
&star_job
   [...]
   change_v_flag = .true.
   new_v_flag = .true.
   [...]
/
```
Setting both of these to true will add the velocity as another solver variable inside MESA. By default MESA solves the hydrostatic version of the equations, so any velocity it registers just corresponds to changes in radii along stages of almost perfect hydrostatic balance. However, if we want to capture iron-core collapse, we need to include hydrodynamics in our simulation, which is precisely what the above option does.

The next important ingredient is our termination condition for the simulation. In this case we set a threshold on the velocity at which any point within the iron-core is infalling,
```fortran
&controls
   [...]
   fe_core_infall_limit = 5d7 ! infall velocity at cm/s
   [...]
/
```
which corresponds to a velocity of $500\;\mathrm{km\;s^{-1}}$. Finally, we include a different choice of mass loss rates that is more appropriate for massive star evolution:
```fortran
&controls
   [...]
   cool_wind_full_on_T = 0.8d4
   hot_wind_full_on_T = 1.2d4
   cool_wind_RGB_scheme = 'Dutch'
   cool_wind_AGB_scheme = 'Dutch'
   hot_wind_scheme = 'Dutch'
   Dutch_wind_lowT_scheme = 'de Jager'
   Dutch_scaling_factor = 1.0  
   [...]
/
```
The `Dutch` prescription from MESA combines multiple prescriptions for mass loss from mostly Dutch authors, including those of [^deJager1988], [^NugisLamers2000] and [^Vink2001]. A very important thing to keep in mind regarding mass loss rates in stellar evolution calculations is that they are based off prescriptions provided by other authors who have either determined them empirically or through dynamical modelling of stellar atmospheres, which is beyond the capabilities of MESA.

With your simulation completed, answer the following questions for your report:
- How does the onset of helium burning differ from the 2 Msun star modelled in the previous part?
- Determine the time between the end of each burning phase (H, He, C, Ne, O, Si, core collapse). Compare it to the main-sequence lifetime.
- At the end of your simulation, check the iron core-mass (fe_core_mass in your history file). Is there a relevance to that value?
- From the profile at the end of your simulation plot the helium abundance across the entire star. Can you explain what is happening at the core?

⏰ Time for the simulations: ~ 25mins in total ⏰

[^Reimers1975]:
    Memoires of the Societe Royale des Sciences de Liege, Volume 8, pp. 369-382 (1975).
    https://ui.adsabs.harvard.edu/abs/1975MSRSL...8..369R/abstract

[^Bloecker1995]:
    Astronomy and Astrophysics, Volume 297, pp. 727 (1995).
    https://ui.adsabs.harvard.edu/abs/1995A%26A...297..727B/abstract

[^deJager1988]:
    Astronomy and Astrophysics, Suppl. Ser., Vol. 72, p. 259-289 (1988).
    https://ui.adsabs.harvard.edu/abs/1988A%26AS...72..259D/abstract

[^NugisLamers2000]:
    Astronomy and Astrophysics, Vol. 360, p.227-244 (2000).
    https://ui.adsabs.harvard.edu/abs/2000A&A...360..227N

[^Vink2001]:
    Astronomy and Astrophysics, v.369, p.574-588 (2001).
    https://ui.adsabs.harvard.edu/abs/2001A%26A...369..574V/abstract

