require_relative "../piece.rb"
class Bishop < Piece
  def symbol
    :Bishop
  end

  private
  def move_dirs
    diagonal_dirs
  end
end