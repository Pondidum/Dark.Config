local addon, ns = ...
local components = ns.components

components.textInput = function(self, config)

	local label = self:font({ text = config.label })
	local textbox = self:textbox()

	textbox:SetPoint("LEFT", label, "RIGHT", 5, 0)

	label.read = function()
		textbox:SetText(config.read())
	end

	label.write = function()
		config.write(textbox:GetText())
	end

	return label

end