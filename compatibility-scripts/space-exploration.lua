table.insert(data.raw["assembling-machine"]["se-space-biochemical-laboratory"].crafting_categories, "chemistry")
table.insert(data.raw["assembling-machine"]["se-space-biochemical-laboratory"].crafting_categories, "chemistry-or-cryogenics")
table.insert(data.raw["assembling-machine"]["se-space-biochemical-laboratory"].crafting_categories, "organic-or-chemistry")

table.insert(data.raw["assembling-machine"]["se-space-assembling-machine"].crafting_categories, "basic-crafting")
table.insert(data.raw["assembling-machine"]["se-space-assembling-machine"].crafting_categories, "crafting")
table.insert(data.raw["assembling-machine"]["se-space-assembling-machine"].crafting_categories, "advanced-crafting")
table.insert(data.raw["assembling-machine"]["se-space-assembling-machine"].crafting_categories, "crafting-with-fluid")
table.insert(data.raw["assembling-machine"]["se-space-assembling-machine"].crafting_categories, "electronics")
table.insert(data.raw["assembling-machine"]["se-space-assembling-machine"].crafting_categories, "electronics-with-fluid")
table.insert(data.raw["assembling-machine"]["se-space-assembling-machine"].crafting_categories, "pressing")
table.insert(data.raw["assembling-machine"]["se-space-assembling-machine"].crafting_categories, "metallurgy-or-assembling")
table.insert(data.raw["assembling-machine"]["se-space-assembling-machine"].crafting_categories, "organic-or-hand-crafting")
table.insert(data.raw["assembling-machine"]["se-space-assembling-machine"].crafting_categories, "organic-or-assembling")
table.insert(data.raw["assembling-machine"]["se-space-assembling-machine"].crafting_categories, "electronics-or-assembling")
table.insert(data.raw["assembling-machine"]["se-space-assembling-machine"].crafting_categories, "cryogenics-or-assembling")
table.insert(data.raw["assembling-machine"]["se-space-assembling-machine"].crafting_categories, "crafting-with-fluid-or-metallurgy")

table.insert(data.raw["assembling-machine"]["se-space-manufactory"].crafting_categories, "crafting")
table.insert(data.raw["assembling-machine"]["se-space-manufactory"].crafting_categories, "advanced-crafting")
table.insert(data.raw["assembling-machine"]["se-space-manufactory"].crafting_categories, "crafting-with-fluid")
table.insert(data.raw["assembling-machine"]["se-space-manufactory"].crafting_categories, "electronics")
table.insert(data.raw["assembling-machine"]["se-space-manufactory"].crafting_categories, "electronics-with-fluid")
table.insert(data.raw["assembling-machine"]["se-space-manufactory"].crafting_categories, "pressing")
table.insert(data.raw["assembling-machine"]["se-space-manufactory"].crafting_categories, "metallurgy-or-assembling")
table.insert(data.raw["assembling-machine"]["se-space-manufactory"].crafting_categories, "organic-or-hand-crafting")
table.insert(data.raw["assembling-machine"]["se-space-manufactory"].crafting_categories, "organic-or-assembling")
table.insert(data.raw["assembling-machine"]["se-space-manufactory"].crafting_categories, "electronics-or-assembling")
table.insert(data.raw["assembling-machine"]["se-space-manufactory"].crafting_categories, "cryogenics-or-assembling")
table.insert(data.raw["assembling-machine"]["se-space-manufactory"].crafting_categories, "crafting-with-fluid-or-metallurgy")

table.insert(data.raw["assembling-machine"]["electromagnetic-plant"].crafting_categories, "crafting-or-electromagnetics")

function addRecipeToCategory(recipeName, categoryName)
	if data.raw.recipe[recipeName]["additional_categories"] == nil then
		data.raw.recipe[recipeName]["additional_categories"] = {categoryName}
	else
		table.insert(data.raw.recipe[recipeName]["additional_categories"], categoryName)
	end
end

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
end

if mods["um-standalone-cryogenic-plant"] then
	data.raw["assembling-machine"]["cryogenic-plant"]["crafting_categories"] = data.raw["assembling-machine"]["chemical-plant"]["crafting_categories"]
end
