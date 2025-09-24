--!strict

type FindWithIndex<T> = {object: T, index: number}
type NestedArray<T> = T | {NestedArray<T>}

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

function Array.FindWithIndex<T>(array: {T}, requirement: (T) -> boolean): FindWithIndex<T>?
	
	for index, object in array do
		
		if not requirement(object) then continue end
		
		return {
			object = object,
			index = index
		}
		
	end
	
	return nil
	
end

function Array.Map<T, U>(array: {T}, transform: (T) -> U): {U}

	local mapped: {U} = {}

	for _, object in array do
		table.insert(mapped, transform(object))
	end

	return mapped

end

function Array.Contains<T>(array: {T}, value: T): boolean
	
	for _, object in array do
		
		if object == value then return true end
		
	end
	
	return false
	
end

function Array.Count<T>(array: {T}, requirement: (T) -> boolean): number
	
	local count = 0
	
	for _, object in array do
		if requirement(object) then count += 1 end
	end
	
	return count
	
end

function Array.Unique<T>(array: {T}, includeNaN: boolean?): {T}
	includeNaN = includeNaN or false

	local unique: {T} = {}
	local used: {[T]: boolean} = {}
	local usedNaN: boolean = false

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

function Array.ReverseCopy<T>(array: {T}): {T}
	local reversed: {T} = {}
	
	for i = #array, 1, -1 do
		table.insert(reversed, array[i])
	end
	
	return reversed
	
end

function Array.ReverseReplace<T>(array: {T}): {T}
	
	for i = 1, math.floor(#array / 2) do
		
		local j = #array - i + 1
		array[i], array[j] = array[j], array[i]
		
	end
	
	return array
	
end

function Array.Combine<T, U>(array: {T}, method: (U, T) -> U, startingValue: U): U
	
	local value = startingValue
	
	for _, object in array do

		value = method(value, object)

	end
	
	return value
	
end

function Array.Slice<T>(array: {T}, startIndex: number, endIndex: number): {T}
    if endIndex < startIndex then return {} end

    local slice: {T} = {}

    for i = math.max(1, startIndex), math.min(endIndex, #array) do

        if not array[i] then continue end

        table.insert(slice, array[i])

    end

    return slice

end

function Array.SimpleJoin<T>(arrayOne: {T}, arrayTwo: {T}): {T}
	
	local joined: {T} = {}
	
	for _, object in arrayOne do
		table.insert(joined, object)
	end
	
	for _, object in arrayTwo do
		table.insert(joined, object)
	end
	
	return joined
	
end

function Array.AlternatingJoin<T>(arrayOne: {T}, arrayTwo: {T}): {T}
	
	local joined: {T} = {}
	
	local lengthOne = #arrayOne
	local lengthTwo = #arrayTwo
	
	local numberLoops = math.max(lengthOne, lengthTwo)
	
	for i = 1, numberLoops do
		
		if i <= lengthOne then
			table.insert(joined, arrayOne[i])
		end
		
		if i <= lengthTwo then
			table.insert(joined, arrayTwo[i])
		end
		
	end
	
	return joined
	
end

function Array.Flatten2D<T>(nestedArray: {{T}}): {T}
	
	local flattened: {T} = {}
	
	for _, array in nestedArray do
		
		for _, object in array do
			
			table.insert(flattened, object)
			
		end
		
	end
	
	return flattened
	
end

function Array.FlattenND<T>(nestedArray: NestedArray<T>): {T}
	
	local flattened: {T} = {}
	
	local function recursiveFlatten(object: NestedArray<T>)
		
		if typeof(object) == "table" then
			
			for _, subObject in object do
				
				recursiveFlatten(subObject)
			end
		
		else
			
			table.insert(flattened, object)
			
		end
		
	end
	
	recursiveFlatten(nestedArray)
	
	return flattened
	
end

return Array 