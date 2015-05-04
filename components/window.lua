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

	local allPanels = {}
	local allButtons = {}

	local hidePanels = function()
		for i,panel in ipairs(allPanels) do
			panel:Hide()
		end
	end

	local uncheckButtons = function()
		for i, button in ipairs(allButtons) do
			button:SetChecked(false)
		end
	end

	container.addPanel = function(frame, name, panel)

		local button = self:button({
			type = "CheckButton",
			name = "DarkPanelInterrupt",
			parent = categoryList,
			height = 20,
			text = name,
			onClick = function(b)

				hidePanels()
				uncheckButtons()

				panel:read()
				panel:Show()

				b:SetChecked(true)
			end,
		})

		style:checkButton(button)
		categoryList:addItem(button)

		spacer:align(panel, spacing, { top = optionsHost, right = optionsHost, bottom = optionsHost, left = optionsHost })

		table.insert(allPanels, panel)
		table.insert(allButtons, button)

		hidePanels()
		uncheckButtons()
	end

	return container

end
