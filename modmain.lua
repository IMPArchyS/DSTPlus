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
	tuning.SPIDERDEN_SPIDERS = {3, 7, 12}
	tuning.SPIDERDEN_WARRIORS = {0, 0, 0}
	tuning.SPIDERDEN_EMERGENCY_WARRIORS = {0, 0, 0}
	tuning.SPIDERDEN_SPIDER_TYPE = {"spider", "spider", "spider"}
	tuning.SEWINGKIT_USES = 10
	tuning.PANFLUTE_USES = 20
	tuning.SPIDERDEN_CREEP_RADIUS_BEDAZZLED = 0
	tuning.SPIDERDEN_CREEP_RADIUS = {0, 0, 0 }
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
		-- preped foods
		"sweettea",
		"sweettea_spice_chili",
		"sweettea_spice_garlic",
		"sweettea_spice_salt",
		"sweettea_spice_sugar",
		"wetgoop",
		"wetgoop_spice_chili",
		"wetgoop_spice_garlic",
		"wetgoop_spice_salt",
		"wetgoop_spice_sugar",
		"frozenbananadaiquiri",
		"frozenbananadaiquiri_spice_chili",
		"frozenbananadaiquiri_spice_garlic",
		"frozenbananadaiquiri_spice_salt",
		"frozenbananadaiquiri_spice_sugar",
		"icecream",
		"icecream_spice_chili",
		"icecream_spice_garlic",
		"icecream_spice_salt",
		"icecream_spice_sugar",
		"jellybean",
		"jellybean_spice_chili",
		"jellybean_spice_garlic",
		"jellybean_spice_salt",
		"jellybean_spice_sugar",
		"shroomcake",
		"shroomcake_spice_chili",
		"shroomcake_spice_garlic",
		"shroomcake_spice_salt",
		"shroomcake_spice_sugar",
		"taffy",
		"taffy_spice_chili",
		"taffy_spice_garlic",
		"taffy_spice_salt",
		"taffy_spice_sugar",
		"voltgoatjelly",
		"voltgoatjelly_spice_chili",
		"voltgoatjelly_spice_garlic",
		"voltgoatjelly_spice_salt",
		"voltgoatjelly_spice_sugar",
		"baconeggs",
		"baconeggs_spice_chili",
		"baconeggs_spice_garlic",
		"baconeggs_spice_salt",
		"baconeggs_spice_sugar",
		"barnaclepita",
		"barnaclepita_spice_chili",
		"barnaclepita_spice_garlic",
		"barnaclepita_spice_salt",
		"barnaclepita_spice_sugar",
		"barnaclestuffedfishhead",
		"barnaclestuffedfishhead_spice_chili",
		"barnaclestuffedfishhead_spice_garlic",
		"barnaclestuffedfishhead_spice_salt",
		"barnaclestuffedfishhead_spice_sugar",
		"barnaclesushi",
		"barnaclesushi_spice_chili",
		"barnaclesushi_spice_garlic",
		"barnaclesushi_spice_salt",
		"barnaclesushi_spice_sugar",
		"barnaclinguine",
		"barnaclinguine_spice_chili",
		"barnaclinguine_spice_garlic",
		"barnaclinguine_spice_salt",
		"barnaclinguine_spice_sugar",
		"bonesoup",
		"bonesoup_spice_chili",
		"bonesoup_spice_garlic",
		"bonesoup_spice_salt",
		"bonesoup_spice_sugar",
		"bonestew",
		"bonestew_spice_chili",
		"bonestew_spice_garlic",
		"bonestew_spice_salt",
		"bonestew_spice_sugar",
		"bunnystew",
		"bunnystew_spice_chili",
		"bunnystew_spice_garlic",
		"bunnystew_spice_salt",
		"bunnystew_spice_sugar",
		"californiaroll",
		"californiaroll_spice_chili",
		"californiaroll_spice_garlic",
		"californiaroll_spice_salt",
		"californiaroll_spice_sugar",
		"ceviche",
		"ceviche_spice_chili",
		"ceviche_spice_garlic",
		"ceviche_spice_salt",
		"ceviche_spice_sugar",
		"figkabab",
		"figkabab_spice_chili",
		"figkabab_spice_garlic",
		"figkabab_spice_salt",
		"figkabab_spice_sugar",
		"fishsticks",
		"fishsticks_spice_chili",
		"fishsticks_spice_garlic",
		"fishsticks_spice_salt",
		"fishsticks_spice_sugar",
		"fishtacos",
		"fishtacos_spice_chili",
		"fishtacos_spice_garlic",
		"fishtacos_spice_salt",
		"fishtacos_spice_sugar",
		"frogfishbowl",
		"frogfishbowl_spice_chili",
		"frogfishbowl_spice_garlic",
		"frogfishbowl_spice_salt",
		"frogfishbowl_spice_sugar",
		"frogglebunwich",
		"frogglebunwich_spice_chili",
		"frogglebunwich_spice_garlic",
		"frogglebunwich_spice_salt",
		"frogglebunwich_spice_sugar",
		"frognewton",
		"frognewton_spice_chili",
		"frognewton_spice_garlic",
		"frognewton_spice_salt",
		"frognewton_spice_sugar",
		"guacamole",
		"guacamole_spice_chili",
		"guacamole_spice_garlic",
		"guacamole_spice_salt",
		"guacamole_spice_sugar",
		"honeyham",
		"honeyham_spice_chili",
		"honeyham_spice_garlic",
		"honeyham_spice_salt",
		"honeyham_spice_sugar",
		"honeynuggets",
		"honeynuggets_spice_chili",
		"honeynuggets_spice_garlic",
		"honeynuggets_spice_salt",
		"honeynuggets_spice_sugar",
		"hotchili",
		"hotchili_spice_chili",
		"hotchili_spice_garlic",
		"hotchili_spice_salt",
		"hotchili_spice_sugar",
		"justeggs",
		"justeggs_spice_chili",
		"justeggs_spice_garlic",
		"justeggs_spice_salt",
		"justeggs_spice_sugar",
		"kabobs",
		"kabobs_spice_chili",
		"kabobs_spice_garlic",
		"kabobs_spice_salt",
		"kabobs_spice_sugar",
		"koalefig_trunk",
		"koalefig_trunk_spice_chili",
		"koalefig_trunk_spice_garlic",
		"koalefig_trunk_spice_salt",
		"koalefig_trunk_spice_sugar",
		"leafloaf",
		"leafloaf_spice_chili",
		"leafloaf_spice_garlic",
		"leafloaf_spice_salt",
		"leafloaf_spice_sugar",
		"leafymeatburger",
		"leafymeatburger_spice_chili",
		"leafymeatburger_spice_garlic",
		"leafymeatburger_spice_salt",
		"leafymeatburger_spice_sugar",
		"leafymeatsouffle",
		"leafymeatsouffle_spice_chili",
		"leafymeatsouffle_spice_garlic",
		"leafymeatsouffle_spice_salt",
		"leafymeatsouffle_spice_sugar",
		"lobsterbisque",
		"lobsterbisque_spice_chili",
		"lobsterbisque_spice_garlic",
		"lobsterbisque_spice_salt",
		"lobsterbisque_spice_sugar",
		"lobsterdinner",
		"lobsterdinner_spice_chili",
		"lobsterdinner_spice_garlic",
		"lobsterdinner_spice_salt",
		"lobsterdinner_spice_sugar",
		"meatballs",
		"meatballs_spice_chili",
		"meatballs_spice_garlic",
		"meatballs_spice_salt",
		"meatballs_spice_sugar",
		"meatysalad",
		"meatysalad_spice_chili",
		"meatysalad_spice_garlic",
		"meatysalad_spice_salt",
		"meatysalad_spice_sugar",
		"monsterlasagna",
		"monsterlasagna_spice_chili",
		"monsterlasagna_spice_garlic",
		"monsterlasagna_spice_salt",
		"monsterlasagna_spice_sugar",
		"monstertartare",
		"monstertartare_spice_chili",
		"monstertartare_spice_garlic",
		"monstertartare_spice_salt",
		"monstertartare_spice_sugar",
		"moqueca",
		"moqueca_spice_chili",
		"moqueca_spice_garlic",
		"moqueca_spice_salt",
		"moqueca_spice_sugar",
		"pepperpopper",
		"pepperpopper_spice_chili",
		"pepperpopper_spice_garlic",
		"pepperpopper_spice_salt",
		"pepperpopper_spice_sugar",
		"perogies",
		"perogies_spice_chili",
		"perogies_spice_garlic",
		"perogies_spice_salt",
		"perogies_spice_sugar",
		"seafoodgumbo",
		"seafoodgumbo_spice_chili",
		"seafoodgumbo_spice_garlic",
		"seafoodgumbo_spice_salt",
		"seafoodgumbo_spice_sugar",
		"surfnturf",
		"surfnturf_spice_chili",
		"surfnturf_spice_garlic",
		"surfnturf_spice_salt",
		"surfnturf_spice_sugar",
		"talleggs",
		"talleggs_spice_chili",
		"talleggs_spice_garlic",
		"talleggs_spice_salt",
		"talleggs_spice_sugar",
		"turkeydinner",
		"turkeydinner_spice_chili",
		"turkeydinner_spice_garlic",
		"turkeydinner_spice_salt",
		"turkeydinner_spice_sugar",
		"unagi",
		"unagi_spice_chili",
		"unagi_spice_garlic",
		"unagi_spice_salt",
		"unagi_spice_sugar",
		"veggieomlet",
		"veggieomlet_spice_chili",
		"veggieomlet_spice_garlic",
		"veggieomlet_spice_salt",
		"veggieomlet_spice_sugar",
		"beefalofeed",
		"beefalofeed_spice_chili",
		"beefalofeed_spice_garlic",
		"beefalofeed_spice_salt",
		"beefalofeed_spice_sugar",
		"beefalotreat",
		"beefalotreat_spice_chili",
		"beefalotreat_spice_garlic",
		"beefalotreat_spice_salt",
		"beefalotreat_spice_sugar",
		"asparagussoup",
		"asparagussoup_spice_chili",
		"asparagussoup_spice_garlic",
		"asparagussoup_spice_salt",
		"asparagussoup_spice_sugar",
		"bananajuice",
		"bananajuice_spice_chili",
		"bananajuice_spice_garlic",
		"bananajuice_spice_salt",
		"bananajuice_spice_sugar",
		"bananapop",
		"bananapop_spice_chili",
		"bananapop_spice_garlic",
		"bananapop_spice_salt",
		"bananapop_spice_sugar",
		"butterflymuffin",
		"butterflymuffin_spice_chili",
		"butterflymuffin_spice_garlic",
		"butterflymuffin_spice_salt",
		"butterflymuffin_spice_sugar",
		"dragonchilisalad",
		"dragonchilisalad_spice_chili",
		"dragonchilisalad_spice_garlic",
		"dragonchilisalad_spice_salt",
		"dragonchilisalad_spice_sugar",
		"dragonpie",
		"dragonpie_spice_chili",
		"dragonpie_spice_garlic",
		"dragonpie_spice_salt",
		"dragonpie_spice_sugar",
		"figatoni",
		"figatoni_spice_chili",
		"figatoni_spice_garlic",
		"figatoni_spice_salt",
		"figatoni_spice_sugar",
		"flowersalad",
		"flowersalad_spice_chili",
		"flowersalad_spice_garlic",
		"flowersalad_spice_salt",
		"flowersalad_spice_sugar",
		"freshfruitcrepes",
		"freshfruitcrepes_spice_chili",
		"freshfruitcrepes_spice_garlic",
		"freshfruitcrepes_spice_salt",
		"freshfruitcrepes_spice_sugar",
		"fruitmedley",
		"fruitmedley_spice_chili",
		"fruitmedley_spice_garlic",
		"fruitmedley_spice_salt",
		"fruitmedley_spice_sugar",
		"gazpacho",
		"gazpacho_spice_chili",
		"gazpacho_spice_garlic",
		"gazpacho_spice_salt",
		"gazpacho_spice_sugar",
		"glowberrymousse",
		"glowberrymousse_spice_chili",
		"glowberrymousse_spice_garlic",
		"glowberrymousse_spice_salt",
		"glowberrymousse_spice_sugar",
		"jammypreserves",
		"jammypreserves_spice_chili",
		"jammypreserves_spice_garlic",
		"jammypreserves_spice_salt",
		"jammypreserves_spice_sugar",
		"mandrakesoup",
		"mandrakesoup_spice_chili",
		"mandrakesoup_spice_garlic",
		"mandrakesoup_spice_salt",
		"mandrakesoup_spice_sugar",
		"mashedpotatoes",
		"mashedpotatoes_spice_chili",
		"mashedpotatoes_spice_garlic",
		"mashedpotatoes_spice_salt",
		"mashedpotatoes_spice_sugar",
		"nightmarepie",
		"nightmarepie_spice_chili",
		"nightmarepie_spice_garlic",
		"nightmarepie_spice_salt",
		"nightmarepie_spice_sugar",
		"potatosouffle",
		"potatosouffle_spice_chili",
		"potatosouffle_spice_garlic",
		"potatosouffle_spice_salt",
		"potatosouffle_spice_sugar",
		"potatotornado",
		"potatotornado_spice_chili",
		"potatotornado_spice_garlic",
		"potatotornado_spice_salt",
		"potatotornado_spice_sugar",
		"powcake",
		"powcake_spice_chili",
		"powcake_spice_garlic",
		"powcake_spice_salt",
		"powcake_spice_sugar",
		"pumpkincookie",
		"pumpkincookie_spice_chili",
		"pumpkincookie_spice_garlic",
		"pumpkincookie_spice_salt",
		"pumpkincookie_spice_sugar",
		"ratatouille",
		"ratatouille_spice_chili",
		"ratatouille_spice_garlic",
		"ratatouille_spice_salt",
		"ratatouille_spice_sugar",
		"salsa",
		"salsa_spice_chili",
		"salsa_spice_garlic",
		"salsa_spice_salt",
		"salsa_spice_sugar",
		"stuffedeggplant",
		"stuffedeggplant_spice_chili",
		"stuffedeggplant_spice_garlic",
		"stuffedeggplant_spice_salt",
		"stuffedeggplant_spice_sugar",
		"trailmix",
		"trailmix_spice_chili",
		"trailmix_spice_garlic",
		"trailmix_spice_salt",
		"trailmix_spice_sugar",
		"vegstinger",
		"vegstinger_spice_chili",
		"vegstinger_spice_garlic",
		"vegstinger_spice_salt",
		"vegstinger_spice_sugar",
		"waffles",
		"waffles_spice_chili",
		"waffles_spice_garlic",
		"waffles_spice_salt",
		"waffles_spice_sugar",
		"watermelonicle",
		"watermelonicle_spice_chili",
		"watermelonicle_spice_garlic",
		"watermelonicle_spice_salt",
		"watermelonicle_spice_sugar",
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