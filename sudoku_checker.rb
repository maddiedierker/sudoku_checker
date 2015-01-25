require './sudoku_board_builder'
require './sudoku_logic'

board_to_check = ARGF.readlines

# changes argument file to array--each index is a row of the sudoku board
sudoku_board = BoardBuilder.build_board(board_to_check)

# create new board object to perform logic to determine if solved correctly
submitted_sudoku_board = SudokuLogic.new(sudoku_board)

# output to user if board is correct/incorrect horizontally, vertically, and across 3x3 squares 
if !submitted_sudoku_board.board_is_correct?()
    puts "Your sudoku has not been solved!"
else
    puts "You solved the sudoku!"
end