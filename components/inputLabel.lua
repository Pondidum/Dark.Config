local addon, ns = ...
local components = ns.components

components.inputLabel = function(self, config)

	return self:font({ text = config.label, width = config.labelWidth, align = "RIGHT" })

end
