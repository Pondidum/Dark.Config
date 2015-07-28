local addon, ns = ...
local components = ns.components

local options = {

	new = function(self)
		self:createWindow()
		return self
	end,

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

Darker.options = options:new()
