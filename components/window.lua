local addon, ns = ...
local components = ns.components

local style = ns.lib.style

components.window = function(self, config)

	config = config or {}

	local spacing = 10

	local container = self:frame({
		name = config.name,
		width = 800,
		height = 600
	})

	local categoryList = self:scrollFrame({
		name = "$parentCategoriesList",
		parent = container,
		width = 200
	})

	local optionsHost = self:frame({
		name = "$parentHostPanel",
		parent = container
	})

	local buttonPanel = self:frame({
		name = "$parentButtonPanel",
		parent = container,
		height = 40
	})

	container:SetPoint("CENTER")
	style:frame(container)

	categoryList:SetPoint("TOPLEFT", spacing, -spacing)
	categoryList:SetPoint("BOTTOM", buttonPanel, "TOP", 0, spacing)
	style:frame(categoryList)

	optionsHost:SetPoint("TOPRIGHT", -spacing, -spacing)
	optionsHost:SetPoint("LEFT", categoryList, "RIGHT", spacing, 0)
	optionsHost:SetPoint("BOTTOM", buttonPanel, "TOP", 0, spacing)
	style:frame(optionsHost)

	buttonPanel:SetPoint("BOTTOMLEFT", spacing, spacing)
	buttonPanel:SetPoint("BOTTOMRIGHT", -spacing, spacing)

	return container

end
