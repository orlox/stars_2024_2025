using Documenter

makedocs(sitename="Stellar Structure and Evolution",
        pages= ["index.md",
                "Introduction (26/09/23)" => ["Notes" => "1_introduction.md", "Exercises"=>"1_introduction_problems.md", "Julia setup"=>"1_introduction_julia.md", "1_introduction_computational.md"]])

deploydocs(
    repo = "github.com/orlox/stars_2023_2024.git",
)
