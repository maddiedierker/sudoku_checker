class SudokuLogic
	attr_accessor :sudoku_board
	
	def initialize(sudoku_board)
		@sudoku_board = sudoku_board
	end
	
	def board_is_correct?()
		if !(row_checker() && column_checker() && square_checker)
			return false
		end
		true	
	end
	
	def board_logic_checker(arrays_to_check)
		arrays_to_check.each do |sub_array|
			if !sub_array.sort.eql?([1,2,3,4,5,6,7,8,9])
				return false
			end	
		end
		true
	end
	
	def get_board_rows(sudoku_board)
		array_of_rows = []
		sudoku_board.each { |row| array_of_rows << row }
	end
	
	def get_board_columns(sudoku_board)
		column_index = 0
		array_of_columns = []
		until column_index == 9
			row_index = 0
			until row_index == 9
				array_of_columns << sudoku_board[row_index][column_index]
				row_index += 1
			end
			column_index += 1
		end
		array_of_columns.each_slice(9).to_a
	end
	
	def get_square_starting_points(sudoku_board)
		square_starting_points = []
		row_index = 0
		column_index = 0
		3.times do
			3.times do
				square_starting_points << [row_index, column_index]
				column_index += 3
			end
			row_index += 3
			column_index = 0
		end
		square_starting_points
	end
	
	def get_board_squares(sudoku_board, square_starting_points)
		array_of_squares = []
		square_starting_points.each do |starting_point|
			row_index = starting_point[0]
			column_index = starting_point[1]
			3.times do
				3.times do
					array_of_squares << sudoku_board[row_index][column_index]
					column_index += 1
				end
				row_index += 1
				column_index = starting_point[1]
			end	
		end
		array_of_squares.each_slice(9).to_a
	end
	
	def row_checker()
		array_of_rows = get_board_rows(sudoku_board)
		board_logic_checker(array_of_rows)
	end
	
	def column_checker()
		array_of_columns = get_board_columns(sudoku_board)
		board_logic_checker(array_of_columns)
	end
	
	def square_checker()
		square_starting_points = get_square_starting_points(sudoku_board)
		array_of_squares = get_board_squares(sudoku_board, square_starting_points)
		board_logic_checker(array_of_squares)
	end
end