module Stepable

  def moves 
    #create array to collect moves
    moves = []
    current_row, current_col = pos
    #iterate through each of the piece's possible move_diffs
      move_diffs.each do |dx, dy|
         #or each move_diff, increment the piece's position to generate a new position
        new_row = current_row + dx
        new_col = current_col + dy

        new_pos = [new_row, new_col]

        #check if on the board and empty
        if board.valid_pos(new_pos) && board[new_pos].empty?
          moves << new_pos
        end

        #check if it contains a piece of the opposite color
        if board.valid_pos(new_pos) && board[new_pos].color != self.color
          moves << new_pos
        end
      end

      #return the final array of moves
      moves
  end

  private 

  def move_diffs 
    raise "not implemented"
  end
end