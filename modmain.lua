all_clients_require_mod = true

PrefabFiles = {
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

-- RECIPES
local enableAltRecipes = GetModConfigData("AltRecipes") or "true"

if enableAltRecipes == "true" then
    AddRecipe2("tentaclespike",
	{
		ingredient("livinglog", 1),
		ingredient("monstermeat", 3),
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
		ingredient("twigs", 2),
		ingredient("nightmarefuel", 2)
	},
	tech.SCIENCE_ONE, {numtogive = 8}, {"REFINE"})

	AddRecipe2("twigs", 
	{
		ingredient("log", 1),
		ingredient("nightmarefuel", 1)
	},
	tech.SCIENCE_TWO, {numtogive = 5}, {"REFINE"})

	AddRecipe2("flint", 
	{
		ingredient("rocks", 2)
	},
	tech.SCIENCE_ONE, {numtogive = 4}, {"REFINE"})

	AddRecipe2("sewing_kit", 
	{
		ingredient("log", 4),
		ingredient("silk", 4),
		ingredient("stinger", 8)
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
	tech.SCIENCE_TWO, {numtogive = 4}, {"REFINE"})
end