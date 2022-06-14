require_relative "../piece.rb"
class Queen < Piece
  def symbol
    :Queen
  end

  private 
  def move_dirs
    horizontal_dirs + diagonal_dirs
  end
end