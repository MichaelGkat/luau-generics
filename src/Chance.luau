--!strict

local Chance = {}

function Chance.Pick<T>(options: {T}): T?
	if #options == 0 then return nil end

	return options[math.random(#options)]
end

function Chance.Shuffle<T>(array: {T}): {T}
	
	if #array <= 1 then return array end
	
	local shuffled = table.clone(array)
	
	for i = 1, #shuffled - 1 do
		local j = math.random(i, #shuffled)
		shuffled[i], shuffled[j] = shuffled[j], shuffled[i]
	end
	
	return shuffled
	
end

return Chance