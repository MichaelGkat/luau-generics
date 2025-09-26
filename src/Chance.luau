--!strict

local Chance = {}

local function isDerangement<T>(original: {T}, shuffled: {T}): boolean
	
	for i = 1, #original do if original[i] == shuffled[i] then return false end end
	return true
	
end

function Chance.Pick<T>(options: {T}): T?
	if #options == 0 then return nil end

	return options[math.random(#options)]
end

function Chance.PickWeighted<T>(options: {T}, weights: {number}): T?
	if #options == 0 or #weights == 0 or #options ~= #weights then return nil end
	
	local totalWeight = Array.Combine(weights, function(weightSum: number, weight: number)
		return weightSum + math.max(0, weight) 
	end, 0)
	
	if totalWeight <= 0 then return nil end
	
	local randomValue = math.random() * totalWeight
	
	local loopWeight = 0
	
	for idx, weight in weights do
		loopWeight += math.max(0, weight)
		
		if randomValue > loopWeight then continue end
		
		return options[idx]
		
	end

	return options[#options]

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

function Chance.ShuffleDerangement<T>(array: {T}): {T}
	
	if #array <= 1 then return array end
	
	local shuffled: {T}
	
	repeat
		
		shuffled = table.clone(array)
		
		for i = 1, #shuffled - 1 do
			
			local j = math.random(i, #shuffled)
			
			shuffled[i], shuffled[j] = shuffled[j], shuffled[i]
			
		end
		
	until isDerangement(array, shuffled)

	return shuffled
	
end

function Chance.Boolean(probability: number): boolean
	return (math.random() < probability)
end

return Chance