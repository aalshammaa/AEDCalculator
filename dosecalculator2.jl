### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 45e5fd2f-8e66-44f3-8069-385824176872
begin
	using PlutoUI
	TableOfContents(title = "📚 Table of Contents", indent=true, depth=3, aside=true)
end

# ╔═╡ 89ad4dce-a175-4ed9-9181-aeb90c84ae99
md"""
# Calculators
"""

# ╔═╡ fd194432-e70e-4cdc-9555-9093329eb3fd
md"""
## Parameters
"""

# ╔═╡ 3605302d-daa0-42d8-a166-7403708978a0
md"""
## Blood Level Change Calculator 
"""

# ╔═╡ a2806b36-4abc-404f-a5b3-b58e7e01292a
md"""
Dose:
$(@bind dose Scrubbable(50:50:3000, default = 1000)) mg
"""

# ╔═╡ 7bba1e4f-b95f-48f2-ac5c-69c8ea3e620d
md"""
## Dose Calculator
"""

# ╔═╡ 4e9cb762-6450-44d1-9bd1-a0a0e1a27cd9
md"""
Current level:
$(@bind currentlev Scrubbable(0:5:300, default = 0)) units | 
Target level:
$(@bind targetlev Scrubbable(5:5:300, default = 75)) units
"""

# ╔═╡ ec217258-a14a-48cf-ae40-2ccb7e7253e9
md"""
# Appendix
"""

# ╔═╡ de86d31a-1f1d-4b0a-8a5d-24bdbee1a328
md"""
## Function definitions
"""

# ╔═╡ f0bcb470-b34b-11eb-3f96-4307b141b787
begin
	calculatedose(currentlevel, targetlevel, vd, weight) = (targetlevel- currentlevel) * vd * weight
	
	ΔC(dose, vd, weight) = dose / (vd*weight)
end

# ╔═╡ 8b6d576b-e285-4e9c-a523-4d1c827e982c
md"""
## Volume of Distribution for various AEDs
"""

# ╔═╡ c896203b-7549-4549-8696-41483d4e5a80
Vds = [	"0.6" => "Keppra",
		"0.2" => "VPA"]

# ╔═╡ 2c3db660-633b-4ea0-8195-e7e0c9e09533
md"""
Weight:
$(@bind weight Scrubbable(10:5:300, default = 70)) kg | 
Vd:
$(@bind Vd Select(Vds))
"""

# ╔═╡ 678dd758-1c5c-4d35-aa0e-3702f0a1b561
md"""
Vd = $(Vd)
"""

# ╔═╡ 2e1097ba-9754-4407-9aaf-f13dae3467eb
let
	vd = parse(Float64, Vd)
	md"""
	The approximate blood level will increase by:
	**$(round(ΔC(dose, vd, weight), digits = 1))** units
	"""
end
	

# ╔═╡ 69b0f361-886a-4e68-a425-855bc38ffadc
let
	vd = parse(Float64, Vd)
	md"""
	The approximate dose based on desired levels is:
	**$(round(calculatedose(currentlev, targetlev, vd, weight), digits = 1))** mg
	"""
end

# ╔═╡ Cell order:
# ╟─89ad4dce-a175-4ed9-9181-aeb90c84ae99
# ╟─fd194432-e70e-4cdc-9555-9093329eb3fd
# ╟─2c3db660-633b-4ea0-8195-e7e0c9e09533
# ╟─678dd758-1c5c-4d35-aa0e-3702f0a1b561
# ╟─3605302d-daa0-42d8-a166-7403708978a0
# ╟─a2806b36-4abc-404f-a5b3-b58e7e01292a
# ╠═2e1097ba-9754-4407-9aaf-f13dae3467eb
# ╟─7bba1e4f-b95f-48f2-ac5c-69c8ea3e620d
# ╟─4e9cb762-6450-44d1-9bd1-a0a0e1a27cd9
# ╟─69b0f361-886a-4e68-a425-855bc38ffadc
# ╟─ec217258-a14a-48cf-ae40-2ccb7e7253e9
# ╠═45e5fd2f-8e66-44f3-8069-385824176872
# ╟─de86d31a-1f1d-4b0a-8a5d-24bdbee1a328
# ╠═f0bcb470-b34b-11eb-3f96-4307b141b787
# ╟─8b6d576b-e285-4e9c-a523-4d1c827e982c
# ╠═c896203b-7549-4549-8696-41483d4e5a80
