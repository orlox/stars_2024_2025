using Documenter
using Literate

function ignore_code_blocks(content)
    content = replace(content, "##\n" => "\n")  # remove code blocks
    #content = replace(content, "###" => "##")  # make level 3 headers level 2
end

Literate.markdown("./docs/src/1_introduction_computational.jl", "./docs/src/", preprocess=ignore_code_blocks)
Literate.markdown("./docs/src/2_equations_computational.jl", "./docs/src/", preprocess=ignore_code_blocks)

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
                ])

deploydocs(
    repo = "github.com/orlox/stars_2023_2024.git",
)
