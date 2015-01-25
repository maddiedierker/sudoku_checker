class SudokuLogic
	attr_accessor :sudoku_board
	
	def initialize(sudoku_board)
		@sudoku_board = sudoku_board
	end
	
    # return boolean to determine whether or not board is correct horizontally, vertically, and on 3x3 squares
	def board_is_correct?()
		_row_checker() && _column_checker() && _square_checker
	end
	
    private
    # checks two-dimensional array to determine if all rows/columns/squares contain values 1-9
	def _board_logic_checker(arrays_to_check)
		arrays_to_check.each do |sub_array|
			if !sub_array.sort.eql?([1,2,3,4,5,6,7,8,9])
				return false
			end	
		end
		true
	end
    
    # checkers get 2D arrays of rows, columns, and squares then performs logic to check if solved correctly
    def _row_checker()
        array_of_rows = _get_board_rows()
        _board_logic_checker(array_of_rows)
    end
    
    def _column_checker()
        array_of_columns = _get_board_columns()
        _board_logic_checker(array_of_columns)
    end
    
    def _square_checker()
        square_starting_points = _get_square_starting_points()
        array_of_squares = _get_board_squares(square_starting_points)
        _board_logic_checker(array_of_squares)
    end
	
    # create 2D array of all rows on the board
	def _get_board_rows()
		array_of_rows = []
		sudoku_board.each { |row| array_of_rows << row }
	end
	
    # create 2D array of all columns on the board
	def _get_board_columns()
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
	
    # find starting point of each 3x3 square
	def _get_square_starting_points()
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
	
    # iterate 3x horizontally and 3x vertically to create 3x3 square using the starting point
    # create 2D array of all squares on the board
	def _get_board_squares(square_starting_points)
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
end