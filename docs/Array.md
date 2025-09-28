# Array

Generic utility functions for arrays

```lua
local Array = require(src.Array)
```

## Array.Contains
```lua
Array.Contains<T>(array: {T}, value: T): boolean
```

**Parameters:**
- `array: {T}` - The array to search in
- `value: T` - The value to search for

**Returns:** 
- `boolean` - True if the value exists in the array, false otherwise

**Example:**
```lua
local numbers = {1, 3, 5, 7, 9}
local containsTwo = Array.Contains(numbers, 2)
local containsThree = Array.Contains(numbers, 3)

print(containsTwo) -- false
print(containsThree) -- true
```
