require_relative "./piece.rb"

class Pawn < Piece
  
  def symbol 
    :Pawn
  end
  
  def moves
    current_row, current_col = self.pos
    moves = []
    
    #if white and at start pos (normal move)
    if self.color == "white" && at_start_row?
      possible_moves = [[current_row + 1, current_col], [current_row + 2, current_col]]
      moves += possible_moves.select { |pos| @board.valid_pos(pos) && board[pos].empty?}
    end
    #if black and at start pos (normal move)
    if self.color == "black" && at_start_row?
      possible_moves = [[current_row - 1, current_col], [current_row - 2, current_col]]
      moves += possible_moves.select { |pos| @board.valid_pos(pos) && board[pos].empty?}
    end

     #white and not at start pos (regular move)
    if self.color == "white" && !at_start_row?
      possible_moves = [[current_row + 1, current_col]]
      moves += possible_moves.select { |pos| @board.valid_pos(pos) && @board[pos].empty?}
    end
    
    #black and not at start pos (regular move)
    if self.color == "black" && !at_start_row?
      possible_moves = [[current_row -1, current_col]]
      moves += possible_moves.select { |pos| @board.valid_pos(pos) && @board[pos].empty?}
    end

    #attack moves
    possible_moves = side_attacks

    possible_moves.each do |pos|
      pos[0] += current_row
      pos[1] += current_col
    end

    possible_moves.each do |pos|
      if board.valid_pos(pos) && board[pos].color != self.color
        moves << pos
      end
    end

    moves

  end
  
  private 
  def at_start_row?
    if self.color == "white"
      if self.pos.first == 1
        return true
      else
        return false
      end
    else
      if self.pos.first == 6
        return true
      else
        return false
      end
    end
  end
  
  def forward_dir
    if self.color == "white"
      return 1
    else
      return -1
    end
  end

  def forward_steps
    if at_start_row
      return 2
    else
      return 1
    end
  end

  def side_attacks
    if self.color == 'white'
      attacks = [[1,1], [1,-1]]
    else
      attacks = [[-1,1], [-1,-1]]
    end

    attacks
  end 

end