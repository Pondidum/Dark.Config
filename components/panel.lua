local addon, ns = ...

local layout = ns.lib.layout
local components = ns.components

components.panel = function(self, config)

	local frame = self:frame({ parent = config.parent })
	local engine = layout:new(frame, {
		layout = "vertical",
		origin = "TOP",
		wrap = false,
		autosize = "y",
		itemSpacing = 5
	})

	frame.addChild = function(f, child)
		engine:addChild(child)
		engine:performLayout()
	end

	return frame

end
