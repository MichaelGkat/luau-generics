# luau-generics

A compilation of generic utility functions for common tasks in Luau.

- See [`docs/`](docs/) for detailed documentation on each module.
- See [`src/`](src/) for code implementations.

## 📁 Project Structure

``` text
luau-generics/
├── docs/
│   ├── Array.md
│   ├── Chance.md
│   └── Struct.md
├── src/
│   ├── Array.luau
│   ├── Chance.luau
│   └── Struct.luau
├── .gitignore
├── LICENSE
└── README.md
```


## 🚀 Getting Started

### 1. Check the [`docs/`](docs/) folder  

Includes:
- Descriptions for each module
- Parameters and return types
- Example use cases

### 2. Require any module from `src`

> ⚠️ Note: `'src'` may not be the correct path depending on your project setup

```lua
local Array = require(src.Array)
```

### 3. Use the methods!

```lua
local Array = require(src.Array)
local tb = {1, 2, 3, 4, 5}

local tripled = Array.Map(numbers, function(n)
	return n * 3
end)

print(tripled) -- {3, 6, 9, 12, 15}
```