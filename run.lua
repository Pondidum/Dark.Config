local addon, ns = ...
local components = ns.components

Dark.config = {

	components = components,

	createWindow = function(self)
		self.window = components:window({ name = "DarkConfigui" })
		self.toggle = components:uiToggle({ name = "DarkConfiguiToggle", onClick = self.window.toggle})
	end,

	addPanel = function(self, name, buildChildren)

		local panel = components:panel({ parent = self.window })
		local children = components:createDefaults({ parent = panel })

		local controls = buildChildren(children)

		for i, control in ipairs(controls) do
			panel:addChild(control)
		end

		self.window:addPanel(name, panel)

	end,

}


-- example:
--[[

local config = {

	interrupt = {
		enabled = true,
		channel = "SAY",
		suffix = "Group 1 Next",
		notify = "",
	},
}


Dark.config:createWindow()

Dark.config:addPanel("Interrupt", function(control)

	return {
    	control:input(config.interrupt, "enabled", "boolean"),
    	control:input(config.interrupt, "channel", "text"),
    	control:input(config.interrupt, "suffix", "text"),
    	control:input(config.interrupt, "notify", "text")
    }

end)
]]

