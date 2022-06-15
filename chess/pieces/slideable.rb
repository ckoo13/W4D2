module Slideable

  HORIZONTAL_DIRS = [[0,-1],[0,1], [-1,0], [1,0]]
  DIAGONAL_DIRS = [[-1,1],[1,-1],[1,1],[-1,-1]]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves 
    #returns an array of all possible moves that rook/bishop/queen can go to
      #not blocked && on the board
    
    #initialize array
    moves = []

    #adding each possible to moves using our recursive call on grow_unblocked_moves
    move_dirs.each do |dx, dy|
      moves += (grow_unblocked_moves_in_dir(dx, dy))
    end

    moves
    
  end

  private 

  def move_dirs 
    #returns an array of all possible starting directions that a piece can go to
    raise "did not override move_dirs"
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    current_row, current_col = pos
    moves = []
    loop do
    #we want to loop and keep adding dx + dy to our row and col
      #break if the new position is not a valid_pos?
      #stop if new position is occupied
    new_row = current_row + dx
    new_col = current_col + dy

    new_pos = [new_row, new_col]

    break if !board.valid_pos(new_pos)

    if board[new_pos].empty?
      moves << new_pos
    end
      #need to check if it is an enemy piece

    end

    moves
  end

end