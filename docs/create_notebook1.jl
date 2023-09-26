using Literate

function ignore_code_blocks(content)
    content = replace(content, "##\n" => "\n")  # remove code blocks
    #content = replace(content, "###" => "##")  # make level 3 headers level 2
end

Literate.markdown("./src/1_introduction_computational.jl", "./src/", preprocess=ignore_code_blocks)
