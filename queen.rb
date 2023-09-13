require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable
  

  def symbol
    '♛'
  end

  protected

  def all_possible_moves
    @horizontal_dirs.concat(@diagonal_dirs)
  end

  def move_dirs
    self.all_possible_moves
  end
end