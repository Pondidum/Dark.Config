local addon, ns = ...

local panelController = {

	new = function(self)

		local this = { panels = {} }

		return setmetatable(this, { __index = self })

	end,

	add = function(self, panel)
		table.insert(self.panels, panel)
		panel:read()
	end,

	switchTo = function(self, panel)

		self:hideAll()
		panel:read()
		panel:Show()

	end,

	writeAll = function(self)
		for i, panel in ipairs(self.panels) do
			panel:write()
		end
	end,

	hideAll = function(self)
		for i,panel in ipairs(self.panels) do
			panel:Hide()
		end
	end,
}

ns.panelController = panelController
