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

## Array.FindValue
```lua
Array.FindValue<T>(array: {T}, requirement: (T) -> boolean): T?
```

**Parameters:**
- `array: {T}` - Array to search
- `requirement: (T) -> boolean` - Predicate to find specific element

**Returns:**
- `T?` - The first element that meets the requirement, nil if no element can be found

**Example:**
``` lua
local function BeginsWithZ(str: string)
	return string.sub(str, 1, 1) == "Z"
end

local names = {"Zack", "Mark", "Joe"}
local zNames = Array.FindValue(names, BeginsWithZ)
print(zNames) -- "Zack"
```

## Array.FindWithIndex
```lua
Array.FindWithIndex<T>(array: {T}, requirement: (T) -> boolean): FindWithIndex<T>?
```

**Parameters:**
- `array: {T}` - Array to search
- `requirement: (T) -> boolean` - Predicate to find specific element

**Returns:**
- `FindWithIndex<T>?` - A table containing {object: T, index: number} or nil if not found

**Example:**
``` lua
local function GreaterThan100(num: number)
	return num > 100
end

local numbers = {1, 200, 45, 20}
local bigNumber = Array.FindWithIndex(numbers, GreaterThan100)
print(bigNumber) -- {object = 200, index = 2}
print(bigNumber.object) -- 200
print(bigNumber.index) -- 2
```

## Array.Any
```lua
Array.Any<T>(array: {T}, requirement: (T) -> boolean): boolean
```

**Parameters:**
- `array: {T}` - Array to search
- `requirement: (T) -> boolean` - Predicate to find elements

**Returns:**
- `boolean` - true if any element meets the requirement, false otherwise

**Example:**
``` lua
local function isNumber(object: any)
	return type(object) == "number" and object == object
end

local array = {"hi", "not a number", "totally a number", 23}
local arrayHasNumber = Array.Any(array, isNumber)
print(arrayHasNumber) -- true
```

## Array.All
```lua
Array.All<T>(array: {T}, requirement: (T) -> boolean): boolean
```

**Parameters:**
- `array: {T}` - Array to search
- `requirement: (T) -> boolean` - Predicate to find elements

**Returns:**
- `boolean` - true if all element meets the requirement, false otherwise

**Example:**
``` lua
local function DivisibleByThree(num: number)
	return num % 3 == 0
end
local numbers = {3, 6, 9, 12}
local allEven = Array.All(numbers, DivisibleByThree)
print(allEven) -- true
```

## Array.ReverseCopy
```lua
Array.ReverseCopy<T>(array: {T}): {T}
```

**Parameters:**
- `array: {T}` - Array to reverse

**Returns:**
- `{T}` - A new array with elements in reverse order

**Example:**
``` lua
local numbers = {1, 2, 3, 4}
local reversed = Array.ReverseCopy(numbers)

print(reversed) -- {4, 3, 2, 1}
print(numbers) -- {1, 2, 3, 4} (original unchanged)
```


