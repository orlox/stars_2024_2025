# Wrapped in begin/end to run without contaminating global scope in make.jl
using CairoMakie, LaTeXStrings, MathTeXEngine, Colors
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

dwdz(z,w,y,n) = y
dydz(z,w,y,n) = -w^n-2*y/z

function RK_step(z,w,y,n,Δz)
    k₁ = Δz*dwdz(z,w,y,n)
    l₁ = Δz*dydz(z,w,y,n)

    k₂ = Δz*dwdz(z+Δz/2,w+k₁/2,y+l₁/2,n)
    l₂ = Δz*dydz(z+Δz/2,w+k₁/2,y+l₁/2,n)

    k₃ = Δz*dwdz(z+Δz/2,w+k₂/2,y+l₂/2,n)
    l₃ = Δz*dydz(z+Δz/2,w+k₂/2,y+l₂/2,n)

    k₄ = Δz*dwdz(z+Δz,w+k₃,y+l₃,n)
    l₄ = Δz*dydz(z+Δz,w+k₃,y+l₃,n)

    return (
        w+k₁/6+k₂/3+k₃/3+k₄/6,
        y+l₁/6+l₂/3+l₃/3+l₄/6,
        )
end

w_smallz(z,n) = 1 - 1/6*z^2 + n/120*z^4 -n*(8*n-5)/1520*z^6
y_smallz(z,n) = - 1/3*z + n/30*z^3 -3*n*(8*n-5)/760*z^5

#setup grid in z
Δz = 1e-4
n = 1.5
nsteps = 200_000
zvals = LinRange(Δz,Δz*nsteps,nsteps)

#initialize first value of w and y using series approximation
wvals = zeros(nsteps);yvals = zeros(nsteps)
wvals[1] = w_smallz(Δz, n)
yvals[1] = y_smallz(Δz, n)

#Perform the Runge-Kutta integration, we use try as
#the equation does not work for fractional n when
#w becomes negative
try
    for i in 2:nsteps
        next_values = RK_step(zvals[i-1], wvals[i-1], yvals[i-1], n, Δz)
        if next_values[1]<0
            throw(ErrorException("reached negative value"))
        end
        wvals[i] = next_values[1]
        yvals[i] = next_values[2]
    end
catch
end

# make the plot
f = Figure();
ax = Axis(f[1,1], xlabel=L"z", ylabel=L"w(z)")
lines!(zvals[wvals.>0],wvals[wvals.>0], color="teal")

# repeat for n=3
n = 3
nsteps = 200_000
zvals = LinRange(Δz,Δz*nsteps,nsteps)

#initialize first value of w and y using series approximation
wvals = zeros(nsteps);yvals = zeros(nsteps)
wvals[1] = w_smallz(Δz, n)
yvals[1] = y_smallz(Δz, n)

#Perform the Runge-Kutta integration, we use try as
#the equation does not work for fractional n when
#w becomes negative
try
    for i in 2:nsteps
        next_values = RK_step(zvals[i-1], wvals[i-1], yvals[i-1], n, Δz)
        if next_values[1]<0
            throw(ErrorException("reached negative value"))
        end
        wvals[i] = next_values[1]
        yvals[i] = next_values[2]
    end
catch
end
lines!(zvals[wvals.>0],wvals[wvals.>0], color="red2")

text!(ax, 2.0,0.25, text=L"n=1.5", fontsize=50, rotation=-0.7pi/2, color="teal")
text!(ax, 4.0,0.25, text=L"n=3", fontsize=50, rotation=-0.4pi/2, color="red2")

text!(ax, 2.3,0.95, text=L"n=1.5", color="teal", fontsize=40)
text!(ax, 2.3,0.85, text=L"z_n = 3.654,\; (-z^2 \mathrm{d}w/\mathrm{d}z)_{z=z_n}=2.174", color="teal", fontsize=40)
text!(ax, 2.3,0.7, text=L"n=3", color="red2", fontsize=40)
text!(ax, 2.3,0.6, text=L"z_n = 6.897,\; (-z^2 \mathrm{d}w/\mathrm{d}z)_{z=z_n}=2.018", color="red2", fontsize=40)

ylims!(ax,0.0,1.05)
xlims!(ax,0.0,8)

f

save("docs/src/assets/4_eos2/polytrope.svg", f)

end