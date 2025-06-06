#!/bin/bash

# Test case 1: Missing required arguments
echo "=== Test case 1: Missing required arguments ==="
ruby rgrep.rb
echo ""

# Test case 2: Word search (-w)
echo "=== Test case 2: Word search (-w) ==="
ruby rgrep.rb test.txt.txt -w road
echo ""

# Test case 3: Regex search with count (-p -c)
echo "=== Test case 3: Regex search with count (-p -c) ==="
ruby rgrep.rb test.txt.txt -p -c "\d\d"
echo ""

# Test case 4: Inverted search (-v)
echo "=== Test case 4: Inverted search (-v) ==="
ruby rgrep.rb test.txt.txt -v "^\d\d"
echo ""

# Test case 5: Invalid option
echo "=== Test case 5: Invalid option ==="
ruby rgrep.rb test.txt.txt -f
echo ""