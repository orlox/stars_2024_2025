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

makedocs(sitename="Stellar Structure and Evolution",
        pages= ["index.md",
                "Introduction (26/09/23)" => ["Notes" => "1_introduction.md",
                                              "Exercises"=>"1_introduction_problems.md",
                                              "Julia setup"=>"1_introduction_julia.md",
                                              "1_introduction_computational.md"],
                "Equations (03/10/23)" => ["Notes" => "2_equations.md",
                                              "Exercises"=>"2_equations_problems.md",
                                              "2_equations_computational.md"],
                "Energy equation and EOS (10/10/23)" => ["Notes" => "3_eos1.md",
                                              "Exercises"=>"3_eos1_problems.md"],
                "Degenerate EOS (17/10/23)" => ["Notes" => "4_eos2.md",
                                              "Exercises"=>"4_eos2_problems.md"],
                "Radiative energy transport (24/10/23)" => ["Notes" => "5_radiative.md",
                                              "Exercises"=>"5_radiative_problems.md"],
                "Convection (31/10/23)" => ["Notes" => "6_convection.md",
                                              "Exercises"=>"6_convection_problems.md"],
                "Nucleosynthesis (07/11/23)" => ["Notes" => "7_nucleo1.md",
                                              "Exercises"=>"7_nucleo1_problems.md"],
                "LAB1 (14/11/2023)" => ["Stellar evolution models" => "8_SE_codes.md",
                                        "Instructions" => "8_instructions.md",
                                        "Questions"=>"8_questions.md"],
<<<<<<< HEAD
                "Main sequence and beyond (28/11/23)" => ["Notes" => "9_homology.md",
                                              "Exercises"=>"9_homology_problems.md"],
                "LAB2 (12/12/2023)" => ["Instructions" => "11_instructions.md",
                                    "Questions"=>"11_questions.md"],
                ])

deploydocs(
    repo = "github.com/orlox/stars_2023_2024.git",
)
