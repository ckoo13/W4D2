require_relative "piece"
require_relative "slideable"
require 'colorize'

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