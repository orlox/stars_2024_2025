using Documenter
using Literate

function ignore_code_blocks(content)
    content = replace(content, "##\n" => "\n")  # remove code blocks
    #content = replace(content, "###" => "##")  # make level 3 headers level 2
end

Literate.markdown("./docs/src/1_introduction_computational.jl", "./docs/src/", preprocess=ignore_code_blocks)
Literate.markdown("./docs/src/2_equations_computational.jl", "./docs/src/", preprocess=ignore_code_blocks)
include("./src/assets/4_eos2/MB_versus_degenerate.jl")
include("./src/assets/4_eos2/polytrope_plot.jl")
include("./src/assets/7_nucleo1/gamow.jl")

makedocs(sitename="Stellar Structure and Evolution",
        pages= ["index.md",
                "Introduction (23/09/24)" => ["Notes" => "1_introduction.md",
                                              "Exercises"=>"1_introduction_problems.md",
                                              "Julia setup"=>"1_introduction_julia.md",
                                              "1_introduction_computational.md"],
                "Equations (01/10/24)" => ["Notes" => "2_equations.md",
                                              "Exercises"=>"2_equations_problems.md",
                                              "2_equations_computational.md"],
                "Energy equation and EOS (08/10/24)" => ["Notes" => "3_eos1.md",
                                              "Exercises"=>"3_eos1_problems.md"],
                "Degenerate EOS (15/10/24)" => ["Notes" => "4_eos2.md",
						"Exercises"=>"4_eos2_problems.md"],
                "Radiative energy transport (22/10/24)" => ["Notes" => "5_radiative.md",
                                              "Exercises"=>"5_radiative_problems.md"],
                "Convection (29/10/24)" => ["Notes" => "6_convection.md",
                                              "Exercises"=>"6_convection_problems.md"],
                "LAB1 (05/11/2024)" => ["Stellar evolution models" => "8_SE_codes.md",
                                       "Instructions" => "8_instructions.md",
                                       "Questions"=>"8_questions.md"],
                "Nucleosynthesis (02/11/24)" => ["Notes" => "7_nucleo1.md",
                                              "Exercises"=>"7_nucleo1_problems.md"],
                "Main sequence homology (19/11/24)" => ["Notes" => "9_homology.md",
                                              "Exercises"=>"9_homology_problems.md"],
                "Main sequence and beyond (26/11/24)" => ["Notes" => "10_stellar_evolution.md",
                                              "Exercises"=>"10_stellar_evolution_problems.md"],
                "LAB2 (12/12/2023)" => ["Instructions" => "11_instructions.md",
                                    "Questions"=>"11_questions.md"],
                ])

deploydocs(
    repo = "github.com/orlox/stars_2024_2025.git",
)
