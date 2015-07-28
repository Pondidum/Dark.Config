local addon, ns = ...
local components = ns.components
local style = ns.lib.style

components.uiToggle = function(self, config)

	local toggleConfigButton = components:button({
		name = config.name,
		width = 15,
		height = 15,
		icon = ns.config.configIcon,
		onClick = config.onClick
	})

	style:button(toggleConfigButton)
	toggleConfigButton:SetPoint("RIGHT", MinimapZoneText, "RIGHT")

end
