--!strict
local Array = {}

local function isNaN<T>(value: T): boolean
	return value ~= value
end

function Array.Filter<T>(array: {T}, requirement: (T) -> boolean): {T}
	local filtered: {T} = {}

	for _, object in array do
		if not requirement(object) then continue end

		table.insert(filtered, object)

	end

	return filtered

end

function Array.FindValue<T>(array: {T}, requirement: (T) -> boolean): T?
	
	for _, object in array do

		if not requirement(object) then continue end

		return object

	end

	return nil
	
end

function Array.Map<T>(array: {T}, transform: (T) -> U): {U}
	
	local mapped: {U} = {}

	for _, object in array do
		table.insert(mapped, transform(object))
	end

	return mapped

end

function Array.Unique<T>(array: {T}, includeNaN: boolean?): {T}
	includeNaN = includeNaN or false

	local unique: {T} = {}
	local used: {[T]: boolean} = {}
	local usedNaN = false

	for _, object in array do
		if isNaN(object) then
			
			if not includeNaN then continue end
			if usedNaN then continue end
			
			usedNaN = true
			table.insert(unique, 0/0)
			
		elseif used[object] then continue
			
		else
			
			used[object] = true
			table.insert(unique, object)
			
		end
	end

	return unique
end

function Array.Any<T>(array: {T}, requirement: (T) -> boolean): boolean
	
	for _, object in array do
		
		if not requirement(object) then continue end
		
		return true
		
	end
	
	return false
	
end

function Array.All<T>(array: {T}, requirement: (T) -> boolean): boolean

	for _, object in array do

		if not requirement(object) then return false end

	end
	
	return true
    
end

function Array.Reverse<T>(array: {T}): {T}
	local reversed: {T} = {}
	
	for i = #array, 1, -1 do
		table.insert(reversed, array[i])
	end
	
	return reversed
	
end

function Array.Combine<T, U>(array: {T}, method: (U, T) -> U, startingValue: U): U
	
	local value = startingValue
	
	for i = 2, #array do
		value = method(value, array[i])
	end
	
	return value
	
end

return Array 
