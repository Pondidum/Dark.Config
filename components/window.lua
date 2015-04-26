local addon, ns = ...
local components = ns.components
local spacer = components.spacer

local style = ns.lib.style

components.window = function(self, config)

	config = config or {}

	local spacing = 10

	local container = self:frame({
		name = config.name,
		width = 800,
		height = 600
	})

	local header = self:frame({
		name = "$parentHeader",
		parent = container,
		height = 40,
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

	spacer:insetTop(header, spacing, container)
	spacer:insetBottom(buttonPanel, spacing, container)

	spacer:between(categoryList, spacing, { top = header, bottom = buttonPanel})
	spacer:between(optionsHost, spacing, { top = header, bottom = buttonPanel, left = categoryList})

	spacer:align(categoryList, spacing, { left = container })
	spacer:align(optionsHost, spacing, { right = container })

	style:frame(container)
	style:frame(categoryList)
	style:frame(optionsHost)

	return container

end
