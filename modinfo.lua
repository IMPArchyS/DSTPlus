name = "DSTplus V1"
description = "Tweaks to normal Don't Starve recipes, more recipes for resources, even custom tools, tweaks for spoilage & rabbit AI."
author = "ArchyS"
version = "0.1"

forumthread = ""

api_version = 10

all_clients_require_mod = true
client_only_mod = false
dst_compatible = true

icon_atlas = "modicon.xml"
icon = "modicon.tex"

configuration_options = {
	{
		name = "AltRecipes",
		label = "Alternative Recipes",
		options = {
			{description = "True", data = "true"},
			{description = "False", data = "false"},
		},
		default = "true",
	},
}