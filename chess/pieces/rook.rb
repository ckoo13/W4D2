require_relative "../piece.rb"
require "Slideable"

class Rook < Piece

include Slideable

  def symbol
    :Rook
  end

  private 
  def move_dirs
    horizontal_dirs
  end
end

#the rook class has access to all the variables in the piece class
 #board, pos, color
 #