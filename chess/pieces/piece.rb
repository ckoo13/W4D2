class Piece

  attr_reader :color, :board, :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
      symbol
  end

  def empty?
    false
  end

  def valid_moves
      self.moves
  end

  def pos=(val)
    row, col = @pos
    @board[row][col] = val
  end

  def symbol
    raise 'not implemented'
  end

  def inspect
    symbol
  end

  private

  def move_into_check?(end_pos)
    
  end
end