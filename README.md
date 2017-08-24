### Sudoku puzzle solver

This script takes a comma separated string of 81 values (or any square number of values) and verifies whether it's a valid sudoku or not.
I encountered this problem during a coding test and wanted to finish it out better. It was a good exercise for practicing using a few Enumerable methods available in Ruby.

#### Thought process...
At first, I started out by representing the sudoku using one, multi-dimensional array. I would then have to run several series of loops on that one array to determine if every row, column, and sub-grid was valid or not.

After thinking about it some more, I realized that I could create three arrays instead of one: one for the rows of the sudoku, one for the columns, and one for the sub-grids. The columns of the actual sudoku would be stored as rows in the columns arrays, and the sub-grids would also be stored as rows within their own array. This way, I had one similar pattern that I could use for each of the three arrays to represent each of the three different datasets that make up a sudoku puzzle. It made it much easier to think through because I didn't have to manage several layers of nested loops.

Once that was in place, I was able to simply run `.uniq` on each row of each array and then check whether this affected its size. If it did, then I'd know I had duplicates, and the sudoku wasn't valid. Otherwise, I'd know it was valid.  

Currently, it will take a string of sudoku numbers and outputs whether they make up a valid sudoku or not. It doesn't yet solve a sudoku with missing numbers. However, now that the code exists to split the sudoku into three arrays, it will make it easier to program it later to solve the puzzle on its own when there are missing numbers.

#### TODO:
1. Make it solve a sudoku puzzle with missing numbers. The missing numbers can be represented by zeros in the string.
2. Generate the string automatically with random missing numbers.

#### To run...
1. `cd` into the project directory
2. `ruby sudoku_solver.rb`
