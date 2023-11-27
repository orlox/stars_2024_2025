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
h = 6.626196e-27
# approximate solar values from https://doi.org/10.5281/zenodo.3568405
ρ = 148.0
X = 0.35
m_u = 1.6605402e-24
μ_e = 2/(1+X)
m_e = 9.1093897e-28
n_e = ρ/(μ_e*m_u)
kb = 1.380658e-16
p_F = (3*h^3*n_e/(8π))^(1/3)

##
function MB_dist(n,m,T,p)
    return n*(4π*p^2)/(2π*m*kb*T)^(3/2)*exp(-p^2/(2m*kb*T))
end

##
pvals = collect(LinRange(0,p_F,100))
deg_dist = (8π/h^3).*pvals.^2

# distribution goes to zero at the Fermi momentum
push!(pvals, p_F)
push!(deg_dist, 0)

pvals2 = collect(LinRange(0,2.5*p_F,300))
dist_MB1e7 = MB_dist.(n_e, m_e, 1e7, pvals2)
dist_MB5e6 = MB_dist.(n_e, m_e, 3e6, pvals2)
dist_MB1e6 = MB_dist.(n_e, m_e, 1e6, pvals2)

# normalize for plotting
dist_MB1e7 = dist_MB1e7./maximum(deg_dist)
dist_MB5e6 = dist_MB5e6./maximum(deg_dist)
dist_MB1e6 = dist_MB1e6./maximum(deg_dist)
deg_dist = deg_dist./maximum(deg_dist)
pvals = pvals./p_F
pvals2 = pvals2./p_F

f = Figure();
ax = Axis(f[1,1], xlabel=L"p/p_\mathrm{F}", ylabel=L"f(p)/(8\pi p^2/h^3)")
lines!(ax, pvals, deg_dist, linestyle=:dash, label=L"Fully degenerate, $\propto p^2$")
lines!(ax, pvals2, dist_MB1e7, label=L"MB, $T=10^7\;[\mathrm{K}]$")
lines!(ax, pvals2, dist_MB5e6, label=L"MB, $T=3\times10^6\;[\mathrm{K}]$")
lines!(ax, pvals2, dist_MB1e6, label=L"MB, $T=10^6\;[\mathrm{K}]$")

axislegend(ax)

ylims!(ax,0,1)
xlims!(ax,0,2.1)

f

save("docs/src/assets/4_eos2/degeneracy.svg", f)
end