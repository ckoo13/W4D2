require_relative "piece"
require_relative "stepable"
class Knight < Piece
include Stepable

  def symbol 
    :Knight
  end
  
  private 
  
  def move_diffs
      diffs = [[-2,1], [-1,2], [2,1], [1,2], [2,-1], [1,-2], [-1,-2], [-2,-1]]
  end
end