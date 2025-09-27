
local Struct = {}

function Struct.GetKeys<K, V>(dict: {[K]: V}): {K}
	
	local keys: {K} = {}
	
	for key, _ in dict do
		table.insert(keys, key)
	end
	
	return keys

end

return Struct