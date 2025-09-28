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
- `array: {T}` - Array to filter
- `requirement: (T) -> boolean` - Predicate that returns true for values to keep

**Returns:**
- `{T}` - Filtered array with elements that met the requirement

**Example:**
``` lua
local function hasSpace(str: string)
	return string.find(str, "%s") ~= nil
end

local strings = {"abc", "hello", "One Space", "Two Spaces Here", "ZeroSpaces"}
local filteredStrings = Array.Filter(strings, hasSpace)
print(filteredStrings) -- {"One Space", "Two Spaces Here"}
```

## Array.Map
```lua
Array.Map<T, U>(array: {T}, transform: (T) -> U): {U}
```

**Parameters:**
- `array: {T}` - Array to transform
- `transform: (T) -> U` - Function that transforms each element

**Returns:**
- `{U}` - New array with transformed elements

**Example:**
``` lua
local function triple(num: number)
	return num * 3
end

local numbers = {2, 4, 6, 8, 10}
local tripled = Array.Map(numbers, triple)
print(tripled) -- {6, 12, 18, 24, 30}
```

## Array.Unique
```lua
Array.Unique<T>(array: {T}, includeNaN: boolean?): {T}
```

**Parameters:**
- `array: {T}` - The array to remove duplicates from
- `includeNan: boolean?` - Include NaN values (defaults to False)

**Returns:**
- `{T}` - A new array with unique elements only

**Example:**
``` lua
local array = {Enum.KeyCode.P, Enum.KeyCode.P, "hello", 23, "this is unique", "not unique", "not unique"}
local uniqueArray = Array.Unique(array, false)
print(uniqueArray) -- {Enum.KeyCode.P, "hello", 23, "this is unique", "not unique"}
```



