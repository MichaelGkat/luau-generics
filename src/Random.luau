--!strict

local Chance = {}

function Chance.Pick<T>(options: {T}): T?
	if #options == 0 then return nil end

	return options[math.random(#options)]
end

return Chance