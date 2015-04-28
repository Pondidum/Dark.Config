local addon, ns = ...
local components = ns.components

components.input = function(self, table, key, type)

	local typeName = string.lower(type) .. "Input"

	return self[typeName](self, {
		label = key,
		read = function() return table[key] end,
		write = function(value) table[key] = value end,
	})

end
