require_relative "piece"

require "singleton"

class NullPiece < Piece

include Singleton

  def initialize
    @color = "blue"
  end

  def moves
    
  end

  def color
    @color
  end

  def symbol
    :"_"
  end

  def empty?
    true
  end
end