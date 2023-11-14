# Instructions

Modules for Experiments in Stellar Astrophysics (MESA) [^Paxton2011] is a state of the art, open-source 1D stellar evolution code. MESA is built to allow users to run experiments in stellar evolution, with a huge variety of possibilities for input physics and customization. You are strongly encouraged to give a look at the [documentation](https://docs.mesastar.org/en/release-r21.12.1/) to discover more about the software. We will specifically use the MESAstar module to evolve a single star.

## Lab intro
In this lab you will learn how to evolve a star with MESA and how to interpret its outputs in terms of the theory of stellar structure and evolution you have seen so far. In particular

- **FIRST HOUR**: see [Stellar evolution models](https://orlox.github.io/stars_2023_2024/dev/). Theoretical overview of the software. The basic numerical scheme used to solve the set of stellar structure and evolution equations; the boundary conditions for the differential equations; the software infrastructure and usage of inlists, output files.

- **SECOND HOUR**: set up your simulation and save the outputs in your local machines / USB memory / personal folder in the system, as you will need to use it at home to post-process the information and write a report. This time at the lab is mainly meant for you to run the simulation while you have someone that can help you (me); if, at the end, you still have some time, you can start answering the questions of the report.  
  NB: you will have to run **two** simulations of two stars with different masses, and save **both** those outputs. Be sure to do that before you leave the session. 


## The report
### General rules
If you still have time during the second hour of the session, you can start going through the list of requests below. You will have to produce a (**graded!**) report about these. Try to answer to *all* questions completely: 

- **Are you asked for a number?**  
  If this number comes from a formula, show the formula introducing the quantities appearing in it, as well as under which physical assumptions that specific formula holds. E.g., if you're computing a gravitational energy $E_{\mathrm{gr}}$, we would like you to write something like:

  ***
  *The estimate for the gravitation potential energy $E_{\mathrm{grav}}$ is:*

  $$E_{\mathrm{gr}}\equiv \int_{0}^{M} -\dfrac{Gm}{r(m)} dm= 3.14\times 10^{7} \:\mathrm{erg},$$

  *where $G$ is the gravitational constant, $M$ is the total star mass and $r=r(m)$ is the Eulerian radial coordinate along the star's structure.*

  ***
 
  If the number comes directly out of your simulation, be sure to explicitly say where you found this information: which column of the output file are you using, and at which stage of the evolution of your system? 

- **Are you asked for a derivation?**  
  We would like to see the math with clear passages.

- **Are you asked for a plot?**   
   You can use whichever visualization tool you want to produce plots. Just be sure to make them readable: fontsize of any label / tick / legend must be the same as the written text. And everything needs to be properly labeled. Number the plots as Fig.(1), Fig.(2) ... Fig.(n) and refer to those in the text, when you describe how such figure illustrates the answer to the question.

### Formalities
- **PAGE LIMIT**  
  Maximum of 12 pages (including figures) with classical font and fontsize ($\geq$ 12pt please). Include your name and student number on the first page of the PDF.

- **SUBMISSION FORMAT**  
   Submit a tar / zip named as ```name_lastname_XMsun_LAB1.zip```, where $X$ is defined as $M=X\:M_{\odot}$ and $M$ is the mass of your assigned star (see below!). Remember to always include your ```inlist_project``` in the submission.

 - 🚨 **ATTENTION**: Reports are *individual*: each student is expected to hand in his/her own report 🚨




### Grades and deadlines
The idea is that you go through *every* question; the final question (*Bonus: Radiative Opacities*) can give you bonus points for the final exam, but if you address all the other requests correctly and completely, you will be able to get the full grade of the report anyway. You will be given approximately 4 weeks to complete the report and send it to us.

- **GRADES** Points for each question are made explicit in the text. The maximum is 16 points / 16. Let us say that you totalize N points / 16: in total, this report will weight N / 4 grades out of your final 20! So if you manage to score full grade in this report, 4 points out of your final 20 are granted. Good luck! 🍀

- ▶️ **DEADLINE**  Report must be completed by 
  12 December, 14:00 CET 

- **TO BE SENT**
  Via email to annachiara.picco@kuleuven.be, with the subject of the email matching the name of the attached zip / tar file, i.e. something like ```name_lastname_XMsun_LAB1.zip```.

## MESA instructions
### The lab computers
MESA (v15140) is already installed in the machines of the room 4.33 (4th floor, Instituut voor Sterrenkunde). You will not be required to install any additional package. However, to be able to complete the simulation runs, you will have to access the IvS system with your personal credentials. At the start of your Master in Astronomy & Astrophysics at KU Leuven, you should all have received those credentials. Some of you that are not part of the Master in Astronomy and Astrophysics and I already asked for an account to be set up for you: you should have received an email with the details. If not, please come talk to me as soon as possible.

To be able to run MESA from a folder of your choice, you need to set the Linux environment variables to tell your terminal where to find the software. To do so, open a terminal with ```ctrl+shift+T``` and type the following:

```bash
# Set the environment variables
module load mesasdk
module load mesa
# Check that everything is correct
echo $MESA_DIR
echo $MESASDK_VERSION
```

### The MESA work folder
In the following, I am going to assume that you are working in a folder called ```MESA_LAB1```; you should adapt the commands to the (path of the) folder you chose to use. More specifically, you are going to work with a copy of the template work directory of the MESAstar module:

```bash
 # Move to the directory of your choice
 cd MESA_LAB1
 # Copy the template work directory from the MESA distribution
 cp -R $MESA_DIR/star/work/* .
```

After running a simulation, this folder will contain the following elements:

- **inlist**  
   Fortran namelist pointing to the specific inlist for the project.
 

 - **inlist_project**  
   Fortran namelist containing all the options for the simulation; these include input physics as well as resolution controls. It is always advisable to give a look at the options and try to understand their meaning, by digging into the parameter libraries in ```$MESA_DIR/star/defaults/*```. These files contain default values for all the options present in your ```inlist_project```, as well as their explanation and reference in literature.

 - **inlist_pgstar** 
   Fortran namelist specific for the pgstar dynamic window. You can give a look at the default parameters for the pgstar inlist by looking through ```$MESA_DIR/star/default/pgstar.defaults```.

 - **LOGS**  
   Folder containing all the output files: evolutionary quantities in ```history.data```, profiles information in ```profileN.data```. Profiles are mapped to model numbers as illustrated in ```profiles.index```. The profile files are printed at regular intervals during the simulation, see the option ```profile_interval = 10``` in your ```inlist_project```.

 - **photos**   
   Folder containing the simulation photos: files named ```xN```, with N being the photo's number, in machine-language. These are also printed at regular intervals during the simulation, see the option ```photo_interval = 10``` in your ```inlist_project```, and contain all the information about models. They are useful to be able to restart the simulation from different points along the track, in case your run is time-consuming and you want to save some time. You should not need to use those in this lab1.

 - **grid_png**  
   Folder containing png snapshots of the pgstar dynamic window: these are called as ```grid_N.png```, where N is the model number along the evolutionary track. These are also printed at regular intervals, see the option ```Grid1_file_interval = 10``` in your ```inlist_project```.

 - **profile_columns.list**  
   List of all the information, about structural properties of a model at fixed time, that are printed in the output files ```profileN.data```, and used in the pgstar dynamic window.

 - **history_columns.list**  
   List of all the information, about evolutionary quantities along the track, that are printed in the output file ```history.data```, and used in the pgstar dynamic window.

### How to run MESA
You will always run MESA from the folder called ```MESA_LAB1```. In such folder, there is a very nicely written ```README.rst``` file with a reminder on how to run / compile (and restart, when needed) the simulation. I'm summarizing here the general instructions for future reference (**but don't run the simulation now!** Just keep these in mind and we'll use them in a bit):
```bash
# Move to the MESA_LAB1 directory
cd MESA_LAB1
# Compile and produce the executable called "star"
./mk
# Run the simulation
./rn
# Restart the simulation from the photo x050
./re x050
```

### Reading MESA output
Just to save you some time: here's a minimal working script in python that reads the output of MESA stored in a ```history.data``` file. There are more efficient ways when the output is large, but for the purpose of this lab you can start from here.
```python
# Import numpy
import numpy as np
# Give the relative path of the file
history = "./LOGS/history.data"
# Save the information in a matrix saving their names too
matrix = np.genfromtxt(history,skip_header=5,names=True)
# Load the columns of interest for an HR diagram
lumi = matrix["luminosity"]
teff = matrix["log_Teff"]
```

## The assigned masses
Due to the number of available computers in the lab, you all will be paired during the session. This means that every student (A) will have a mate (B) to look at the simulations with. Each team (student A + student B) of students will have to produce, **during the session**, a total of two simulations (simulation 1 + simulation 2), and save the outputs for later use (at home). These two simulations will serve the following purposes:

- **Simulation 1**  will evolve a star of initial mass $M$. Student A will have to answer all the questions, aside from **Massive vs Low Mass evolution** and a small part of the question on **Variations of the EoS: Radiation Pressure and Degeneracy**, by taking into account exclusively the outcome of simulation 1. Student B will make use of the outcome of simulation 1 just to answer the aforesaid question.

- **Simulation 2** will evolve a star of initial mass $M'\neq M$. Student B will have to answer all the questions, aside from  **Massive vs Low Mass evolution** and a small part of the question on **Variations of the EoS: Radiation Pressure and Degeneracy**, by taking into account exclusively the outcome of simulation 2. Student A will make use of the outcome of simulation 2 just to answer the aforesaid question.

Please find below the list of pairs of masses, together with the team (student A + student B) number. I'll give you the team number once you're paired in the lab and make sure that no pairs of masses is picked by two different teams.

| Team number | $M\:(M_{\odot})$ | $M'\:(M_{\odot})$ |
|:-----------:|:----------------:|:-----------------:|
|    **1**    |        0.8       |         4.25         |
|    **2**    |        1         |         3         |
|    **3**    |        1.15      |         2.25         |
|    **4**    |         2        |         8.75         |
|    **5**    |        5.5       |         1.2           |
|    **6**    |         6        |         2.15         |
|    **7**    |         7        |        2.25          |
|    **8**    |        7.5       |         1.75         |
|    **9**    |         8        |         0.8         |


[^Paxton2011]:
    The Astrophysical Journal Supplement, Volume 192, Issue 1, article id. 3, 35 pp. (2011).
    https://ui.adsabs.harvard.edu/abs/2011ApJS..192....3P/abstract