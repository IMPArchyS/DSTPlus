all_clients_require_mod = true

PrefabFiles = {
	"obispear",
	"obiblade",
	"obiaxe"
}

local str = GLOBAL.STRINGS
local tuning = GLOBAL.TUNING
local tech = GLOBAL.TECH
local ingredient = GLOBAL.Ingredient

-- alternative recipes for already existing items
str.NAMES.TENTACLESPIKE = "Tentacle Spike"
str.CHARACTERS.GENERIC.DESCRIBE.TENTACLESPIKE = "Why fight evil tentacles, if you can make your own spike."
str.RECIPE_DESC.TENTACLESPIKE = "Spiked tail from a tentacle."

str.NAMES.LOG = "Log"
str.CHARACTERS.GENERIC.DESCRIBE.LOG = "Sticks and some form of glue, why not."
str.RECIPE_DESC.LOG = "Glue some sticks with magic."

str.NAMES.TWIGS = "Twigs"
str.CHARACTERS.GENERIC.DESCRIBE.TWIGS = "Cut down logs."
str.RECIPE_DESC.TWIGS = "Used magic to split logs."

str.NAMES.FLINT = "Flint"
str.CHARACTERS.GENERIC.DESCRIBE.FLINT = "Broke down some rocks."
str.RECIPE_DESC.FLINT = "Rocks made sharp."

str.NAMES.MOONROCKNUGGET = "Moon Rock"
str.CHARACTERS.GENERIC.DESCRIBE.MOONROCKNUGGET = "Broke down some Moon rocks."
str.RECIPE_DESC.MOONROCKNUGGET = "Sharp celestial rocks."

str.NAMES.ROTTENEGG = "Rotten Eggs"
str.CHARACTERS.GENERIC.DESCRIBE.ROTTENEGG = "Who wants to eat this?"
str.RECIPE_DESC.ROTTENEGG = "Why would you make these?"

str.NAMES.POOP = "Poop"
str.CHARACTERS.GENERIC.DESCRIBE.POOP = "This doesn't make sense."
str.RECIPE_DESC.POOP = "You can fertilize your crops."

-- NEW METEOR RECIPES
str.NAMES.OBISPEAR = "Meteor Spear"
str.CHARACTERS.GENERIC.DESCRIBE.OBISPEAR = "It smells like stardust."
str.RECIPE_DESC.OBISPEAR = "A spear combined with stardust."

str.NAMES.OBIAXE = "Meteor Axe"
str.CHARACTERS.GENERIC.DESCRIBE.OBIAXE = "With the power of stardust no tree is safe."
str.RECIPE_DESC.OBIAXE = "An axe made of stardust."

str.NAMES.OBIBLADE = "Meteor Blade"
str.CHARACTERS.GENERIC.DESCRIBE.OBIBLADE = "Fear my stardust blade creatures!"
str.RECIPE_DESC.OBIBLADE = "A blade made from stardust."


-- RECIPES
local enableAltRecipes = GetModConfigData("AltRecipes") or "true"

