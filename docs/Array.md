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

## Array.Count
```lua
Array.Count<T>(array: {T}, requirement: (T) -> boolean): number
```

**Parameters:**
- `array: {T}` - The array to count elements in
- `requirement: (T) -> boolean` - Predicate that returns true for values to count

**Returns:**
- `number` - The number of elements that meet the requirement

**Example:**
``` lua

local function isEven(num: number)
	return num % 2 == 0
end

local numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
local numberEven = Array.Count(numbers, isEven)
print(numberEven) -- 5
```

## Array.Filter
```lua
Array.Filter<T>(array: {T}, requirement: (T) -> boolean): {T}
```

**Parameters:**


**Returns:**

**Example:**
``` lua

```

