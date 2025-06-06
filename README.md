# Ruby Scripting Toolkit

This repository showcases a series of Ruby-based scripting projects focused on command-line utilities, class extensions, encryption algorithms, and object-oriented programming.

Each script demonstrates practical problem-solving and clean, modular code design.

---

## 📂 Project Overview

### 🔧 `array.rb`
Extends Ruby’s built-in `Array` class:
- Custom `[]` method returns `'\0'` for out-of-bounds access.
- Enhanced `map` method supports optional step or range selection.

### 🧪 `rgrep.rb`
Command-line grep-like utility with multiple options:
- `-w` word search
- `-p` regex match (default)
- `-v` inverse match
- `-c` count matching lines
- `-m` extract matching fragments

Includes:
- `test.txt` sample input  
- `test_rgrep.sh` script for automated test runs  
- Screenshot: `Problem02-Terminal-Screenshot.png`

### 🔢 `pascal_triangle.rb`
Implements a cascading sum encryption algorithm:
- Each iteration reduces a digit sequence
- Final output is a 2-digit encrypted result

### 🚙 `vehicle.rb`
OOP hierarchy simulating vehicles:
- `Vehicle`, `MyCar`, `MyTruck`, and `ElectricCar` classes
- Modules: `Towable` and `SelfDriving`
- Functionality includes speed control, repainting, towing, mileage, and battery management

---

## ▶️ Usage

```bash
ruby array.rb
ruby rgrep.rb test.txt -w road
ruby pascal_triangle.rb
ruby vehicle.rb
bash test_rgrep.sh