if enableAltRecipes == "true" then
    AddRecipe2("tentaclespike",
	{
		ingredient("livinglog", 1),
		ingredient("monstermeat", 2),
		ingredient("boneshard", 2)
	},
	tech.SCIENCE_TWO, nil, {"WEAPONS"})

	AddRecipe2("turf_road",
	{
		ingredient("turf_rocky", 10),
		ingredient("log", 10)
	},
	tech.SCIENCE_TWO, {numtogive = 10}, {"DECOR"})

	AddRecipe2("log",
	{
		ingredient("twigs", 4),
		ingredient("nightmarefuel", 2)
	},
	tech.SCIENCE_ONE, {numtogive = 8}, {"REFINE"})

	AddRecipe2("twigs",
	{
		ingredient("log", 1),
		ingredient("nightmarefuel", 1)
	},
	tech.SCIENCE_TWO, {numtogive = 4}, {"REFINE"})

	AddRecipe2("flint",
	{
		ingredient("rocks", 2)
	},
	tech.SCIENCE_ONE, {numtogive = 4}, {"REFINE"})

	AddRecipe2("sewing_kit", 
	{
		ingredient("log", 2),
		ingredient("silk", 4),
		ingredient("stinger", 6)
	},
	tech.SCIENCE_TWO, nil, {"CLOTHING", "TOOLS"})

	AddRecipe2("wall_moonrock_item",
	{
		ingredient("moonrockcrater", 2)
	},
	tech.SCIENCE_TWO, {numtogive = 12}, {"STRUCTURES", "DECOR"})

	AddRecipe2("moonrocknugget",
	{
		ingredient("nightmarefuel", 2),
		ingredient("moonglass", 2),
		ingredient("rocks", 2)
	},
	tech.SCIENCE_ONE, {numtogive = 4}, {"REFINE"})

	AddRecipe2("rottenegg",
	{
		ingredient("bird_egg", 1),
		ingredient("nitre", 1)
	},
	tech.SCIENCE_TWO, nil, {"REFINE"})

	AddRecipe2("poop",
	{
		ingredient("nightmarefuel", 1),
		ingredient("rottenegg", 1)
	},
	tech.SCIENCE_TWO, {numtogive = 2}, {"REFINE"})
end

-- TUNINGS
local enableAltTunings = GetModConfigData("AltTunings") or "true"

if enableAltTunings == "true" then
	-- QoL for moonglass axe, can cut more trees
	tuning.MOONGLASSAXE.CONSUMPTION =  0.5
end

-- CUSTOM METEOR TOOLS
local enableNewTools = GetModConfigData("MeteorTools") or "true"

if enableNewTools == "true" then
	AddRecipe2("obispear",
	{
		ingredient("spear", 1),
		ingredient("redgem", 4),
		ingredient("moonglass", 4),
	},
	tech.SCIENCE_TWO, { atlas = "images/inventoryimages/obispear.xml", image = "obispear.tex"}, {"WEAPONS"})

	AddRecipe2("obiaxe",
	{
		ingredient("axe", 1),
		ingredient("redgem", 3),
		ingredient("moonglass", 3),
	},
	tech.SCIENCE_TWO, {atlas = "images/inventoryimages/obiaxe.xml", image = "obiaxe.tex"}, {"TOOLS"})

	AddRecipe2("obiblade",
	{
		ingredient("tentaclespike", 1),
		ingredient("redgem", 6),
		ingredient("moonglass", 4),
	},
	tech.SCIENCE_TWO, {atlas = "images/inventoryimages/obiblade.xml", image = "obiblade.tex"}, {"WEAPONS"})
end

-- togglable rabbit AI - true - old rabbit ai, false - new rabbit ai
local enableOldRabbitAi = GetModConfigData("rabbitAI") or "true"

if enableOldRabbitAi == "true" then
    AddBrainPostInit("rabbitbrain", function(brain)
        local bt = brain.bt

        if bt and bt.root and bt.root.children then
            local newChildren = {}
            local removedFirstRunAway = false

            for i, child in ipairs(bt.root.children) do
                local isRunAway = (child.__name == "RunAway" or (child.name and child.name == "RunAway") or tostring(child):find("RunAway"))

                if isRunAway and not removedFirstRunAway then
                    removedFirstRunAway = true
                else
                    table.insert(newChildren, child)
                end
            end

            bt.root.children = newChildren

            for i, child in ipairs(bt.root.children) do
                child.parent = bt.root
            end
        end
    end)
end

-- TOGGLEABLE spoilage for most foods, some foods still spoil to get rot
local disableSpoilage = GetModConfigData("Spoilage") or "true"

