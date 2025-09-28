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
local allDivisibleByThree = Array.All(numbers, DivisibleByThree)
print(allDivisibleByThree) -- true
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

## Array.ReverseReplace
```lua
Array.ReverseReplace<T>(array: {T}): {T}
```

**Parameters:**
- `array: {T}` - Array to reverse in-place

**Returns:**
- `{T}` - The same array with elements in reverse order

**Example:**
``` lua
local numbers = {1, 2, 3, 4}
local reversed = Array.ReverseReplace(numbers)

print(reversed) -- {4, 3, 2, 1}
print(numbers) -- {4, 3, 2, 1} (original changed)
```

## Array.Combine
```lua
Array.Combine<T, U>(array: {T}, method: (U, T) -> U, startingValue: U): U
```

**Parameters:**
- `array: {T}` - Array to combine
- `method: (U, T) -> U` - Function to combine elements
- `startingValue: U` - Initial value for the method

**Returns:**
- `U` - The final combined value

**Example:**
``` lua
local function AddValue(summed: number, current: number)
	return summed + current
end
local numbers = {1, 2, 3, 4, 5}
local sum = Array.Combine(numbers, AddValue, 0)
print(sum) -- 15
```

## Array.SimpleJoin
```lua
Array.SimpleJoin<T>(arrayOne: {T}, arrayTwo: {T}): {T}
```

**Parameters:**
- `arrayOne: {T}` - First array
- `arrayTwo: {T}` - Second array

**Returns:**
- `{T}` - Combined array starting with all arrayOne elements followed by arrayTwo elements

**Example:**
``` lua
local arrayOne = {1, 2, 3}
local arrayTwo = {4, 5, 6}
local joined = Array.SimpleJoin(arrayOne, arrayTwo)
print(joined) -- {1, 2, 3, 4, 5, 6}
```

## Array.AlternatingJoin
```lua
Array.AlternatingJoin<T>(arrayOne: {T}, arrayTwo: {T}): {T}
```

**Parameters:**
- `arrayOne: {T}` - First array
- `arrayTwo: {T}` - Second array

**Returns:**
- `{T}` - Combined array with elements alternating between the two arrays

**Example:**
``` lua
local letters = {"a", "b", "c"}
local numbers = {1, 2, 3}
local joined = Array.AlternatingJoin(letters, numbers)
print(joined) -- {"a", 1, "b", 2, "c", 3}
```

## Array.Flatten2D
```lua
Array.Flatten2D<T>(nestedArray: {{T}}): {T}
```

**Parameters:**
- `nestedArray: {{T}}` - a 2D array

**Returns:**
- `{T}` - A flattened 1D array

**Example:**
``` lua
local Matrix = {{1, 2}, {3, 4}, {5, 6}}
local flattened = Array.Flatten2D(Matrix)
print(flattened) -- {1, 2, 3, 4, 5, 6}
```

## Array.FlattenND
```lua
Array.FlattenND<T>(nestedArray: NestedArray<T>): {T}
```

**Parameters:**
- `nestedArray: NestedArray<T>` - a nested array of any depth

**Returns:**
- `{T}` - A completely flattened 1D array

**Example:**
``` lua
local nested = {1, 2, 3, {4, 5, 6, {7, 8, 9, {10, 11, 12}}}}
local flattened = Array.FlattenND(nested)
print(flattened) -- {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}
```

## Array.Slice
```lua
Array.Slice<T>(array: {T}, startIndex: number, endIndex: number): {T}
```

**Parameters:**
- `array: {T}` - Array to slice
- `startIndex: number` - Starting index (inclusive)
- `endIndex: number` - Ending index (inclusive)

**Returns:**
- `{T}` - Slice array containing elements from [startIndex, endIndex]

**Example:**
``` lua
local array = {1, 2, 3, 4, 5, 6, 7, 8}
local sliced = Array.Slice(array, 2, 5)
print(sliced) -- {2, 3, 4, 5}
```

## Array.Chunk
```lua
Array.Chunk<T>(array: {T}, chunkSize: number): {{T}}
```

**Parameters:**
- `array: {T}` - Array to split into chunks
- `chunkSize: number` - Size of each chunk

**Returns:**
- `{{T}}` - Array of arrays, each of size chunkSize (except possibly the last element)

**Example:**
``` lua
local array = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j"}
local chunked = Array.Chunk(array, 3)
print(chunked) -- {{"a", "b", "c"}, {"d", "e", "f"}, {"g", "h", "i"}, {"j"}}
```
