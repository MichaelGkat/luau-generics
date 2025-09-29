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