if disableSpoilage == "true" then
    -- Disable perishable component 
    local foodsNoSpoilage = {
		"butter",
        "honey",
		"lightbulb",
		"tallbirdegg_cooked",
		"trunk_summer",
		"trunk_winter",
		"trunk_cooked",
		"butterflywings",
		"cactus_flower",
		"cactus_meat",
		"cactus_meat_cooked",
		"bird_egg",
		"bird_egg_cooked",
		"goatmilk",
		"cave_banana",
		"cave_banana_cooked",
		"berries",
		"berries_cooked",
		"carrot",
		"carrot_cooked",
		"corn",
		"corn_cooked",
		"pumpkin",
		"pumpkin_cooked",
		"eggplant",
		"eggplant_cooked",
		"durian",
		"durian_cooked",
		"pomegranate",
		"pomegranate_cooked",
		"dragonfruit",
		"dragonfruit_cooked",
		"berries_juicy",
		"berries_juicy_cooked",
		"fig",
		"fig_cooked",
		"watermelon",
		"watermelon_cooked",
		"pepper",
		"pepper_cooked",
		"garlic",
		"garlic_cooked",
		"onion",
		"onion_cooked",
		"asparagus",
		"asparagus_cooked",
		"tomato",
		"tomato_cooked",
		"kelp",
		"kelp_cooked",
		"royal_jelly",
		"potato",
		"potato_cooked",
		-- seeds
		"seeds",
		"seeds_cooked",
		"carrot_seeds",
		"corn_seeds",
		"pumpkin_seeds",
		"eggplant_seeds",
		"durian_seeds",
		"pomegranate_seeds",
		"dragonfruit_seeds",
		"fig_seeds",
		"watermelon_seeds",
		"pepper_seeds",
		"garlic_seeds",
		"onion_seeds",
		"tomato_seeds",
		"potato_seeds",

		-- meats
		"meat",
		"cookedmeat",
		"meat_dried",
		"monstermeat",
		"cookedmonstermeat",
		"monstermeat_dried",
		"smallmeat",
		"cookedsmallmeat",
		"smallmeat_dried",
		"drumstick",
		"drumstick_cooked",
		"batwing",
		"batwing_cooked",
		"plantmeat",
		"plantmeat_cooked",
		"fishmeat_small",
		"fishmeat_small_cooked",
		"fishmeat",
		"fishmeat_cooked",
		"humanmeat",
		"humanmeat_cooked",
		"humanmeat_dried",
		"barnacle",
		"barnacle_cooked",
		"batnose",
		"batnose_cooked",
		"froglegs",
		"froglegs_cooked",
    }

    for _, food in ipairs(foodsNoSpoilage) do
        AddPrefabPostInit(food, function(inst)
            if inst.components.perishable then
				inst:RemoveComponent("perishable")
				inst:AddTag("icebox_valid")
            end
        end)
    end

	-- local foodsInfiniteSpoilage = {
	-- }
	--
	-- for _, food in ipairs(foodsInfiniteSpoilage) do
    --     AddPrefabPostInit(food, function(inst)
    --         if inst.components.perishable then
    --             inst.components.perishable.StartPerishing = function() end
    --             inst.components.perishable:SetPerishTime(999999999)
	-- 			-- inst.components.perishable.onperishreplacement = "spoiled_food"
    --         end
    --     end)
    -- end

	-- Override dryer component to handle items without perishable component
	AddComponentPostInit("dryer", function(self)
		local original_StartDrying = self.StartDrying
		local original_Harvest = self.Harvest
		local original_DropItem = self.DropItem

		self.StartDrying = function(self, item)
			if not item then
				return
			end

			if not item.components.perishable then
				item:AddComponent("perishable")
				item.components.perishable:SetPerishTime(nil)
				item._temp_perishable = true -- Mark as temporary
			end

			return original_StartDrying(self, item)
		end

		self.Harvest = function(self, harvester)
			local result = original_Harvest(self, harvester)

			if self.dryingitem and self.dryingitem._temp_perishable then
				self.dryingitem:RemoveComponent("perishable")
				self.dryingitem._temp_perishable = nil
			end

			return result
		end

		self.DropItem = function(self)
			if self.dryingitem and self.dryingitem._temp_perishable then
				self.dryingitem:RemoveComponent("perishable")
				self.dryingitem._temp_perishable = nil
			end

			return original_DropItem(self)
		end
	end)
end