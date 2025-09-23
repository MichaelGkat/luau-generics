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




return Array 