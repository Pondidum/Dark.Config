local addon, ns = ...

local dark = Darker

ns.lib = {
	class = dark.class,
	mixins = dark.mixins,
	style = dark.style,
	layout = dark.layoutEngine,
}

ns.components = setmetatable({}, { __index = dark.controls })
