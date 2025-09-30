# Chance

Generic utility functions for randomization

```lua
local Chance = require(src.Chance)
```

## Chance.Pick
```lua
Chance.Pick<T>(options: {T}): T?
```

**Parameters:**
- `options: {T}` - Array of possible values

**Returns:** 
- `T?` - Randomly selected value, provided options contains atleast one element.  Nil if not

**Example:**
```lua
local numbers = {1, 3, 5, 7, 9}

local randomNumber = Chance.Pick(numbers)

print(randomNumber) -- 1, 3, 5, 7, or 9

```

## Chance.PickWeighted
```lua
Chance.PickWeighted<T>(options: {T}, weights: {number}): T?
```

**Parameters:**
- `options: {T}` - Array of possible values
- `weights: {number}` – Array of relative weights for each option to be selected. These weights do not need to add up to a specific value and are relative to the other weights.

**Returns:** 
- `T?` - Randomly selected value using relative weights

**Example:**
```lua
local fruits = {"apple", "banana", "pear"}
local weights = {0.6, 0.3, 0.1}

local randomFruit = Chance.PickWeighted(fruits, weights)

print(randomFruit) -- apple (60%) or banana (30%) or pear (10%)

```

## Chance.Shuffle
```lua
Chance.Shuffle<T>(array: {T}): {T}
```

**Parameters:**
- `array: {T}` - Array to shuffle
**Returns:** 
- `{T}` - New shuffled array, does not gurantee it to be a derangement

**Example:**
```lua

local array = {1, 2, 3}
local shuffled = Chance.Shuffle(array)

print(shuffled) -- {2, 3, 1}

```


