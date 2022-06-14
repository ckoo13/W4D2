require_relative "../piece.rb"
require "singleton"

class NullPiece < Piece

include Singleton

  attr_reader :color

  def initialize
    @color = color
  end

  def moves
    
  end

  def symbol
    :NUll
  end
end