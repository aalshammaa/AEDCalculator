### A Pluto.jl notebook ###
# v0.15.1

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

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.16"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[HypertextLiteral]]
git-tree-sha1 = "f6532909bf3d40b308a0f360b6a0e626c0e263a8"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.1"

[[IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "98f59ff3639b3d9485a03a72f3ab35bab9465720"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.0.6"

[[PlutoUI]]
deps = ["Base64", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "4c8a7d080daca18545c56f1cac28710c362478f3"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.16"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
"""

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
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
