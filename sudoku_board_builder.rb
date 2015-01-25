class BoardBuilder
	def self.build_sudoku_board(board_to_check)
		row_index = 0
		rows = []
		until row_index == 9
			rows[row_index] = board_to_check[row_index].chomp.chomp.split('').map{|number| number.to_i}
			row_index += 1
		end
		rows
	end
end