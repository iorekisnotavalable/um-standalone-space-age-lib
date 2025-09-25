local prefix = "se-"
	local gr = "-grounded"
--adding SA crafting catagories to the SE biochem
	local biochem_categories_to_add = {
		"chemistry",
		"chemistry-or-cryogenics",
		"organic-or-chemistry"
	}
	
	
	--	machine_map = {["space-manufactory"] = "assembling-machine",["space-assembling-machine"] = "assembling-machine",["biochemical-facility"] = "chemical-plant",}

	--	for into, from in pairs(machine_map) do
	--	  for _, category in pairs(data.raw["assembling-machine"][from].crafting_categories) do
	--		table.insert(data.raw["assembling-machine"]["se-" .. into], category)
	--	  end
	--	end
	
	--this didn't work, my lua sucks, we ae just gonna list them, DEAL WITH IT

--grounded biochem
	local biomachine = data.raw["assembling-machine"][prefix.. "space-biochemical-laboratory" .. gr]
	if biomachine then
		for _, category_name in ipairs(biochem_categories_to_add) do
			table.insert(biomachine.crafting_categories, category_name)
		end
	end
--biochem	
	local biomachinegr = data.raw["assembling-machine"][prefix.. "space-biochemical-laboratory"]
	if biomachinegr then
		for _, category_name in ipairs(biochem_categories_to_add) do
			table.insert(biomachinegr.crafting_categories, category_name)
		end
	end
	
	
-- adding SA crafting catagories to the SE space assember and manufactory
	local manufact_categories_to_add = {
		"basic-crafting",
		"crafting",
		"advanced-crafting",
		"crafting-with-fluid",
		"electronics",
		"electronics-with-fluid",
		"pressing",
		"metallurgy-or-assembling",
		"organic-or-hand-crafting",
		"organic-or-assembling",
		"electronics-or-assembling",
		"cryogenics-or-assembling"
	 --   "crafting-with-fluid-or-metallurgy"
	 -- metallurgy with fluid is SE metals done in casting????
	}
	
--space assembler
	local asmachine = data.raw["assembling-machine"][prefix .. "space-assembling-machine"]
	if asmachine then
		for _, category_name in ipairs(manufact_categories_to_add) do
			table.insert(asmachine.crafting_categories, category_name)
		end
	end
--grounded space assembler
	local asmachinegr = data.raw["assembling-machine"][prefix .. "space-assembling-machine" .. gr]
	if asmachinegr then
		for _, category_name in ipairs(manufact_categories_to_add) do
			table.insert(asmachinegr.crafting_categories, category_name)
		end
	end
-- space manufac
	local mamachine = data.raw["assembling-machine"][prefix .. "space-manufactory"]
	if mamachine then
		for _, category_name in ipairs(manufact_categories_to_add) do
			table.insert(mamachine.crafting_categories, category_name)
		end
	end
	-- space manufac grounded
	local mamachinegr = data.raw["assembling-machine"][prefix .. "space-manufactory" .. gr]
	if mamachinegr then
		for _, category_name in ipairs(manufact_categories_to_add) do
			table.insert(mamachinegr.crafting_categories, category_name)
		end
	end
	-- doing the same exact thging 6 times because I can't do a simple loop, yay.    it works :(


-- add SE recipes listed below to the crafting new sa catagories
	function addRecipeToCategory(recipeName, categoryName)
		if data.raw.recipe[recipeName]["additional_categories"] == nil then
			data.raw.recipe[recipeName]["additional_categories"] = {categoryName}
		else
			table.insert(data.raw.recipe[recipeName]["additional_categories"], categoryName)
		end
	end
--if the foundry mod is on add the SE recipes
	if mods["um-standalone-foundry"] then
		recipesToAddToFoundry =
		{
			"se-molten-iron",
			"se-iron-ingot",
			"se-steel-ingot",
			"se-molten-copper",
			"se-copper-ingot",
			"se-molten-beryllium",
			"se-beryllium-ingot",
			"se-molten-holmium",
			"se-holmium-ingot",
			"se-iridium-blastcake",
			"se-iridium-ingot"
		}

		for _,j in ipairs(recipesToAddToFoundry) do
			addRecipeToCategory(j,"crafting-with-fluid-or-metallurgy")
		end
	end
--if the em mod is on add the se modules
	if mods["um-standalone-electromagnetic-plant"] then
		recipesToAddToEMP =
		{
			"electronic-circuit",
			"electronic-circuit-wood",
			"advanced-circuit",
			"processing-unit",
			"se-processing-unit-holmium",
			"se-empty-data",
			"speed-module",
			"speed-module-2",
			"speed-module-3",
			"speed-module-4",
			"speed-module-5",
			"speed-module-6",
			"speed-module-7",
			"speed-module-8",
			"speed-module-9",
			"productivity-module",
			"productivity-module-2",
			"productivity-module-3",
			"productivity-module-4",
			"productivity-module-5",
			"productivity-module-6",
			"productivity-module-7",
			"productivity-module-8",
			"productivity-module-9",
			"efficiency-module",
			"efficiency-module-2",
			"efficiency-module-3",
			"efficiency-module-4",
			"efficiency-module-5",
			"efficiency-module-6",
			"efficiency-module-7",
			"efficiency-module-8",
			"efficiency-module-9"
		}

		for _,j in pairs(recipesToAddToEMP) do
			addRecipeToCategory(j,"electromagnetics")
		end
		
		table.insert(data.raw["assembling-machine"]["electromagnetic-plant"].crafting_categories, "crafting-or-electromagnetics")
		--adding crafting-or-electromagnetics to the em plant, the mod add it but.... doesn't no clue why
	end
-- if the cryo mod is on give it the chem plants recipes
	if mods["um-standalone-cryogenic-plant"] then
		data.raw["assembling-machine"]["cryogenic-plant"]["crafting_categories"] = data.raw["assembling-machine"]["chemical-plant"]["crafting_categories"]
	end
