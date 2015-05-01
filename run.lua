local addon, ns = ...

local components = ns.components

Dark.config = {

	components = components,

	addPanel = function(self, name, buildChildren)

		local panel = components:panel({ text = name })
		local children = components:createDefaults({ parent = panel })

		children.add = function(self, child)
			panel:addChild(child)
		end,

		buildChildren(children)

	end,

}


-- example:


Dark.config:addPanel("Interrupt", function(panel)
	panel:add(panel:input(config, "enabled", "boolean"))
	panel:add(panel:input(config, "channel", "text"))
	panel:add(panel:input(config, "suffix", "text"))
	panel:add(panel:input(config, "notify", "text"))
end)
