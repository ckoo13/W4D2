require_relative 'pieces'
require 'byebug'

class Board
  attr_reader :rows
  
  def initialize
    @rows = Array.new(8) { Array.new(8, NullPiece.instance)}

    #pawns on board
    @rows[1][0] = Pawn.new("white", self, [1,0])
    @rows[1][1] = Pawn.new("white", self, [1,1])
    @rows[1][2] = Pawn.new("white", self, [1,2])
    @rows[1][3] = Pawn.new("white", self, [1,3])
    @rows[1][4] = Pawn.new("white", self, [1,4])
    @rows[1][5] = Pawn.new("white", self, [1,5])
    @rows[1][6] = Pawn.new("white", self, [1,6])
    @rows[1][7] = Pawn.new("white", self, [1,7])
    @rows[6][0] = Pawn.new("black", self, [6,0])
    @rows[6][1] = Pawn.new("black", self, [6,1])
    @rows[6][2] = Pawn.new("black", self, [6,2])
    @rows[6][3] = Pawn.new("black", self, [6,3])
    @rows[6][4] = Pawn.new("black", self, [6,4])
    @rows[6][5] = Pawn.new("black", self, [6,5])
    @rows[6][6] = Pawn.new("black", self, [6,6])
    @rows[6][7] = Pawn.new("black", self, [6,7])
  

    #hard coding other pieces (white)
    @rows[0][0] = Rook.new("white", self, [0,0])
    @rows[0][1] = Knight.new("white", self, [0,1])
    @rows[0][2] = Bishop.new("white", self, [0,2])
    @rows[0][3] = King.new("white", self, [0,3])
    @rows[0][4] = Queen.new("white", self, [0,4])
    @rows[0][5] = Bishop.new("white", self, [0,5])
    @rows[0][6] = Knight.new("white", self, [0,6])
    @rows[0][7] = Rook.new("white", self, [0,7])

    #hard coding other pieces (black)
    @rows[7][0] = Rook.new("black", self, [7,0])
    @rows[7][1] = Knight.new("black", self, [7,1])
    @rows[7][2] = Bishop.new("black", self, [7,2])
    @rows[7][3] = King.new("black", self, [7,3])
    @rows[7][4] = Queen.new("black", self, [7,4])
    @rows[7][5] = Bishop.new("black", self, [7,5])
    @rows[7][6] = Knight.new("black", self, [7,6])
    @rows[7][7] = Rook.new("black", self, [7,7])


    @null_piece = NullPiece.instance
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
    
    #@rows[row][col].color != 
    true
  end

  def []=(pos, value)
    row, col = pos
    @rows[row][col] = value
  end
  
  def move_piece(color, start_pos, end_pos)
    raise 'invalid start position' if self[start_pos] == NullPiece.instance || !valid_pos(start_pos)
    raise "You can't move there" if !valid_pos(end_pos)

    piece = self[start_pos]

    if piece.color != color
      raise "that is not your piece"
    #   #if the moves of pieces does not include end_pos
    elsif !piece.valid_moves.include?(end_pos)
      raise "not a valid end position"
    end

    self[start_pos] = NullPiece.instance
    self[end_pos] = piece
    
  end

  private
  attr_reader :null_piece

end