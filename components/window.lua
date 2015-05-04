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

	local child = self:createDefaults({ parent = container })

	local header = child:frame({ name = "$parentHeader", height = 40 })
	local categoryList = child:listbox({ name = "$parentCategoriesList", width = 200 })
	local optionsHost = child:frame({ name = "$parentHostPanel" })

	local cancelButton = child:button({
		name = "$parentCancel",
		text = "Cancel",
		width = 70,
		height = 20,
		onClick = function()
			container:Hide()
		end,
	})

	local acceptButton = child:button({
		name = "$parentAccept",
		text = "Accept",
		width = 70,
		height = 20,
		onClick = function()
			container:Hide()
		end,
	})

	container:SetPoint("CENTER")

	spacer:align(header, spacing, { left = container, top = container, right = container })
	spacer:align(cancelButton, spacing, { bottom = container, right = container})
	spacer:between(acceptButton, spacing, { right = cancelButton })

	spacer:align(categoryList, spacing, { left = container })
	spacer:between(categoryList, spacing, { top = header, bottom = cancelButton})

	spacer:align(optionsHost, spacing, { right = container })
	spacer:between(optionsHost, spacing, { top = header, bottom = cancelButton, left = categoryList})

	local colors = {
		backgroundColor = { 0, 0, 0, 0.6 },
		borderColor = { 1, 1, 1, 0.4 }
	}

	style:frame(container, colors)
	style:frame(categoryList, colors)
	style:frame(optionsHost, colors)
	style:actionButton(cancelButton, colors)
	style:actionButton(acceptButton, colors)

	container.addPanel = function(frame, name, panel)

		local button = self:button({
			name = "DarkPanelInterrupt",
			parent = categoryList,
			text = name,
			onClick = function()
				panel:read()
			end,
		})

		button:SetHeight(20)
		style:button(button)

		panel:SetAllPoints(optionsHost)
		categoryList:addItem(button)

	end

	return container

end
