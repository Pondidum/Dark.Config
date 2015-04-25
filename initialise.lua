local addon, ns = ...

local dark = Darker

ns.lib = {
	class = dark.class,
	mixins = dark.mixins
}

ns.components = setmetatable({}, { __index = dark.controls })
