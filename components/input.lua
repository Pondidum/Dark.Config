local addon, ns = ...
local components = ns.components

components.input = function(self, table, key, type)

	local typeName = string.lower(type) .. "Input"

	return self[typeName](self, {
		label = key,
		labelWidth = 100,
		controlWidth = 250,
		read = function() return table[key] end,
		write = function(value) table[key] = value end,
	})

end
