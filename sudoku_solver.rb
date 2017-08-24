module Util
	def print_grid array, title = 'grid'
		puts "#{title.upcase}:"
		array.each do |sub|
			puts sub.inspect
		end
		puts "---------------------------"
	end
	def is_unique array, title = 'grid'
		result = true
		array.each do |sub|
      length = sub.length
			#it's pretty simple to check if the number is in the row. I just use .uniq and make sure the sub still has 9 values
			if sub.uniq.length != length
				puts "#{title} is not valid"
				result = false
			end
		end
		result
	end
end

class SudokuSolver
	include Util
	def initialize sudoku_string
		@string = sudoku_string
		#convert the string to an array
		@array = @string.split(',').map(&:to_i)

		@square = Integer(Math.sqrt(@array.size))
		@sub_square = Integer(Math.sqrt(@square))

		build_rows
		build_cols
		build_sub_grids
	end
	def build_rows
		#Convert the array to a 9x9 multi-dimensional array. Each item in the first dimension is a row in the sudoku and each item in the second dimension is a column value.
		i = -1
		#array_slice, groups the array into sub-arrays
		rows = @array.slice_before do |item|
		  (i += 1) % @square == 0
		end
		#convert enumerable to an array
		@rows = rows.to_a
		print_grid @rows, 'rows'
	end
	def build_cols
		#Create an array to hold the columns. In this case, a row in the array represents a column in the sudoku.
		@cols = []
		@rows.each do |row|
			i = 0
			row.each do |value|
				@cols[i] ||= []
				@cols[i].push(value)
				i += 1
			end
		end
		print_grid @cols, 'cols'
	end
	def build_sub_grids
		#Create an array to hold the sub_grids. Each row in the array represents a sub-grid in the sudoku.
		@sub_grids = []
		@rows.each_with_index do |row, i|
			#slice the row into three pieces
			row_slices = row.each_slice(@sub_square).to_a
			j = 0
			#each of the three pieces has three items
			while j < @sub_square
				row_slice = row_slices[j]
				index = ((i / @sub_square) * @sub_square) + j
				@sub_grids[index] ||= []
				@sub_grids[index] += row_slice
				j += 1
			end
		end
		print_grid @sub_grids, 'sub grids'
	end
	def verify
		@result = is_unique @rows, 'row'
		@result = is_unique @cols, 'col'
		@result = is_unique @sub_grids, 'sub_grid'
		if @result
			puts "Sudoku is valid"
		else
			puts "Sudoku is invalid"
		end
	end
end
string = "
5,3,4,6,7,8,9,1,2,
6,7,2,1,9,5,3,4,8,
1,9,8,3,4,2,5,6,7,
8,5,9,7,6,1,4,2,3,
4,2,6,8,5,3,7,9,1,
7,1,3,9,2,4,8,5,6,
9,6,1,5,3,7,2,8,4,
2,8,7,4,1,9,6,3,5,
3,4,5,2,8,6,1,7,9"
sudoku = SudokuSolver.new string
sudoku.verify
