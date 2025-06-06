# Ruby-Scripting-Toolkit

This repository contains a collection of Ruby-based scripting projects, showcasing practical applications of scripting, object-oriented design, command-line utilities, and class extensions.

Each script solves a distinct problem while demonstrating clean structure, logic, and modular testability.

---

## 📁 Contents

### 🔧 `array.rb`
Extends Ruby’s built-in `Array` class:
- Custom `[]` method that returns a default `'\0'` character for out-of-bounds access.
- Overloaded `map` method that accepts an optional step or range argument.

### 🧪 `rgrep.rb`
A Ruby implementation of a grep-like CLI utility with support for:
- `-w` word match
- `-p` regex match
- `-v` inverted match
- Additional `-c` count and `-m` match-only modifiers
- Error detection for invalid/missing combinations and arguments

Includes test file: `test.txt`  
Includes automation script: `test_rgrep.sh`

### 🔢 `pascal_triangle.rb`
Implements a recursive “cascading sum” encryption function `findEncryption`, which reduces a list of digits to a two-digit string for secure numeric encoding.

### 🚗 `vehicle.rb`
Object-oriented class hierarchy simulating vehicles:
- `Vehicle` superclass with shared behavior
- `MyCar`, `MyTruck`, and `ElectricCar` subclasses
- Module mixins: `Towable`, `SelfDriving`
- Supports speed, mileage, repainting, towing, and battery-based logic

---

## ✅ Getting Started

To run any of the scripts:

```bash
ruby array.rb
ruby rgrep.rb test.txt -w road
ruby pascal_triangle.rb
ruby vehicle.rb
