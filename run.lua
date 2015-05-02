local addon, ns = ...
local components = ns.components

Dark.config = {

	components = components,

	createWindow = function(self)
		self.window = components:window({ name = "DarkConfigui" })
	end,

	addPanel = function(self, name, buildChildren)

		local panel = components:panel({ parent = self.window })
		local children = components:createDefaults({ parent = panel })

		children.add = function(self, child)
			panel:addChild(child)
		end

		buildChildren(children)

		self.window:addPanel(name, panel)

	end,

}


-- example:
--[[

local config = Dark.raids.config

Dark.config:addPanel("Interrupt", function(panel)
    panel:add(panel:input(config, "enabled", "boolean"))
    panel:add(panel:input(config, "channel", "text"))
    panel:add(panel:input(config, "suffix", "text"))
    panel:add(panel:input(config, "notify", "text"))
end)

]]