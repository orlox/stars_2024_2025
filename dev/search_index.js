var documenterSearchIndex = {"docs":
[{"location":"1_introduction_problems/#Exercises","page":"Exercises","title":"Exercises","text":"","category":"section"},{"location":"1_introduction_problems/#List-of-exercises","page":"Exercises","title":"List of exercises","text":"","category":"section"},{"location":"1_introduction_problems/#:-Timescales-of-stellar-evolution","page":"Exercises","title":"1: Timescales of stellar evolution","text":"","category":"section"},{"location":"1_introduction_problems/","page":"Exercises","title":"Exercises","text":"There are three main timescales in which stars evolve. These are the dynamical, thermal and nuclear timescales. Even without knowing the equations of stellar structure and evolution we can do some estimates on the value of these quantities. Compute these without a calculator! We only care about the order of magnitude of these timescales, which given all the approximations done is all we can do. For solar properties, use the following for the mass, radius and luminosity:","category":"page"},{"location":"1_introduction_problems/","page":"Exercises","title":"Exercises","text":"R_odotsim 7times 10^10mathrmcmquad M_odot sim 2times 10^33mathrmgquad L_odot sim 4times 10^33mathrmergs^-1","category":"page"},{"location":"1_introduction_problems/","page":"Exercises","title":"Exercises","text":"Thermal timescale: One of the main early hypothesis to explain the energy source of the Sun was that it originated from its slow contraction into its own gravitational potential. In such a case, a rough estimate of the energy the Sun would have radiated through its life is given by the negative of the gravitational potential energy E_mathrmg:\nE_mathrmg sim displaystyle -fracGM_odot^2R_odot\nAssuming that the luminosity of the Sun has always been its current one, L_odot, compute the age of the Sun under the assumption that it is only powered by contraction.\nDynamical timescale: For most of their lives stars are very close to hydrostatic equilibrium, carefully balancing their gravities against the support of a pressure gradient. Whenever these two forces are misbalanced, the star will evolve in what is known as the dynamical timescale. Estimate this timescale by computing the time it would take for the surface of the sun to free-fall all the way to its center if all forces opposing gravity would be removed. For simplicity assume that the gravitational acceleration is constant and equal to its present one.\nNuclear timescale: As we now know, most stars are powered by nuclear reactions. Masses of isotopes are normally given in terms of the atomic mass unit m_mathrmu=1661times 10^-24mathrmg, defined as 112 of the mass of a carbon-12 atom. The mass of a hydrogen atom is m_mathrmH=1007825m_mathrmu and that of a helium atom is m_mathrmHe=4002602 m_mathrmu, such that if four hydrogen atoms are fused into a helium atom there is a mass deficit leading to a release of energy (4m_mathrmH-m_mathrmHe)c^2sim 4times 10^-5mathrmerg. With this information, estimate the lifetime of the Sun as a core-hydrogen burning star. For simplicity, assume the Sun has a constant luminosity and is entirely composed of hydrogen, 10% of which is burned into Helium during core-hydrogen burning.","category":"page"},{"location":"1_introduction_problems/#Solutions","page":"Exercises","title":"Solutions","text":"","category":"section"},{"location":"1_introduction_problems/#:-Timescales-of-stellar-evolution-2","page":"Exercises","title":"1: Timescales of stellar evolution","text":"","category":"section"},{"location":"1_introduction_problems/","page":"Exercises","title":"Exercises","text":"asdasd","category":"page"},{"location":"1_introduction_julia/#Julia-setup","page":"Julia setup","title":"Julia setup","text":"","category":"section"},{"location":"1_introduction_julia/","page":"Julia setup","title":"Julia setup","text":"This class will include computational examples that are programmed in the julia programming language. Julia is a JIT (just-in-time) language which allows to write very fast code (very close to the performance of compiled languages like C and Fortran), while still having the simplicity of an interpreted language like python. Each of the examples included in this website can be downloaded as jupyter notebooks. The instructions below explain how to run these notebooks both in Linux and Windows systems.","category":"page"},{"location":"1_introduction_julia/#Linux","page":"Julia setup","title":"Linux","text":"","category":"section"},{"location":"1_introduction_julia/#Download-Julia","page":"Julia setup","title":"Download Julia","text":"","category":"section"},{"location":"1_introduction_julia/","page":"Julia setup","title":"Julia setup","text":"Get the version of julia that matches your system from the downloads page. Below instructions assume that:","category":"page"},{"location":"1_introduction_julia/","page":"Julia setup","title":"Julia setup","text":"The version you downloaded is julia-1.9.3-linux-x86_64.tar.gz\nIt was downloaded to your home folder, which should be something like /home/USERNAME.","category":"page"},{"location":"1_introduction_julia/","page":"Julia setup","title":"Julia setup","text":"You will need to adapt the commands below if that is not the case.","category":"page"},{"location":"1_introduction_julia/","page":"Julia setup","title":"Julia setup","text":"In a terminal, uncompress the file that has been downloaded by running the following commands:","category":"page"},{"location":"1_introduction_julia/","page":"Julia setup","title":"Julia setup","text":"# Move to the home directory\ncd ~\n# Uncompress the .tar.gz\ntar zxvf julia-1.8.2-linux-x86_64.tar.gz","category":"page"},{"location":"1_introduction_julia/","page":"Julia setup","title":"Julia setup","text":"This will create a folder called julia-1.9.2 in /home/USERNAME. You can find your executable in /home/USERNAME/julia-1.9.2/bin/julia.","category":"page"},{"location":"1_introduction_julia/#Setup-Julia","page":"Julia setup","title":"Setup Julia","text":"","category":"section"},{"location":"1_introduction_julia/","page":"Julia setup","title":"Julia setup","text":"Julia can be started by running the executable, however using the full path to it is cumbersome. We can instead create an alias that will let us run the executable faster. This can be done by editing (or creating if it does not exist) the .bashrc file, which containts a set of commands that are run at the start of each terminal session. To edit the .bashrc file, I am going to use the nano text editor, but you can use your favorite text editor.","category":"page"},{"location":"1_introduction_julia/","page":"Julia setup","title":"Julia setup","text":"# Open the .bashrc file\nnano ~/.bashrc","category":"page"},{"location":"1_introduction_julia/","page":"Julia setup","title":"Julia setup","text":"Copy and paste the following line at the bottom of the file:","category":"page"},{"location":"1_introduction_julia/","page":"Julia setup","title":"Julia setup","text":"alias julia=/home/USERNAME/julia-1.9.2/bin/julia","category":"page"},{"location":"1_introduction_julia/","page":"Julia setup","title":"Julia setup","text":"To save changes and exit from nano, you'll have to press ctrl+X , then Y to accept to save the modified buffer and then enter. Now, everytime you'll open a shell, you'll be able to call Julia by simply typing in a terminal","category":"page"},{"location":"1_introduction_julia/","page":"Julia setup","title":"Julia setup","text":"#Open Julia\njulia","category":"page"},{"location":"1_introduction_julia/","page":"Julia setup","title":"Julia setup","text":"Try it and see the greeting message 😁","category":"page"},{"location":"#Overview","page":"Overview","title":"Overview","text":"","category":"section"},{"location":"","page":"Overview","title":"Overview","text":"Welcome to the 2023 rendition of the course \"Stellar Structure and Evolution\" at the institute of astronomy of KU Leuven. This website will contain notes from classes, exercises with included solutions, and examples of computational problems. Below you can find links to the different sections of this website that are available at the moment.","category":"page"},{"location":"","page":"Overview","title":"Overview","text":"Pages = [\"1_introduction.md\"]\nDepth = 1","category":"page"},{"location":"1_introduction_computational/#Constructing-an-HR-diagram","page":"Constructing an HR diagram","title":"Constructing an HR diagram","text":"","category":"section"},{"location":"1_introduction_computational/","page":"Constructing an HR diagram","title":"Constructing an HR diagram","text":"To run this lab locally you will need three additional files, {download}solar_spectrum.dat<./solar_spectrum.dat>, {download}gaia_100pc_par_over_err_100.csv<gaia_100pc_par_over_err_100.csv> and {download}passband.dat<passband.dat>.","category":"page"},{"location":"1_introduction_computational/","page":"Constructing an HR diagram","title":"Constructing an HR diagram","text":"The radiation coming out of a star can be approximated to first order using black body radiation. In this case the intensity is described by Planck's law,","category":"page"},{"location":"1_introduction_computational/","page":"Constructing an HR diagram","title":"Constructing an HR diagram","text":"B_lambda(lambdaT) = frac2h c^2lambda^5frac1expleft(frachclambda k_mathrmBTright)-1","category":"page"},{"location":"1_introduction_computational/","page":"Constructing an HR diagram","title":"Constructing an HR diagram","text":"which describes the energy flux per unit area and unit solid angle. This function peaks at a value of lambda_mathrmmax=hc(4965 k_mathrmBT). We can use this to normalize the distribution such that its peak value is 1, which is useful for visualization. Below we define both B_lambda and its normalized version.","category":"page"},{"location":"1_introduction_computational/","page":"Constructing an HR diagram","title":"Constructing an HR diagram","text":"h = 6.6261e-27      # Planck's constant, cm^2 g s^-1\nc = 2.99792458e10   # speed of light cm s^-1\nk_B = 1.3807e-16    # Boltzmann constant erg K-1\nσ = 2*π^5*k_B^4/(15*h^3*c^2) # Stefan-Boltzmann constant\nfunction B_λ(λ,T) #λ in nm, T in Kelvin\n    λ_cm = λ*1e-7\n    return 2*h*c^2/λ_cm^5*(1/(exp(h*c/(λ_cm*k_B*T))-1))\nend;\nfunction normalized_B_λ(λ,T) #λ in nm, T in Kelvin\n    peak_λ = h*c/(4.965*k_B*T)*1e7 #in nm\n    return B_λ(λ,T)/B_λ(peak_λ,T)\nend;","category":"page"},{"location":"1_introduction/#Introduction","page":"Notes","title":"Introduction","text":"","category":"section"},{"location":"1_introduction/","page":"Notes","title":"Notes","text":"hello","category":"page"}]
}