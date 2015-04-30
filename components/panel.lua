local addon, ns = ...
local components = ns.components

components.panel = function(self, config)

	local frame = self:frame({ parent = config.parent })

	return frame

end
