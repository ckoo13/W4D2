require_relative "piece"
require_relative "./pieces/nullpiece.rb"
require 'byebug'

class Board
  attr_reader :rows
  private
  attr_reader :null_piece
  
  def initialize
    @rows = Array.new(8) { Array.new(8, NullPiece)}

    (0..1).each do |i|
       (0..7).each do |j|
        @rows[i][j] = Piece.new
       end
    end

    (6..7).each do |i|
       (0..7).each do |j|
        @rows[i][j] = Piece.new
       end
    end
    @null_piece = NullPiece
  end

  def [](pos)
    row, col = pos
    @rows[row][col] 
  end

  def valid_pos(pos)
    # debugger
    row, col = pos
    if row < 0 || row > 7 || col < 0 || col > 7
      return false
    end

    true
  end

  def []=(pos, value)
    row, col = pos
    @rows[row][col] = value
  end
  
  def move_piece(start_pos, end_pos)
    debugger
    raise "invalid start position" if self[start_pos] == NullPiece || !valid_pos(start_pos)
    # Fix with piece logic later!!!!!
    raise "invalid ending position" if !valid_pos(end_pos)

    piece = self[start_pos]

    self[start_pos] = NullPiece
    self[end_pos] = piece

  end

end