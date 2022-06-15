require_relative "piece"
require_relative "stepable"

class King < Piece
include Stepable

  def symbol 
    :King
  end
  
  private 
  
  def move_diffs
      diffs = [[0 -1], [0, 1], [-1, 0], [1,0], [1,1], [-1,-1], [1,-1], [-1,1]]
  end
end