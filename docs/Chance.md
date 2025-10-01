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
- `T?` - Randomly selected value using relative weights.  Returns nil if options/weights are empty, mismatched in length, or total weight <= 0

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
- `{T}` - New shuffled array, does not guarantee it to be a derangement

**Example:**
```lua

local array = {1, 2, 3}
local shuffled = Chance.Shuffle(array)

print(shuffled) -- {2, 3, 1}

```

## Chance.ShuffleDerangement
```lua
Chance.ShuffleDerangement<T>(array: {T}): {T}
```

**Parameters:**
- `array: {T}` - Array to shuffle
**Returns:** 
- `{T}` - New shuffled array, guaranteed to be a derangement

**Example:**
```lua

local array = {1, 2, 3}
local shuffled = Chance.ShuffleDerangement(array)

print(shuffled) -- {3, 1, 2}

```

## Chance.Range
```lua
Chance.Range(min: number, max: number): number
```

**Parameters:**
- `min: number` - Minimum value (inclusive)
- `max: number` - Maximum value (inclusive)
**Returns:** 
- `number` - Random value between min and max

**Example:**
```lua

local randomValue = Chance.Range(10, 20)
print(randomValue) -- Some value between 10 and 20

```

## Chance.Boolean
```lua
Chance.Boolean(probability: number): boolean
```

**Parameters:**
- `probability: number` - Probability to return true (0.0 to 1.0)
**Returns:** 
- `boolean` - true or false based on probability

**Example:**
```lua

local coinFlip = Chance.Boolean(0.5)
print(coinFlip) -- true | false with 50-50 odds

```

## Chance.Color3
```lua
Chance.Color3(): Color3
```

**Parameters:**

**Returns:** 
- `Color3` - Random color with RGB values from 0 to 1

**Example:**
```lua

local randomColor = Chance.Color3()
print(randomColor) -- Random color

```

## Chance.Vector2
```lua
Chance.Vector2(min: number, max: number): Vector2
```

**Parameters:**
- `min: number` - Minimum value for X and Y components
- `max: number` - Maximum value for X and Y components
**Returns:** 
- `Vector2` - Random Vector2 with components between min and max, or Vector2.one if min > max

**Example:**
```lua

local randomVector2 = Chance.Vector2(5, 10)
print(randomVector2) -- Random Vector2 with components between 5 and 10

```

## Chance.Vector3
```lua
Chance.Vector3(min: number, max: number): Vector3
```

**Parameters:**
- `min: number` - Minimum value for X, Y, and Z components
- `max: number` - Maximum value for X, Y, and Z components
**Returns:** 
- `Vector3` - Random Vector3 with components between min and max, or Vector3.one if min > max

**Example:**
```lua

local randomVector3 = Chance.Vector3(1, 5)
print(randomVector3) -- Random Vector3 with components between 1 and 5

```

## Chance.CFrame
```lua
Chance.CFrame(min: number, max: number, minRotation: number, maxRotation: number): CFrame
```

**Parameters:**
- `min: number` - Minimum value for position components
- `max: number` - Maximum value for positions components
- `minRotation: number` - Minimum rotation value in radians for each axis
- `maxRotation: number` - Maximum rotation value in radians for each axis
**Returns:** 
- `CFrame` - Random CFrame with position and rotation. Returns CFrame.new(Vector3.one) if max < min or maxRotation < minRotation

**Example:**
```lua

local randomCFrame = Chance.CFrame(0, 5, 0, math.pi / 2)
print(randomCFrame) -- Random CFrame with random position and rotation

```



