require './sudoku_board_builder'
require './sudoku_logic'

sudoku_board_to_check = ARGF.readlines

sudoku_board = BoardBuilder.build_sudoku_board(sudoku_board_to_check)

submitted_sudoku_board = SudokuLogic.new(sudoku_board)

checked_sudoku_board = submitted_sudoku_board.board_is_correct?()
	if checked_sudoku_board == false
		puts "Your sudoku has not been solved!"
	else
		puts "You solved the sudoku!"
	end