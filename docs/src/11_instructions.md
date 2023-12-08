# Instructions

In this second MESA lab we will cover a variety of examples that illustrate important physical aspects of stellar evolution. Most of these examples are tailor made to run successfully until a meaningful termination condition within a reasonable amount of time. Bear in mind that publication quality runs can take much longer to compute, in particular we make use of models with low spatial and temporal resolution.

## The report
### Formalities
- **PAGE LIMIT** Maximum of 6 pages (including figures) with classical font and fontsize ($\geq$ 12pt please). Include your name and student number on the first page of the PDF.

- **SUBMISSION FORMAT** Submit a tar / zip named as ```name_lastname_LAB2.zip```.

### Grades and deadlines
You will be given 5 weeks to complete the report and send it to us.
- **GRADES** Each part of the lab counts for 4 points. The maximum is 16 points / 16. Let us say that you totalize N points / 16: in total, this report will weight N / 4 grades out of your final 20! So if you manage to score full grade in this report, 4 points out of your final 20 are granted. Good luck! 🍀

- ▶️ **DEADLINE**  Report must be completed by 
   16 January , 14:00 CET
- **TO BE SENT** Via email to annachiara.picco@kuleuven.be, with the subject of the   email matching the name of the attached zip / tar file, i.e. something like ```name_lastname_LAB2.zip```.

## MESA instructions
Just as in the previous session we will be making use of version 15140 of MESA, which is already installed on the lab computers. To be able to run MESA from a folder of your choice, you need to set the Linux environment variables to tell your terminal where to find the software. To do so, open a terminal with ```ctrl+shift+T``` and type the following:

```bash
# Set the environment variables
module load mesasdk
module load mesa
# Check that everything is correct
echo $MESA_DIR
echo $MESASDK_VERSION
```

Beware that the `module load` commands are specific to the setup of the computers at the Institute of Astronomy. If you are running MESA locally on your computer you need to follow the usual instructions to install and run MESA models.

There are also some specific performance tips you can use at the computers of the Institute of Astronomy to improve the runtime of your simulations. These should not be necessary when running things locally on your own machine. Make sure you use all cores available in your system. By running `htop` on your terminal you can see the number of cores available, and then in the terminal where you will run the simulations do
```bash
export OMP_NUM_THREADS=6
```
where `6` needs to be replaced with your number of cores visible in `htop`. The second performance tip is to make use of the local storage on the computers rather than network storage which is much slower. Local storage is contained in `/scratch`, so you can start the lab by moving into that directory:
```bash
cd /scratch
```
MESA also stores files containing information from the equation of state, rates and opacities. By default these will be stored on your home folder which needs to go through the network. To switch these to use `/scratch` you can include the following within the `&star_job` section of any inlist you run (`[...]` stands for other parts within this section, you do not need to copy that):
```fortran
&star_job
  [...]
  eosDT_cache_dir = '/scratch/eosDT_cache'
  kap_cache_dir = '/scratch/kap_cache'
  rates_cache_dir = '/scratch/rates_cache'
  [...]
/
```
Files written to `/scratch` will remain in the local computer, so remember to erase all files you've added in `/scratch` before leaving!

## The assigned masses
Similarly to the first MESA lab, you all will be paired during the session. This means that every student (A) will have a mate (B) to look at the simulations with. Each team (A+B) of students will have to produce, during the session, the proposed simulations, and save the outputs for later use (at home). You have 4 exercises, in which a specific mass of the star, $M\:(M_{\odot})$ is needed.

| Team number | Ex.1 $M_{\mathrm{I}}\:(M_{\odot})$ | Ex.2 $M_{\mathrm{II}}\:(M_{\odot})$ | Ex.3 $M_{\mathrm{III}}\:(M_{\odot})$ | Ex.4 $M_{\mathrm{IV}}\:(M_{\odot})$|
|:-----------:|:----------------:|:-----------------:|:----------------:|:---------:|
|    **1**    |        10       |         20         |  2  |  18
|    **2**    |        10         |       18         |  1.9|  20
|    **3**    |        10      |         19         |   1.8|  19
|    **4**    |        10        |         21         |  1.7|  21
|    **5**    |        10      |         22           |   1.5|  18
|    **6**    |        10        |         19         |   1.6|  20
|    **7**    |        10        |        20          |   1.9|  19
|    **8**    |        10       |         18         |   1.9|  18
|    **9**    |        10        |         21         |  2|  21

Please find above the list of masses that you will have to use in each exercises. I will assign to each team a team number, and you will have to modify the mass per team and per exercise accordingly. I will list down here some controls in your ```inlist_project``` that you might want to tweak each time you run a simulation with the assigned masses:

```fortran
&star_job
  [...]
    filename_for_profile_when_terminate = '20Msun_Z2d-2_profile.data'
  [...]
/

[...]

&controls
  [...]
  !starting specifications
     initial_mass = 20d0 ! in Msun units
  [...]
  !output controls
     log_directory = 'LOGS_20Msun_Z2d-2'
  [...]
/

[...]

&pgstar
  [...]
    Grid1_file_dir = 'grid_png_20Msun_Z2d-2'
  [...]
/
```

