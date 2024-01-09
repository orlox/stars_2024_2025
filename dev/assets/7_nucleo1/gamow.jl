# Wrapped in begin/end to run without contaminating global scope in make.jl
using CairoMakie, LaTeXStrings, MathTeXEngine
begin
basic_theme = Theme(fonts=(regular=texfont(:text), bold=texfont(:bold),
                        italic=texfont(:italic), bold_italic=texfont(:bolditalic)),
                    fontsize=30, size=(1000, 750), linewidth=7,
                    Axis=(xlabelsize=40, ylabelsize=40, titlesize=40, xgridvisible=false, ygridvisible=false,
                        spinewidth=2.5, xminorticksvisible=true, yminorticksvisible=true, xtickalign=1, ytickalign=1,
                        xminortickalign=1, yminortickalign=1, xticksize=14, xtickwidth=2.5, yticksize=14,
                        ytickwidth=2.5, xminorticksize=7, xminortickwidth=2.5, yminorticksize=7, yminortickwidth=2.5,
                        xticklabelsize=35, yticklabelsize=35, xticksmirrored=true, yticksmirrored=true),
                    Legend=(patchsize=(70, 10), framevisible=false, patchlabelgap=20, rowgap=10))
set_theme!(basic_theme)

##

function exp_factor(E_div_kT,b_sqrt_kT)
    return exp(-b_sqrt_kT/sqrt(E_div_kT)-E_div_kT)
end

Evals = LinRange(0,100,1000)

f = Figure();
ax = Axis(f[1,1], ylabel=L"\exp\left(-b E^{-1/2}-E/(k_\mathrm{B}T)\right)/\max", xlabel=L"E/(k_\mathrm{B}T)", xticks=[0,10,20,30,40,50,60,70])
lines!(ax, Evals, exp_factor.(Evals, 23)./maximum(exp_factor.(Evals, 23)), label=L"b/\sqrt{k_\mathrm{B}T}=23")
lines!(ax, Evals, exp_factor.(Evals, 60)./maximum(exp_factor.(Evals, 60)), label=L"b/\sqrt{k_\mathrm{B}T}=60")
lines!(ax, Evals, exp_factor.(Evals, 420)./maximum(exp_factor.(Evals, 420)), label=L"b/\sqrt{k_\mathrm{B}T}=420")

axislegend(ax)

#ylims!(ax,0,1)
xlims!(ax,0,62)

f

save("docs/src/assets/7_nucleo1/gamow.svg", f)
end