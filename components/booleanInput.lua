local addon, ns = ...
local components = ns.components

components.booleanInput = function(self, config)

	local label = self:inputLabel(config)
	local check = self:checkbox()

	check:SetPoint("LEFT", label, "RIGHT", 5, 0)

	label.read = function()
		check:SetChecked(config.read())
	end

	label.write = function()
		config.write(check:GetChecked())
	end

	return label

end