### Sudoku puzzle solver

This script takes a comma separated string of 81 values (or any square number of values) and verifies whether it's a valid sudoku or not.
I encountered this problem during a coding test and wanted to finish it out better. It was a good exercise for practicing using a few Enumerable methods available in Ruby.

Currently, it will take a string of sudoku numbers and output whether they make up a valid sudoku or not. This was a process to fully think through how to put this this together, however, it doesn't yet solve a sudoku with missing numbers.

#### TODO:
1. Make it solve a sudoku puzzle with missing numbers. The missing numbers can be represented by zeros in the string.

#### To run...
1. `cd` into the project directory
2. `ruby sudoku_solver.rb`
