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
	if #options == 0 then return nil end
	
	return nil
	
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