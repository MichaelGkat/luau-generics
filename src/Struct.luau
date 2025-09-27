
local Struct = {}

function Struct.GetKeys<K, V>(dict: {[K]: V}): {K}
	
	local keys: {K} = {}
	
	for key, _ in dict do
		table.insert(keys, key)
	end
	
	return keys

end

function Struct.GetValues<K, V>(dict: {[K]: V}): {V}
	
	local values: {V} = {}
	
	for _, value in dict do
		table.insert(values, value)
	end
	
	return values
	
end

function Struct.DeepCopy<T>(struct: T): T
	if type(struct) ~= "table" then return struct end
	
	local deepCopy: {T} = {}
	
	for key, value in struct do
		deepCopy[Struct.DeepCopy(key)] = Struct.DeepCopy(value)
	end
	
	return deepCopy
		
end

return Struct