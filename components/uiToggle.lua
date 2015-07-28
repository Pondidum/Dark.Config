local addon, ns = ...
local components = ns.components
local style = ns.lib.style

components.uiToggle = function(self, config)

	local toggleConfigButton = components:button({
		name = config.name,
		width = 15,
		height = 15,
		onClick = config.onClick
	})

	toggleConfigButton.icon:SetTexture(ns.config.configIcon)

	style:button(toggleConfigButton)
	toggleConfigButton:SetPoint("RIGHT", MinimapZoneText, "RIGHT")

end
