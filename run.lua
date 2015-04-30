local addon, ns = ...

local components = ns.components

Dark.config = {

	components = components,

	addPanel = function(self, name, buildChildren)

		local panel = components:panel({ text = name })
		local children = components:createDefaults({ parent = panel })

		buildChildren(children)

	end,

}


-- example:


Dark.config:addPanel("Interrupt", function(panel)
	panel:input(config, "enabled", "boolean")
	panel:input(config, "channel", "text")
	panel:input(config, "suffix", "text")
	panel:input(config, "notify", "text")
end)
