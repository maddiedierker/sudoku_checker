# sudoku_checker
## Checks if a sudoku puzzle was solved correctly
### Takes in 9 rows of a .txt file to create a 9x9 sudoku board, then tests the file horizonally, vertically, and in 3x3 squares to determine whether the file has a correctly-solved sudoku puzzle.
#### To use, run 'sudoku_checker.rb' with the file you want to test as your argument.
##### EXAMPLE: Run 'ruby sudoku_checker.rb sudoku_example1.txt'
##### This will return 'You solved the sudoku!' because all rows, columns, and 3x3 squares in 'sudoku_example1.txt' contain the values 1-9.
##### If you run 'sudoku_example2.txt', it will return 'Your sudoku has not been solved!' because it is not solved correctly.
